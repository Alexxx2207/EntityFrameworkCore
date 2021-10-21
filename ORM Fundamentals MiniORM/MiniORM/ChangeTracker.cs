using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Reflection;

namespace MiniORM
{
    public class ChangeTracker<T>
        where T: class, new()
    {
        private readonly List<T> allEntities;

        private readonly List<T> addedEntities;

        private readonly List<T> removedEntitites;

        public ChangeTracker(IEnumerable<T> paramEntitites)
        {
            addedEntities = new List<T>();
            removedEntitites = new List<T>();

            allEntities = CloneEntities(paramEntitites);
        }

        public IReadOnlyCollection<T> AllEntities => allEntities.AsReadOnly();

        public IReadOnlyCollection<T> Added => addedEntities.AsReadOnly();

        public IReadOnlyCollection<T> Removed => removedEntitites.AsReadOnly();

        public void Add(T item) => addedEntities.Add(item);
       
        public void Remove(T item) => addedEntities.Remove(item);

        public IEnumerable<T> GetModifiedEntities(DbSet<T> dbSet)
        {
            var modifiedEntities = new List<T>();

            var primaryKeys = typeof(T).GetProperties()
                        .Where(prop => prop.HasAttribute<KeyAttribute>()).ToArray();

            foreach (var proxyEntity in AllEntities)
            {
                var primaryKeyValues = GetPrimaryKeyValues(primaryKeys, proxyEntity).ToArray();

                var entity = dbSet.Entities.Single(e => GetPrimaryKeyValues(primaryKeys, e).SequenceEqual(GetPrimaryKeyValues(primaryKeys, proxyEntity)));

                var isModified = IsModified(proxyEntity, entity);

                if (isModified)
                {
                    modifiedEntities.Add(entity);
                }
            }

            return modifiedEntities;
        }

        private static bool IsModified(T entity, T proxyEntity)
        {
            PropertyInfo[] monitoredProperties = typeof(T).GetProperties()
                    .Where(p => DbContext.AllowedSqlTypes.Contains(p.PropertyType)).ToArray();

            var modifiedProperties = monitoredProperties
                   .Where(prop => !Equals(prop.GetValue(entity), prop.GetValue(proxyEntity)));

            return modifiedProperties.Any();
        }

        private static IEnumerable<object> GetPrimaryKeyValues(IEnumerable<PropertyInfo> properties, T entity)
        {
            return properties.Select(pk => pk.GetValue(entity));
        }

        private static List<T> CloneEntities(IEnumerable<T> entities)
        {
            var clonedEntities = new List<T>();

            PropertyInfo[] propertiesToClone = typeof(T).GetProperties()
                    .Where(prop => DbContext.AllowedSqlTypes.Contains(prop.PropertyType)).ToArray();

            foreach (var entity in entities)
            {
                var clonedEntity = Activator.CreateInstance<T>();

                foreach (var prop in propertiesToClone)
                {
                    var value = prop.GetValue(entity);
                    prop.SetValue(clonedEntity, value);
                }

                clonedEntities.Add(clonedEntity);
            }
            return clonedEntities;
        }

    }
}