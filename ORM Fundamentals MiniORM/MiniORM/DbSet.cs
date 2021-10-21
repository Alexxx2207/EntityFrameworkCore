using System.Collections.Generic;
using System;
using System.Collections;
using System.Linq;

namespace MiniORM
{
    public class DbSet<TEntity> : ICollection<TEntity>
        where TEntity : class, new()
    {
        internal IList<TEntity> Entities { get; set; }

        internal ChangeTracker<TEntity> ChangeTracker { get; set; }

        public DbSet(IEnumerable<TEntity> entities)
        {
            Entities = entities.ToList();

            ChangeTracker = new ChangeTracker<TEntity>(entities);
        }

        public int Count => Entities.Count();

        public bool IsReadOnly => Entities.IsReadOnly;

        public void Add(TEntity item)
        {
            if (item == null)
                throw new ArgumentException(nameof(item), "Item cannot be null!");

            Entities.Add(item);

            ChangeTracker.Add(item);
        }

        public void Clear()
        {
            while (Entities.Any())
            {
                this.Remove(Entities.First());
            }
        }

        public bool Contains(TEntity item)
        {
            return Entities.Contains(item);
        }

        public void CopyTo(TEntity[] array, int arrayIndex)
        {
            Entities.CopyTo(array, arrayIndex);
        }

        public IEnumerator<TEntity> GetEnumerator()
        {
            return Entities.GetEnumerator();
        }

        public bool Remove(TEntity item)
        {
            if (item is null)
                throw new ArgumentException(nameof(item), "Item cannot be null!");

            var removedStatus = Entities.Remove(item);

            if (removedStatus)
            {
                ChangeTracker.Remove(item);
            }

            return removedStatus;
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return this.GetEnumerator();
        }

        public void RemoveRange(IEnumerable<TEntity> entities)
        {
            foreach (var entity in entities)
            {
                this.Remove(entity);
            }
        }
    }
}