USE [SoftUni]
GO
ALTER TABLE [dbo].[EmployeesProjects] DROP CONSTRAINT [FK_EmployeesProjects_Projects]
GO
ALTER TABLE [dbo].[EmployeesProjects] DROP CONSTRAINT [FK_EmployeesProjects_Employees]
GO
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT [FK_Employees_Employees]
GO
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT [FK_Employees_Departments]
GO
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT [FK_Employees_Addresses]
GO
ALTER TABLE [dbo].[Departments] DROP CONSTRAINT [FK_Departments_Employees]
GO
ALTER TABLE [dbo].[Addresses] DROP CONSTRAINT [FK_Addresses_Towns]
GO
/****** Object:  Table [dbo].[Towns]    Script Date: 10/24/2021 12:56:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Towns]') AND type in (N'U'))
DROP TABLE [dbo].[Towns]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 10/24/2021 12:56:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Projects]') AND type in (N'U'))
DROP TABLE [dbo].[Projects]
GO
/****** Object:  Table [dbo].[EmployeesProjects]    Script Date: 10/24/2021 12:56:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmployeesProjects]') AND type in (N'U'))
DROP TABLE [dbo].[EmployeesProjects]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 10/24/2021 12:56:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
DROP TABLE [dbo].[Employees]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 10/24/2021 12:56:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Departments]') AND type in (N'U'))
DROP TABLE [dbo].[Departments]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 10/24/2021 12:56:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Addresses]') AND type in (N'U'))
DROP TABLE [dbo].[Addresses]
GO
USE [master]
GO
/****** Object:  Database [SoftUni]    Script Date: 10/24/2021 12:56:03 PM ******/
DROP DATABASE [SoftUni]
GO
/****** Object:  Database [SoftUni]    Script Date: 10/24/2021 12:56:03 PM ******/
CREATE DATABASE [SoftUni]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SoftUni', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SoftUni.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SoftUni_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SoftUni_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SoftUni] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SoftUni].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SoftUni] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SoftUni] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SoftUni] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SoftUni] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SoftUni] SET ARITHABORT OFF 
GO
ALTER DATABASE [SoftUni] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SoftUni] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SoftUni] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SoftUni] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SoftUni] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SoftUni] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SoftUni] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SoftUni] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SoftUni] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SoftUni] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SoftUni] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SoftUni] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SoftUni] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SoftUni] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SoftUni] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SoftUni] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SoftUni] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SoftUni] SET RECOVERY FULL 
GO
ALTER DATABASE [SoftUni] SET  MULTI_USER 
GO
ALTER DATABASE [SoftUni] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SoftUni] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SoftUni] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SoftUni] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SoftUni] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SoftUni] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SoftUni', N'ON'
GO
ALTER DATABASE [SoftUni] SET QUERY_STORE = OFF
GO
USE [SoftUni]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 10/24/2021 12:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[AddressText] [varchar](100) NOT NULL,
	[TownID] [int] NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 10/24/2021 12:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ManagerID] [int] NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 10/24/2021 12:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[MiddleName] [varchar](50) NULL,
	[JobTitle] [varchar](50) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[ManagerID] [int] NULL,
	[HireDate] [smalldatetime] NOT NULL,
	[Salary] [money] NOT NULL,
	[AddressID] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeesProjects]    Script Date: 10/24/2021 12:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeesProjects](
	[EmployeeID] [int] NOT NULL,
	[ProjectID] [int] NOT NULL,
 CONSTRAINT [PK_EmployeesProjects] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 10/24/2021 12:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [ntext] NULL,
	[StartDate] [smalldatetime] NOT NULL,
	[EndDate] [smalldatetime] NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Towns]    Script Date: 10/24/2021 12:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Towns](
	[TownID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Towns] PRIMARY KEY CLUSTERED 
(
	[TownID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (1, N'108 Lakeside Court', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (2, N'1343 Prospect St', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (3, N'1648 Eastgate Lane', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (4, N'2284 Azalea Avenue', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (5, N'2947 Vine Lane', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (6, N'3067 Maya', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (7, N'3197 Thornhill Place', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (8, N'3284 S. Blank Avenue', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (9, N'332 Laguna Niguel', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (10, N'3454 Bel Air Drive', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (11, N'3670 All Ways Drive', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (12, N'3708 Montana', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (13, N'3711 Rollingwood Dr', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (14, N'3919 Pinto Road', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (15, N'4311 Clay Rd', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (16, N'4777 Rockne Drive', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (17, N'5678 Clear Court', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (18, N'5863 Sierra', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (19, N'6058 Hill Street', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (20, N'6118 Grasswood Circle', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (21, N'620 Woodside Ct.', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (22, N'6307 Greenbelt Way', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (23, N'6448 Castle Court', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (24, N'6774 Bonanza', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (25, N'6968 Wren Ave.', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (26, N'7221 Peachwillow Street', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (27, N'7270 Pepper Way', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (28, N'7396 Stratton Circle', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (29, N'7808 Brown St.', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (30, N'7902 Grammercy Lane', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (31, N'8668 Via Neruda', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (32, N'8684 Military East', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (33, N'8751 Norse Drive', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (34, N'9320 Teakwood Dr.', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (35, N'9435 Breck Court', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (36, N'9745 Bonita Ct.', 5)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (37, N'Pascalstr 951', 31)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (38, N'94, rue Descartes', 30)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (39, N'1226 Shoe St.', 8)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (40, N'1399 Firestone Drive', 8)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (41, N'1902 Santa Cruz', 8)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (42, N'1970 Napa Ct.', 8)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (43, N'250 Race Court', 8)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (44, N'5672 Hale Dr.', 8)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (45, N'5747 Shirley Drive', 8)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (46, N'6387 Scenic Avenue', 8)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (47, N'6872 Thornwood Dr.', 8)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (48, N'7484 Roundtree Drive', 8)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (49, N'8157 W. Book', 8)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (50, N'9539 Glenside Dr', 8)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (51, N'9833 Mt. Dias Blv.', 8)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (52, N'10203 Acorn Avenue', 2)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (53, N'3997 Via De Luna', 23)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (54, N'Downshire Way', 23)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (55, N'1411 Ranch Drive', 15)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (56, N'3074 Arbor Drive', 15)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (57, N'390 Ridgewood Ct.', 15)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (58, N'9666 Northridge Ct.', 15)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (59, N'9752 Jeanne Circle', 15)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (60, N'8154 Via Mexico', 27)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (61, N'80 Sunview Terrace', 26)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (62, N'1825 Corte Del Prado', 17)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (63, N'2598 La Vista Circle', 17)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (64, N'3421 Bouncing Road', 17)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (65, N'3977 Central Avenue', 17)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (66, N'5086 Nottingham Place', 17)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (67, N'5379 Treasure Island Way', 17)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (68, N'8209 Green View Court', 17)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (69, N'8463 Vista Avenue', 17)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (70, N'9693 Mellowood Street', 17)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (71, N'991 Vista Verde', 17)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (72, N'1061 Buskrik Avenue', 3)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (73, N'172 Turning Dr.', 3)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (74, N'2038 Encino Drive', 3)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (75, N'2046 Las Palmas', 3)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (76, N'2059 Clay Rd', 3)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (77, N'207 Berry Court', 3)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (78, N'2080 Sycamore Drive', 3)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (79, N'2466 Clearland Circle', 3)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (80, N'2687 Ridge Road', 3)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (81, N'2812 Mazatlan', 3)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (82, N'3026 Anchor Drive', 3)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (83, N'3281 Hillview Dr.', 3)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (84, N'3632 Bank Way', 3)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (85, N'371 Apple Dr.', 3)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (86, N'504 O St.', 3)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (87, N'5423 Champion Rd.', 3)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (88, N'6057 Hill Street', 3)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (89, N'6870 D Bel Air Drive', 3)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (90, N'7338 Green St.', 3)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (91, N'7511 Cooper Dr.', 3)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (92, N'8152 Claudia Dr.', 3)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (93, N'8411 Mt. Orange Place', 3)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (94, N'9277 Country View Lane', 3)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (95, N'9784 Mt Etna Drive', 3)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (96, N'9825 Coralie Drive', 3)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (97, N'1185 Dallas Drive', 7)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (98, N'1362 Somerset Place', 7)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (99, N'181 Gaining Drive', 7)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (100, N'1962 Cotton Ct.', 7)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (101, N'2176 Apollo Way', 7)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (102, N'2294 West 39th St.', 7)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (103, N'3238 Laguna Circle', 7)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (104, N'3385 Crestview Drive', 7)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (105, N'3665 Oak Creek Ct.', 7)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (106, N'3928 San Francisco', 7)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (107, N'475 Santa Maria', 7)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (108, N'5242 Marvelle Ln.', 7)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (109, N'5452 Corte Gilberto', 7)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (110, N'6629 Polson Circle', 7)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (111, N'7640 First Ave.', 7)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (112, N'7883 Missing Canyon Court', 7)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (113, N'8624 Pepper Way', 7)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (114, N'9241 St George Dr.', 7)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (115, N'213 Stonewood Drive', 18)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (116, N'2425 Notre Dame Ave', 18)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (117, N'3884 Beauty Street', 18)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (118, N'8036 Summit View Dr.', 18)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (119, N'9605 Pheasant Circle', 18)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (120, N'1245 Clay Road', 10)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (121, N'1748 Bird Drive', 10)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (122, N'310 Winter Lane', 10)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (123, N'3127 El Camino Drive', 10)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (124, N'3514 Sunshine', 10)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (125, N'1144 Paradise Ct.', 6)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (126, N'1921 Ranch Road', 6)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (127, N'3333 Madhatter Circle', 6)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (128, N'342 San Simeon', 6)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (129, N'3848 East 39th Street', 6)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (130, N'5256 Chickpea Ct.', 6)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (131, N'5979 El Pueblo', 6)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (132, N'6580 Poor Ridge Court', 6)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (133, N'7435 Ricardo', 6)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (134, N'7691 Benedict Ct.', 6)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (135, N'7772 Golden Meadow', 6)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (136, N'8585 Los Gatos Ct.', 6)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (137, N'9314 Icicle Way', 6)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (138, N'9530 Vine Lane', 6)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (139, N'989 Crown Ct', 6)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (140, N'25 95th Ave NE', 20)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (141, N'4095 Cooper Dr.', 20)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (142, N'4155 Working Drive', 20)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (143, N'463 H Stagecoach Rd.', 20)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (144, N'5050 Mt. Wilson Way', 20)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (145, N'5203 Virginia Lane', 20)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (146, N'5458 Gladstone Drive', 20)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (147, N'5553 Cash Avenue', 20)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (148, N'5669 Ironwood Way', 20)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (149, N'6697 Ridge Park Drive', 20)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (150, N'7048 Laurel', 20)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (151, N'8192 Seagull Court', 20)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (152, N'350 Pastel Drive', 22)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (153, N'34 Waterloo Road', 21)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (154, N'8291 Crossbow Way', 28)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (155, N'5678 Lakeview Blvd.', 24)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (156, N'1356 Grove Way', 12)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (157, N'158 Walnut Ave', 12)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (158, N'1792 Belmont Rd.', 12)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (159, N'2275 Valley Blvd.', 12)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (160, N'3747 W. Landing Avenue', 12)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (161, N'3841 Silver Oaks Place', 12)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (162, N'4566 La Jolla', 12)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (163, N'4734 Sycamore Court', 12)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (164, N'5030 Blue Ridge Dr.', 12)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (165, N'5734 Ashford Court', 12)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (166, N'7726 Driftwood Drive', 12)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (167, N'8310 Ridge Circle', 12)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (168, N'896 Southdale', 12)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (169, N'9652 Los Angeles', 12)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (170, N'2487 Riverside Drive', 19)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (171, N'1397 Paradise Ct.', 14)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (172, N'1400 Gate Drive', 14)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (173, N'3030 Blackburn Ct.', 14)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (174, N'4350 Minute Dr.', 14)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (175, N'8967 Hamilton Ave.', 14)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (176, N'9297 Kenston Dr.', 14)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (177, N'9687 Shakespeare Drive', 14)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (178, N'9100 Sheppard Avenue North', 29)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (179, N'636 Vine Hill Way', 25)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (180, N'101 Candy Rd.', 1)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (181, N'1275 West Street', 1)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (182, N'2137 Birchwood Dr', 1)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (183, N'2383 Pepper Drive', 1)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (184, N'2427 Notre Dame Ave.', 1)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (185, N'2482 Buckingham Dr.', 1)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (186, N'3066 Wallace Dr.', 1)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (187, N'3397 Rancho View Drive', 1)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (188, N'3768 Door Way', 1)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (189, N'4909 Poco Lane', 1)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (190, N'6369 Ellis Street', 1)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (191, N'6891 Ham Drive', 1)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (192, N'7297 RisingView', 1)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (193, N'8000 Crane Court', 1)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (194, N'8040 Hill Ct', 1)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (195, N'8467 Clifford Court', 1)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (196, N'9006 Woodside Way', 1)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (197, N'9322 Driving Drive', 1)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (198, N'9863 Ridge Place', 1)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (199, N'9882 Clay Rde', 1)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (200, N'9906 Oak Grove Road', 1)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (201, N'1378 String Dr', 13)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (202, N'1803 Olive Hill', 13)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (203, N'2176 Brown Street', 13)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (204, N'2266 Greenwood Circle', 13)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (205, N'2598 Breck Court', 13)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (206, N'2736 Scramble Rd', 13)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (207, N'4312 Cambridge Drive', 13)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (208, N'5009 Orange Street', 13)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (209, N'5670 Bel Air Dr.', 13)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (210, N'5980 Icicle Circle', 13)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (211, N'6510 Hacienda Drive', 13)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (212, N'6937 E. 42nd Street', 13)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (213, N'7165 Brock Lane', 13)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (214, N'7559 Worth Ct.', 13)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (215, N'7985 Center Street', 13)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (216, N'9495 Limewood Place', 13)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (217, N'9533 Working Drive', 13)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (218, N'177 11th Ave', 16)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (219, N'1962 Ferndale Lane', 16)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (220, N'2473 Orchard Way', 16)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (221, N'4096 San Remo', 16)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (222, N'4310 Kenston Dr.', 16)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (223, N'4444 Pepper Way', 16)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (224, N'4525 Benedict Ct.', 16)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (225, N'5263 Etcheverry Dr', 16)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (226, N'535 Greendell Pl', 16)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (227, N'6871 Thornwood Dr.', 16)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (228, N'6951 Harmony Way', 16)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (229, N'7086 O St.', 16)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (230, N'7145 Matchstick Drive', 16)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (231, N'7820 Bird Drive', 16)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (232, N'7939 Bayview Court', 16)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (233, N'8316 La Salle St.', 16)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (234, N'9104 Mt. Sequoia Ct.', 16)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (235, N'1234 Seaside Way', 9)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (236, N'5725 Glaze Drive', 9)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (237, N'1064 Slow Creek Road', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (238, N'1102 Ravenwood', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (239, N'1220 Bradford Way', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (240, N'1349 Steven Way', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (241, N'136 Balboa Court', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (242, N'137 Mazatlan', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (243, N'1398 Yorba Linda', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (244, N'1619 Stillman Court', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (245, N'2144 San Rafael', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (246, N'2354 Frame Ln.', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (247, N'2639 Anchor Court', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (248, N'3029 Pastime Dr', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (249, N'3243 Buckingham Dr.', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (250, N'426 San Rafael', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (251, N'4598 Manila Avenue', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (252, N'4948 West 4th St', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (253, N'502 Alexander Pl.', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (254, N'5025 Holiday Hills', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (255, N'5125 Cotton Ct.', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (256, N'5375 Clearland Circle', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (257, N'5376 Catanzaro Way', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (258, N'5407 Cougar Way', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (259, N'5666 Hazelnut Lane', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (260, N'5802 Ampersand Drive', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (261, N'6498 Mining Rd.', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (262, N'6578 Woodhaven Ln.', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (263, N'6657 Sand Pointe Lane', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (264, N'6843 San Simeon Dr.', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (265, N'7126 Ending Ct.', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (266, N'7127 Los Gatos Court', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (267, N'7166 Brock Lane', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (268, N'7403 N. Broadway', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (269, N'7439 Laguna Niguel', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (270, N'7594 Alexander Pl.', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (271, N'7616 Honey Court', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (272, N'77 Birchwood', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (273, N'7765 Sunsine Drive', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (274, N'7842 Ygnacio Valley Road', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (275, N'8290 Margaret Ct.', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (276, N'8656 Lakespring Place', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (277, N'874 Olivera Road', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (278, N'931 Corte De Luna', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (279, N'9537 Ridgewood Drive', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (280, N'9964 North Ridge Drive', 4)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (281, N'1285 Greenbrier Street', 11)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (282, N'2115 Passing', 11)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (283, N'2601 Cambridge Drive', 11)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (284, N'3114 Notre Dame Ave.', 11)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (285, N'3280 Pheasant Circle', 11)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (286, N'4231 Spar Court', 11)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (287, N'4852 Chaparral Court', 11)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (288, N'5724 Victory Lane', 11)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (289, N'591 Merriewood Drive', 11)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (290, N'7230 Vine Maple Street', 11)
GO
INSERT [dbo].[Addresses] ([AddressID], [AddressText], [TownID]) VALUES (291, N'163 Nishava Str, ent A, apt. 1', 32)
GO
SET IDENTITY_INSERT [dbo].[Addresses] OFF
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 
GO
INSERT [dbo].[Departments] ([DepartmentID], [Name], [ManagerID]) VALUES (1, N'Engineering', 12)
GO
INSERT [dbo].[Departments] ([DepartmentID], [Name], [ManagerID]) VALUES (2, N'Tool Design', 4)
GO
INSERT [dbo].[Departments] ([DepartmentID], [Name], [ManagerID]) VALUES (3, N'Sales', 273)
GO
INSERT [dbo].[Departments] ([DepartmentID], [Name], [ManagerID]) VALUES (4, N'Marketing', 46)
GO
INSERT [dbo].[Departments] ([DepartmentID], [Name], [ManagerID]) VALUES (5, N'Purchasing', 6)
GO
INSERT [dbo].[Departments] ([DepartmentID], [Name], [ManagerID]) VALUES (6, N'Research and Development', 42)
GO
INSERT [dbo].[Departments] ([DepartmentID], [Name], [ManagerID]) VALUES (7, N'Production', 148)
GO
INSERT [dbo].[Departments] ([DepartmentID], [Name], [ManagerID]) VALUES (8, N'Production Control', 21)
GO
INSERT [dbo].[Departments] ([DepartmentID], [Name], [ManagerID]) VALUES (9, N'Human Resources', 30)
GO
INSERT [dbo].[Departments] ([DepartmentID], [Name], [ManagerID]) VALUES (10, N'Finance', 3)
GO
INSERT [dbo].[Departments] ([DepartmentID], [Name], [ManagerID]) VALUES (11, N'Information Services', 42)
GO
INSERT [dbo].[Departments] ([DepartmentID], [Name], [ManagerID]) VALUES (12, N'Document Control', 90)
GO
INSERT [dbo].[Departments] ([DepartmentID], [Name], [ManagerID]) VALUES (13, N'Quality Assurance', 274)
GO
INSERT [dbo].[Departments] ([DepartmentID], [Name], [ManagerID]) VALUES (14, N'Facilities and Maintenance', 218)
GO
INSERT [dbo].[Departments] ([DepartmentID], [Name], [ManagerID]) VALUES (15, N'Shipping and Receiving', 85)
GO
INSERT [dbo].[Departments] ([DepartmentID], [Name], [ManagerID]) VALUES (16, N'Executive', 109)
GO
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (1, N'Guy', N'Gilbert', N'R', N'Production Technician', 7, 16, CAST(N'1998-07-31T00:00:00' AS SmallDateTime), 12500.0000, 166)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (2, N'Kevin', N'Brown', N'F', N'Marketing Assistant', 4, 6, CAST(N'1999-02-26T00:00:00' AS SmallDateTime), 13500.0000, 102)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (3, N'Roberto', N'Tamburello', NULL, N'Engineering Manager', 1, 12, CAST(N'1999-12-12T00:00:00' AS SmallDateTime), 43300.0000, 193)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (4, N'Rob', N'Walters', NULL, N'Senior Tool Designer', 2, 3, CAST(N'2000-01-05T00:00:00' AS SmallDateTime), 29800.0000, 155)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (5, N'Thierry', N'D''Hers', N'B', N'Tool Designer', 2, 263, CAST(N'2000-01-11T00:00:00' AS SmallDateTime), 25000.0000, 40)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (6, N'David', N'Bradley', N'M', N'Marketing Manager', 5, 109, CAST(N'2000-01-20T00:00:00' AS SmallDateTime), 37500.0000, 199)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (7, N'JoLynn', N'Dobney', N'M', N'Production Supervisor', 7, 21, CAST(N'2000-01-26T00:00:00' AS SmallDateTime), 25000.0000, 275)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (8, N'Ruth', N'Ellerbrock', N'Ann', N'Production Technician', 7, 185, CAST(N'2000-02-06T00:00:00' AS SmallDateTime), 13500.0000, 108)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (9, N'Gail', N'Erickson', N'A', N'Design Engineer', 1, 3, CAST(N'2000-02-06T00:00:00' AS SmallDateTime), 32700.0000, 22)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (10, N'Barry', N'Johnson', N'K', N'Production Technician', 7, 185, CAST(N'2000-02-07T00:00:00' AS SmallDateTime), 13500.0000, 285)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (11, N'Jossef', N'Goldberg', N'H', N'Design Engineer', 1, 3, CAST(N'2000-02-24T00:00:00' AS SmallDateTime), 32700.0000, 214)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (12, N'Terri', N'Duffy', N'Lee', N'Vice President of Engineering', 1, 109, CAST(N'2000-03-03T00:00:00' AS SmallDateTime), 63500.0000, 209)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (13, N'Sidney', N'Higa', N'M', N'Production Technician', 7, 185, CAST(N'2000-03-05T00:00:00' AS SmallDateTime), 13500.0000, 73)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (14, N'Taylor', N'Maxwell', N'R', N'Production Supervisor', 7, 21, CAST(N'2000-03-11T00:00:00' AS SmallDateTime), 25000.0000, 82)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (15, N'Jeffrey', N'Ford', N'L', N'Production Technician', 7, 185, CAST(N'2000-03-23T00:00:00' AS SmallDateTime), 13500.0000, 156)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (16, N'Jo', N'Brown', N'A', N'Production Supervisor', 7, 21, CAST(N'2000-03-30T00:00:00' AS SmallDateTime), 25000.0000, 70)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (17, N'Doris', N'Hartwig', N'M', N'Production Technician', 7, 185, CAST(N'2000-04-11T00:00:00' AS SmallDateTime), 13500.0000, 144)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (18, N'John', N'Campbell', N'T', N'Production Supervisor', 7, 21, CAST(N'2000-04-18T00:00:00' AS SmallDateTime), 25000.0000, 245)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (19, N'Diane', N'Glimp', N'R', N'Production Technician', 7, 185, CAST(N'2000-04-29T00:00:00' AS SmallDateTime), 13500.0000, 184)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (20, N'Steven', N'Selikoff', N'T', N'Production Technician', 7, 173, CAST(N'2001-01-02T00:00:00' AS SmallDateTime), 9500.0000, 104)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (21, N'Peter', N'Krebs', N'J', N'Production Control Manager', 8, 148, CAST(N'2001-01-02T00:00:00' AS SmallDateTime), 24500.0000, 11)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (22, N'Stuart', N'Munson', N'V', N'Production Technician', 7, 197, CAST(N'2001-01-03T00:00:00' AS SmallDateTime), 10000.0000, 36)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (23, N'Greg', N'Alderson', N'F', N'Production Technician', 7, 197, CAST(N'2001-01-03T00:00:00' AS SmallDateTime), 10000.0000, 18)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (24, N'David', N'Johnson', N'', N'Production Technician', 7, 184, CAST(N'2001-01-03T00:00:00' AS SmallDateTime), 9500.0000, 142)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (25, N'Zheng', N'Mu', N'W', N'Production Supervisor', 7, 21, CAST(N'2001-01-04T00:00:00' AS SmallDateTime), 25000.0000, 278)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (26, N'Ivo', N'Salmre', N'William', N'Production Technician', 7, 108, CAST(N'2001-01-05T00:00:00' AS SmallDateTime), 14000.0000, 165)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (27, N'Paul', N'Komosinski', N'B', N'Production Technician', 7, 87, CAST(N'2001-01-05T00:00:00' AS SmallDateTime), 15000.0000, 32)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (28, N'Ashvini', N'Sharma', N'R', N'Network Administrator', 11, 150, CAST(N'2001-01-05T00:00:00' AS SmallDateTime), 32500.0000, 133)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (29, N'Kendall', N'Keil', N'C', N'Production Technician', 7, 14, CAST(N'2001-01-06T00:00:00' AS SmallDateTime), 11000.0000, 257)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (30, N'Paula', N'Barreto de Mattos', N'M', N'Human Resources Manager', 9, 140, CAST(N'2001-01-07T00:00:00' AS SmallDateTime), 27100.0000, 2)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (31, N'Alejandro', N'McGuel', N'E', N'Production Technician', 7, 210, CAST(N'2001-01-07T00:00:00' AS SmallDateTime), 15000.0000, 274)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (32, N'Garrett', N'Young', N'R', N'Production Technician', 7, 184, CAST(N'2001-01-08T00:00:00' AS SmallDateTime), 9500.0000, 283)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (33, N'Jian Shuo', N'Wang', NULL, N'Production Technician', 7, 135, CAST(N'2001-01-08T00:00:00' AS SmallDateTime), 9500.0000, 160)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (34, N'Susan', N'Eaton', N'W', N'Stocker', 15, 85, CAST(N'2001-01-08T00:00:00' AS SmallDateTime), 9000.0000, 204)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (35, N'Vamsi', N'Kuppa', N'', N'Shipping and Receiving Clerk', 15, 85, CAST(N'2001-01-08T00:00:00' AS SmallDateTime), 9500.0000, 51)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (36, N'Alice', N'Ciccu', N'O', N'Production Technician', 7, 38, CAST(N'2001-01-08T00:00:00' AS SmallDateTime), 11000.0000, 284)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (37, N'Simon', N'Rapier', N'D', N'Production Technician', 7, 7, CAST(N'2001-01-09T00:00:00' AS SmallDateTime), 12500.0000, 64)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (38, N'Jinghao', N'Liu', N'K', N'Production Supervisor', 7, 21, CAST(N'2001-01-09T00:00:00' AS SmallDateTime), 25000.0000, 55)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (39, N'Michael', N'Hines', N'T', N'Production Technician', 7, 182, CAST(N'2001-01-10T00:00:00' AS SmallDateTime), 14000.0000, 168)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (40, N'Yvonne', N'McKay', N'S', N'Production Technician', 7, 159, CAST(N'2001-01-10T00:00:00' AS SmallDateTime), 10000.0000, 107)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (41, N'Peng', N'Wu', N'J', N'Quality Assurance Supervisor', 13, 200, CAST(N'2001-01-10T00:00:00' AS SmallDateTime), 21600.0000, 39)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (42, N'Jean', N'Trenary', N'E', N'Information Services Manager', 11, 109, CAST(N'2001-01-12T00:00:00' AS SmallDateTime), 50500.0000, 194)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (43, N'Russell', N'Hunter', NULL, N'Production Technician', 7, 74, CAST(N'2001-01-13T00:00:00' AS SmallDateTime), 11000.0000, 258)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (44, N'A. Scott', N'Wright', NULL, N'Master Scheduler', 8, 148, CAST(N'2001-01-13T00:00:00' AS SmallDateTime), 23600.0000, 172)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (45, N'Fred', N'Northup', N'T', N'Production Technician', 7, 210, CAST(N'2001-01-13T00:00:00' AS SmallDateTime), 15000.0000, 282)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (46, N'Sariya', N'Harnpadoungsataya', N'E', N'Marketing Specialist', 4, 6, CAST(N'2001-01-13T00:00:00' AS SmallDateTime), 14400.0000, 106)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (47, N'Willis', N'Johnson', N'T', N'Recruiter', 9, 30, CAST(N'2001-01-14T00:00:00' AS SmallDateTime), 18300.0000, 99)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (48, N'Jun', N'Cao', N'T', N'Production Technician', 7, 38, CAST(N'2001-01-15T00:00:00' AS SmallDateTime), 11000.0000, 197)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (49, N'Christian', N'Kleinerman', N'E', N'Maintenance Supervisor', 14, 218, CAST(N'2001-01-15T00:00:00' AS SmallDateTime), 20400.0000, 118)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (50, N'Susan', N'Metters', N'A', N'Production Technician', 7, 184, CAST(N'2001-01-15T00:00:00' AS SmallDateTime), 9500.0000, 224)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (51, N'Reuben', N'D''sa', N'H', N'Production Supervisor', 7, 21, CAST(N'2001-01-16T00:00:00' AS SmallDateTime), 25000.0000, 249)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (52, N'Kirk', N'Koenigsbauer', N'J', N'Production Technician', 7, 123, CAST(N'2001-01-16T00:00:00' AS SmallDateTime), 10000.0000, 250)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (53, N'David', N'Ortiz', N'J', N'Production Technician', 7, 18, CAST(N'2001-01-16T00:00:00' AS SmallDateTime), 12500.0000, 267)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (54, N'Tengiz', N'Kharatishvili', N'', N'Control Specialist', 12, 90, CAST(N'2001-01-17T00:00:00' AS SmallDateTime), 16800.0000, 129)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (55, N'Hanying', N'Feng', N'P', N'Production Technician', 7, 143, CAST(N'2001-01-17T00:00:00' AS SmallDateTime), 14000.0000, 182)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (56, N'Kevin', N'Liu', N'H', N'Production Technician', 7, 210, CAST(N'2001-01-18T00:00:00' AS SmallDateTime), 15000.0000, 259)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (57, N'Annik', N'Stahl', N'O', N'Production Technician', 7, 16, CAST(N'2001-01-18T00:00:00' AS SmallDateTime), 12500.0000, 262)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (58, N'Suroor', N'Fatima', N'R', N'Production Technician', 7, 38, CAST(N'2001-01-18T00:00:00' AS SmallDateTime), 11000.0000, 86)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (59, N'Deborah', N'Poe', N'E', N'Accounts Receivable Specialist', 10, 139, CAST(N'2001-01-19T00:00:00' AS SmallDateTime), 19000.0000, 103)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (60, N'Jim', N'Scardelis', N'H', N'Production Technician', 7, 74, CAST(N'2001-01-20T00:00:00' AS SmallDateTime), 11000.0000, 88)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (61, N'Carole', N'Poland', N'M', N'Production Technician', 7, 173, CAST(N'2001-01-20T00:00:00' AS SmallDateTime), 9500.0000, 72)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (62, N'George', N'Li', N'Z', N'Production Technician', 7, 184, CAST(N'2001-01-22T00:00:00' AS SmallDateTime), 9500.0000, 58)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (63, N'Gary', N'Yukish', N'W', N'Production Technician', 7, 87, CAST(N'2001-01-23T00:00:00' AS SmallDateTime), 15000.0000, 80)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (64, N'Cristian', N'Petculescu', N'K', N'Production Supervisor', 7, 21, CAST(N'2001-01-23T00:00:00' AS SmallDateTime), 25000.0000, 276)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (65, N'Raymond', N'Sam', N'K', N'Production Technician', 7, 143, CAST(N'2001-01-24T00:00:00' AS SmallDateTime), 14000.0000, 75)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (66, N'Janaina', N'Bueno', N'Barreiro Gambaro', N'Application Specialist', 11, 42, CAST(N'2001-01-24T00:00:00' AS SmallDateTime), 27400.0000, 131)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (67, N'Bob', N'Hohman', N'', N'Production Technician', 7, 14, CAST(N'2001-01-25T00:00:00' AS SmallDateTime), 11000.0000, 44)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (68, N'Shammi', N'Mohamed', N'G', N'Production Technician', 7, 210, CAST(N'2001-01-25T00:00:00' AS SmallDateTime), 15000.0000, 4)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (69, N'Linda', N'Moschell', N'K', N'Production Technician', 7, 38, CAST(N'2001-01-26T00:00:00' AS SmallDateTime), 11000.0000, 5)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (70, N'Mindy', N'Martin', N'C', N'Benefits Specialist', 9, 30, CAST(N'2001-01-26T00:00:00' AS SmallDateTime), 16600.0000, 171)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (71, N'Wendy', N'Kahn', N'Beth', N'Finance Manager', 10, 140, CAST(N'2001-01-26T00:00:00' AS SmallDateTime), 43300.0000, 232)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (72, N'Kim', N'Ralls', N'T', N'Stocker', 15, 85, CAST(N'2001-01-27T00:00:00' AS SmallDateTime), 9000.0000, 42)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (73, N'Sandra', N'Reategui Alayo', NULL, N'Production Technician', 7, 135, CAST(N'2001-01-27T00:00:00' AS SmallDateTime), 9500.0000, 255)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (74, N'Kok-Ho', N'Loh', N'T', N'Production Supervisor', 7, 21, CAST(N'2001-01-28T00:00:00' AS SmallDateTime), 25000.0000, 10)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (75, N'Douglas', N'Hite', N'B', N'Production Technician', 7, 159, CAST(N'2001-01-28T00:00:00' AS SmallDateTime), 10000.0000, 57)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (76, N'James', N'Kramer', N'D', N'Production Technician', 7, 7, CAST(N'2001-01-28T00:00:00' AS SmallDateTime), 12500.0000, 162)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (77, N'Sean', N'Alexander', N'P', N'Quality Assurance Technician', 13, 41, CAST(N'2001-01-29T00:00:00' AS SmallDateTime), 10600.0000, 210)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (78, N'Nitin', N'Mirchandani', N'S', N'Production Technician', 7, 182, CAST(N'2001-01-29T00:00:00' AS SmallDateTime), 14000.0000, 231)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (79, N'Diane', N'Margheim', N'L', N'Research and Development Engineer', 6, 158, CAST(N'2001-01-30T00:00:00' AS SmallDateTime), 40900.0000, 111)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (80, N'Rebecca', N'Laszlo', N'A', N'Production Technician', 7, 16, CAST(N'2001-01-30T00:00:00' AS SmallDateTime), 12500.0000, 6)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (81, N'Rajesh', N'Patel', N'M', N'Production Technician', 7, 210, CAST(N'2001-02-01T00:00:00' AS SmallDateTime), 15000.0000, 81)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (82, N'Vidur', N'Luthra', N'X', N'Recruiter', 9, 30, CAST(N'2001-02-02T00:00:00' AS SmallDateTime), 18300.0000, 176)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (83, N'John', N'Evans', N'P', N'Production Technician', 7, 38, CAST(N'2001-02-02T00:00:00' AS SmallDateTime), 11000.0000, 253)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (84, N'Nancy', N'Anderson', N'A', N'Production Technician', 7, 7, CAST(N'2001-02-03T00:00:00' AS SmallDateTime), 12500.0000, 227)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (85, N'Pilar', N'Ackerman', N'G', N'Shipping and Receiving Supervisor', 15, 21, CAST(N'2001-02-03T00:00:00' AS SmallDateTime), 19200.0000, 269)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (86, N'David', N'Yalovsky', N'A', N'Production Technician', 7, 184, CAST(N'2001-02-03T00:00:00' AS SmallDateTime), 9500.0000, 241)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (87, N'David', N'Hamilton', N'P', N'Production Supervisor', 7, 21, CAST(N'2001-02-04T00:00:00' AS SmallDateTime), 25000.0000, 150)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (88, N'Laura', N'Steele', N'C', N'Production Technician', 7, 123, CAST(N'2001-02-04T00:00:00' AS SmallDateTime), 10000.0000, 62)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (89, N'Margie', N'Shoop', N'W', N'Production Technician', 7, 16, CAST(N'2001-02-05T00:00:00' AS SmallDateTime), 12500.0000, 92)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (90, N'Zainal', N'Arifin', N'T', N'Document Control Manager', 12, 200, CAST(N'2001-02-05T00:00:00' AS SmallDateTime), 17800.0000, 128)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (91, N'Lorraine', N'Nay', N'O', N'Production Technician', 7, 210, CAST(N'2001-02-05T00:00:00' AS SmallDateTime), 15000.0000, 94)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (92, N'Fadi', N'Fakhouri', N'K', N'Production Technician', 7, 143, CAST(N'2001-02-05T00:00:00' AS SmallDateTime), 14000.0000, 281)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (93, N'Ryan', N'Cornelsen', N'L', N'Production Technician', 7, 51, CAST(N'2001-02-06T00:00:00' AS SmallDateTime), 15000.0000, 228)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (94, N'Candy', N'Spoon', N'L', N'Accounts Receivable Specialist', 10, 139, CAST(N'2001-02-07T00:00:00' AS SmallDateTime), 19000.0000, 122)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (95, N'Nuan', N'Yu', NULL, N'Production Technician', 7, 74, CAST(N'2001-02-07T00:00:00' AS SmallDateTime), 11000.0000, 12)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (96, N'William', N'Vong', N'S', N'Scheduling Assistant', 8, 44, CAST(N'2001-02-08T00:00:00' AS SmallDateTime), 16000.0000, 35)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (97, N'Bjorn', N'Rettig', N'M', N'Production Technician', 7, 173, CAST(N'2001-02-08T00:00:00' AS SmallDateTime), 9500.0000, 268)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (98, N'Scott', N'Gode', N'R', N'Production Technician', 7, 197, CAST(N'2001-02-09T00:00:00' AS SmallDateTime), 10000.0000, 256)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (99, N'Michael', N'Rothkugel', N'L', N'Production Technician', 7, 87, CAST(N'2001-02-11T00:00:00' AS SmallDateTime), 15000.0000, 93)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (100, N'Lane', N'Sacksteder', N'M', N'Production Technician', 7, 143, CAST(N'2001-02-12T00:00:00' AS SmallDateTime), 14000.0000, 239)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (101, N'Pete', N'Male', N'C', N'Production Technician', 7, 14, CAST(N'2001-02-12T00:00:00' AS SmallDateTime), 11000.0000, 273)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (102, N'Dan', N'Bacon', N'K', N'Application Specialist', 11, 42, CAST(N'2001-02-12T00:00:00' AS SmallDateTime), 27400.0000, 126)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (103, N'David', N'Barber', N'M', N'Assistant to the Chief Financial Officer', 10, 140, CAST(N'2001-02-13T00:00:00' AS SmallDateTime), 13500.0000, 173)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (104, N'Lolan', N'Song', N'B', N'Production Technician', 7, 74, CAST(N'2001-02-13T00:00:00' AS SmallDateTime), 11000.0000, 77)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (105, N'Paula', N'Nartker', N'R', N'Production Technician', 7, 210, CAST(N'2001-02-13T00:00:00' AS SmallDateTime), 15000.0000, 247)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (106, N'Mary', N'Gibson', N'E', N'Marketing Specialist', 4, 6, CAST(N'2001-02-13T00:00:00' AS SmallDateTime), 14400.0000, 110)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (107, N'Mindaugas', N'Krapauskas', N'J', N'Production Technician', 7, 38, CAST(N'2001-02-14T00:00:00' AS SmallDateTime), 11000.0000, 74)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (108, N'Eric', N'Gubbels', NULL, N'Production Supervisor', 7, 21, CAST(N'2001-02-15T00:00:00' AS SmallDateTime), 25000.0000, 85)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (109, N'Ken', N'Sanchez', N'J', N'Chief Executive Officer', 16, NULL, CAST(N'2001-02-15T00:00:00' AS SmallDateTime), 125500.0000, 177)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (110, N'Jason', N'Watters', N'M', N'Production Technician', 7, 135, CAST(N'2001-02-15T00:00:00' AS SmallDateTime), 9500.0000, 21)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (111, N'Mark', N'Harrington', N'L', N'Quality Assurance Technician', 13, 41, CAST(N'2001-02-16T00:00:00' AS SmallDateTime), 10600.0000, 139)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (112, N'Janeth', N'Esteves', N'M', N'Production Technician', 7, 159, CAST(N'2001-02-16T00:00:00' AS SmallDateTime), 10000.0000, 163)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (113, N'Marc', N'Ingle', N'J', N'Production Technician', 7, 184, CAST(N'2001-02-17T00:00:00' AS SmallDateTime), 9500.0000, 230)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (114, N'Gigi', N'Matthew', N'', N'Research and Development Engineer', 6, 158, CAST(N'2001-02-17T00:00:00' AS SmallDateTime), 40900.0000, 23)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (115, N'Paul', N'Singh', N'R', N'Production Technician', 7, 108, CAST(N'2001-02-18T00:00:00' AS SmallDateTime), 14000.0000, 16)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (116, N'Frank', N'Lee', N'T', N'Production Technician', 7, 210, CAST(N'2001-02-18T00:00:00' AS SmallDateTime), 15000.0000, 263)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (117, N'Francois', N'Ajenstat', N'P', N'Database Administrator', 11, 42, CAST(N'2001-02-18T00:00:00' AS SmallDateTime), 38500.0000, 127)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (118, N'Diane', N'Tibbott', N'H', N'Production Technician', 7, 14, CAST(N'2001-02-19T00:00:00' AS SmallDateTime), 11000.0000, 140)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (119, N'Jill', N'Williams', N'A', N'Marketing Specialist', 4, 6, CAST(N'2001-02-19T00:00:00' AS SmallDateTime), 14400.0000, 114)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (120, N'Angela', N'Barbariol', N'W', N'Production Technician', 7, 38, CAST(N'2001-02-21T00:00:00' AS SmallDateTime), 11000.0000, 91)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (121, N'Matthias', N'Berndt', N'T', N'Shipping and Receiving Clerk', 15, 85, CAST(N'2001-02-21T00:00:00' AS SmallDateTime), 9500.0000, 201)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (122, N'Bryan', N'Baker', NULL, N'Production Technician', 7, 7, CAST(N'2001-02-22T00:00:00' AS SmallDateTime), 12500.0000, 166)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (123, N'Jeff', N'Hay', N'V', N'Production Supervisor', 7, 21, CAST(N'2001-02-22T00:00:00' AS SmallDateTime), 25000.0000, 113)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (124, N'Eugene', N'Zabokritski', N'R', N'Production Technician', 7, 184, CAST(N'2001-02-22T00:00:00' AS SmallDateTime), 9500.0000, 226)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (125, N'Barbara', N'Decker', N'S', N'Production Technician', 7, 182, CAST(N'2001-02-23T00:00:00' AS SmallDateTime), 14000.0000, 219)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (126, N'Chris', N'Preston', N'T', N'Production Technician', 7, 123, CAST(N'2001-02-23T00:00:00' AS SmallDateTime), 10000.0000, 279)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (127, N'Sean', N'Chai', N'', N'Document Control Assistant', 12, 90, CAST(N'2001-02-23T00:00:00' AS SmallDateTime), 10300.0000, 138)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (128, N'Dan', N'Wilson', N'B', N'Database Administrator', 11, 42, CAST(N'2001-02-23T00:00:00' AS SmallDateTime), 38500.0000, 30)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (129, N'Mark', N'McArthur', N'K', N'Production Technician', 7, 16, CAST(N'2001-02-24T00:00:00' AS SmallDateTime), 12500.0000, 186)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (130, N'Bryan', N'Walton', N'A', N'Accounts Receivable Specialist', 10, 139, CAST(N'2001-02-25T00:00:00' AS SmallDateTime), 19000.0000, 175)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (131, N'Houman', N'Pournasseh', N'', N'Production Technician', 7, 74, CAST(N'2001-02-26T00:00:00' AS SmallDateTime), 11000.0000, 185)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (132, N'Sairaj', N'Uddin', N'L', N'Scheduling Assistant', 8, 44, CAST(N'2001-02-27T00:00:00' AS SmallDateTime), 16000.0000, 190)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (133, N'Michiko', N'Osada', N'F', N'Production Technician', 7, 173, CAST(N'2001-02-27T00:00:00' AS SmallDateTime), 9500.0000, 229)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (134, N'Benjamin', N'Martin', N'R', N'Production Technician', 7, 184, CAST(N'2001-02-28T00:00:00' AS SmallDateTime), 9500.0000, 286)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (135, N'Cynthia', N'Randall', N'S', N'Production Supervisor', 7, 21, CAST(N'2001-02-28T00:00:00' AS SmallDateTime), 25000.0000, 147)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (136, N'Kathie', N'Flood', N'E', N'Production Technician', 7, 197, CAST(N'2001-02-28T00:00:00' AS SmallDateTime), 10000.0000, 100)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (137, N'Britta', N'Simon', N'L', N'Production Technician', 7, 16, CAST(N'2001-03-02T00:00:00' AS SmallDateTime), 12500.0000, 95)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (138, N'Brian', N'Lloyd', N'T', N'Production Technician', 7, 210, CAST(N'2001-03-02T00:00:00' AS SmallDateTime), 15000.0000, 288)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (139, N'David', N'Liu', N'J', N'Accounts Manager', 10, 140, CAST(N'2001-03-03T00:00:00' AS SmallDateTime), 34700.0000, 119)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (140, N'Laura', N'Norman', N'F', N'Chief Financial Officer', 16, 109, CAST(N'2001-03-04T00:00:00' AS SmallDateTime), 60100.0000, 215)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (141, N'Michael', N'Patten', N'W', N'Production Technician', 7, 38, CAST(N'2001-03-04T00:00:00' AS SmallDateTime), 11000.0000, 96)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (142, N'Andy', N'Ruth', N'M', N'Production Technician', 7, 135, CAST(N'2001-03-04T00:00:00' AS SmallDateTime), 9500.0000, 1)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (143, N'Yuhong', N'Li', N'L', N'Production Supervisor', 7, 21, CAST(N'2001-03-05T00:00:00' AS SmallDateTime), 25000.0000, 242)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (144, N'Robert', N'Rounthwaite', N'J', N'Production Technician', 7, 159, CAST(N'2001-03-06T00:00:00' AS SmallDateTime), 10000.0000, 280)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (145, N'Andreas', N'Berglund', N'T', N'Quality Assurance Technician', 13, 41, CAST(N'2001-03-06T00:00:00' AS SmallDateTime), 10600.0000, 208)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (146, N'Reed', N'Koch', N'T', N'Production Technician', 7, 184, CAST(N'2001-03-06T00:00:00' AS SmallDateTime), 9500.0000, 191)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (147, N'Linda', N'Randall', N'A', N'Production Technician', 7, 143, CAST(N'2001-03-07T00:00:00' AS SmallDateTime), 14000.0000, 260)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (148, N'James', N'Hamilton', N'R', N'Vice President of Production', 7, 109, CAST(N'2001-03-07T00:00:00' AS SmallDateTime), 84100.0000, 158)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (149, N'Ramesh', N'Meyyappan', N'V', N'Application Specialist', 11, 42, CAST(N'2001-03-07T00:00:00' AS SmallDateTime), 27400.0000, 130)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (150, N'Stephanie', N'Conroy', N'A', N'Network Manager', 11, 42, CAST(N'2001-03-08T00:00:00' AS SmallDateTime), 39700.0000, 136)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (151, N'Samantha', N'Smith', N'H', N'Production Technician', 7, 108, CAST(N'2001-03-08T00:00:00' AS SmallDateTime), 14000.0000, 14)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (152, N'Tawana', N'Nusbaum', N'G', N'Production Technician', 7, 210, CAST(N'2001-03-09T00:00:00' AS SmallDateTime), 15000.0000, 237)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (153, N'Denise', N'Smith', N'H', N'Production Technician', 7, 14, CAST(N'2001-03-09T00:00:00' AS SmallDateTime), 11000.0000, 143)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (154, N'Hao', N'Chen', N'O', N'Human Resources Administrative Assistant', 9, 30, CAST(N'2001-03-10T00:00:00' AS SmallDateTime), 13900.0000, 135)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (155, N'Alex', N'Nayberg', N'M', N'Production Technician', 7, 123, CAST(N'2001-03-12T00:00:00' AS SmallDateTime), 10000.0000, 174)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (156, N'Eugene', N'Kogan', N'O', N'Production Technician', 7, 7, CAST(N'2001-03-12T00:00:00' AS SmallDateTime), 12500.0000, 71)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (157, N'Brandon', N'Heidepriem', N'G', N'Production Technician', 7, 16, CAST(N'2001-03-12T00:00:00' AS SmallDateTime), 12500.0000, 189)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (158, N'Dylan', N'Miller', N'A', N'Research and Development Manager', 6, 3, CAST(N'2001-03-12T00:00:00' AS SmallDateTime), 50500.0000, 141)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (159, N'Shane', N'Kim', N'S', N'Production Supervisor', 7, 21, CAST(N'2001-03-12T00:00:00' AS SmallDateTime), 25000.0000, 20)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (160, N'John', N'Chen', N'Y', N'Production Technician', 7, 182, CAST(N'2001-03-13T00:00:00' AS SmallDateTime), 14000.0000, 65)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (161, N'Karen', N'Berge', N'R', N'Document Control Assistant', 12, 90, CAST(N'2001-03-13T00:00:00' AS SmallDateTime), 10300.0000, 123)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (162, N'Jose', N'Lugo', N'R', N'Production Technician', 7, 16, CAST(N'2001-03-14T00:00:00' AS SmallDateTime), 12500.0000, 271)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (163, N'Mandar', N'Samant', N'H', N'Production Technician', 7, 74, CAST(N'2001-03-14T00:00:00' AS SmallDateTime), 11000.0000, 63)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (164, N'Mikael', N'Sandberg', N'Q', N'Buyer', 5, 274, CAST(N'2001-03-14T00:00:00' AS SmallDateTime), 18300.0000, 50)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (165, N'Sameer', N'Tejani', N'A', N'Production Technician', 7, 74, CAST(N'2001-03-15T00:00:00' AS SmallDateTime), 11000.0000, 66)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (166, N'Dragan', N'Tomic', N'K', N'Accounts Payable Specialist', 10, 139, CAST(N'2001-03-15T00:00:00' AS SmallDateTime), 19000.0000, 115)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (167, N'Carol', N'Philips', N'M', N'Production Technician', 7, 173, CAST(N'2001-03-16T00:00:00' AS SmallDateTime), 9500.0000, 45)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (168, N'Rob', N'Caron', N'T', N'Production Technician', 7, 87, CAST(N'2001-03-17T00:00:00' AS SmallDateTime), 15000.0000, 161)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (169, N'Don', N'Hall', N'L', N'Production Technician', 7, 38, CAST(N'2001-03-17T00:00:00' AS SmallDateTime), 11000.0000, 59)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (170, N'Alan', N'Brewer', N'J', N'Scheduling Assistant', 8, 44, CAST(N'2001-03-17T00:00:00' AS SmallDateTime), 16000.0000, 151)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (171, N'David', N'Lawrence', N'Oliver', N'Production Technician', 7, 184, CAST(N'2001-03-18T00:00:00' AS SmallDateTime), 9500.0000, 167)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (172, N'Baris', N'Cetinok', N'F', N'Production Technician', 7, 87, CAST(N'2001-03-19T00:00:00' AS SmallDateTime), 15000.0000, 244)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (173, N'Michael', N'Ray', N'Sean', N'Production Supervisor', 7, 21, CAST(N'2001-03-19T00:00:00' AS SmallDateTime), 25000.0000, 277)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (174, N'Steve', N'Masters', N'F', N'Production Technician', 7, 18, CAST(N'2001-03-19T00:00:00' AS SmallDateTime), 12500.0000, 252)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (175, N'Suchitra', N'Mohan', N'O', N'Production Technician', 7, 16, CAST(N'2001-03-20T00:00:00' AS SmallDateTime), 12500.0000, 31)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (176, N'Karen', N'Berg', N'A', N'Application Specialist', 11, 42, CAST(N'2001-03-20T00:00:00' AS SmallDateTime), 27400.0000, 132)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (177, N'Terrence', N'Earls', N'W', N'Production Technician', 7, 143, CAST(N'2001-03-20T00:00:00' AS SmallDateTime), 14000.0000, 34)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (178, N'Barbara', N'Moreland', N'C', N'Accountant', 10, 139, CAST(N'2001-03-22T00:00:00' AS SmallDateTime), 26400.0000, 254)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (179, N'Chad', N'Niswonger', N'W', N'Production Technician', 7, 38, CAST(N'2001-03-22T00:00:00' AS SmallDateTime), 11000.0000, 46)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (180, N'Rostislav', N'Shabalin', N'E', N'Production Technician', 7, 135, CAST(N'2001-03-23T00:00:00' AS SmallDateTime), 9500.0000, 9)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (181, N'Belinda', N'Newman', N'M', N'Production Technician', 7, 197, CAST(N'2001-03-24T00:00:00' AS SmallDateTime), 10000.0000, 43)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (182, N'Katie', N'McAskill-White', N'L', N'Production Supervisor', 7, 21, CAST(N'2001-03-24T00:00:00' AS SmallDateTime), 25000.0000, 240)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (183, N'Russell', N'King', N'M', N'Production Technician', 7, 184, CAST(N'2001-03-25T00:00:00' AS SmallDateTime), 9500.0000, 3)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (184, N'Jack', N'Richins', N'S', N'Production Supervisor', 7, 21, CAST(N'2001-03-25T00:00:00' AS SmallDateTime), 25000.0000, 169)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (185, N'Andrew', N'Hill', N'R', N'Production Supervisor', 7, 21, CAST(N'2001-03-26T00:00:00' AS SmallDateTime), 25000.0000, 97)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (186, N'Nicole', N'Holliday', N'B', N'Production Technician', 7, 87, CAST(N'2001-03-26T00:00:00' AS SmallDateTime), 15000.0000, 238)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (187, N'Frank', N'Miller', N'T', N'Production Technician', 7, 14, CAST(N'2001-03-27T00:00:00' AS SmallDateTime), 11000.0000, 289)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (188, N'Peter', N'Connelly', N'I', N'Network Administrator', 11, 150, CAST(N'2001-03-27T00:00:00' AS SmallDateTime), 32500.0000, 137)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (189, N'Anibal', N'Sousa', N'T', N'Production Technician', 7, 108, CAST(N'2001-03-27T00:00:00' AS SmallDateTime), 14000.0000, 183)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (190, N'Ken', N'Myer', N'L', N'Production Technician', 7, 210, CAST(N'2001-03-28T00:00:00' AS SmallDateTime), 15000.0000, 105)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (191, N'Grant', N'Culbertson', N'', N'Human Resources Administrative Assistant', 9, 30, CAST(N'2001-03-29T00:00:00' AS SmallDateTime), 13900.0000, 117)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (192, N'Michael', N'Entin', N'T', N'Production Technician', 7, 38, CAST(N'2001-03-29T00:00:00' AS SmallDateTime), 11000.0000, 195)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (193, N'Lionel', N'Penuchot', N'C', N'Production Technician', 7, 159, CAST(N'2001-03-30T00:00:00' AS SmallDateTime), 10000.0000, 261)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (194, N'Thomas', N'Michaels', N'R', N'Production Technician', 7, 7, CAST(N'2001-03-30T00:00:00' AS SmallDateTime), 12500.0000, 78)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (195, N'Jimmy', N'Bischoff', N'T', N'Stocker', 15, 85, CAST(N'2001-03-30T00:00:00' AS SmallDateTime), 9000.0000, 206)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (196, N'Michael', N'Vanderhyde', N'T', N'Production Technician', 7, 135, CAST(N'2001-03-30T00:00:00' AS SmallDateTime), 9500.0000, 90)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (197, N'Lori', N'Kane', N'A', N'Production Supervisor', 7, 21, CAST(N'2001-03-30T00:00:00' AS SmallDateTime), 25000.0000, 198)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (198, N'Arvind', N'Rao', N'B', N'Buyer', 5, 274, CAST(N'2001-04-01T00:00:00' AS SmallDateTime), 18300.0000, 212)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (199, N'Stefen', N'Hesse', N'A', N'Production Technician', 7, 182, CAST(N'2001-04-01T00:00:00' AS SmallDateTime), 14000.0000, 68)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (200, N'Hazem', N'Abolrous', N'E', N'Quality Assurance Manager', 13, 148, CAST(N'2001-04-01T00:00:00' AS SmallDateTime), 28800.0000, 148)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (201, N'Janet', N'Sheperdigian', N'L', N'Accounts Payable Specialist', 10, 139, CAST(N'2001-04-02T00:00:00' AS SmallDateTime), 19000.0000, 218)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (202, N'Elizabeth', N'Keyser', N'I', N'Production Technician', 7, 74, CAST(N'2001-04-03T00:00:00' AS SmallDateTime), 11000.0000, 152)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (203, N'Terry', N'Eminhizer', N'J', N'Marketing Specialist', 4, 6, CAST(N'2001-04-03T00:00:00' AS SmallDateTime), 14400.0000, 19)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (204, N'John', N'Frum', N'', N'Production Technician', 7, 184, CAST(N'2001-04-04T00:00:00' AS SmallDateTime), 9500.0000, 112)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (205, N'Merav', N'Netz', N'A', N'Production Technician', 7, 173, CAST(N'2001-04-04T00:00:00' AS SmallDateTime), 9500.0000, 270)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (206, N'Brian', N'LaMee', N'P', N'Scheduling Assistant', 8, 44, CAST(N'2001-04-04T00:00:00' AS SmallDateTime), 16000.0000, 109)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (207, N'Kitti', N'Lertpiriyasuwat', N'H', N'Production Technician', 7, 38, CAST(N'2001-04-05T00:00:00' AS SmallDateTime), 11000.0000, 272)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (208, N'Jay', N'Adams', N'G', N'Production Technician', 7, 18, CAST(N'2001-04-06T00:00:00' AS SmallDateTime), 12500.0000, 157)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (209, N'Jan', N'Miksovsky', N'S', N'Production Technician', 7, 184, CAST(N'2001-04-06T00:00:00' AS SmallDateTime), 9500.0000, 101)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (210, N'Brenda', N'Diaz', N'M', N'Production Supervisor', 7, 21, CAST(N'2001-04-06T00:00:00' AS SmallDateTime), 25000.0000, 251)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (211, N'Andrew', N'Cencini', N'M', N'Production Technician', 7, 123, CAST(N'2001-04-07T00:00:00' AS SmallDateTime), 10000.0000, 233)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (212, N'Chris', N'Norred', N'K', N'Control Specialist', 12, 90, CAST(N'2001-04-07T00:00:00' AS SmallDateTime), 16800.0000, 125)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (213, N'Chris', N'Okelberry', N'O', N'Production Technician', 7, 16, CAST(N'2001-04-08T00:00:00' AS SmallDateTime), 12500.0000, 188)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (214, N'Shelley', N'Dyck', N'', N'Production Technician', 7, 143, CAST(N'2001-04-08T00:00:00' AS SmallDateTime), 14000.0000, 164)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (215, N'Gabe', N'Mares', N'B', N'Production Technician', 7, 210, CAST(N'2001-04-09T00:00:00' AS SmallDateTime), 15000.0000, 87)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (216, N'Mike', N'Seamans', N'K', N'Accountant', 10, 139, CAST(N'2001-04-09T00:00:00' AS SmallDateTime), 26400.0000, 120)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (217, N'Michael', N'Raheem', NULL, N'Research and Development Manager', 6, 158, CAST(N'2001-06-04T00:00:00' AS SmallDateTime), 42500.0000, 236)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (218, N'Gary', N'Altman', N'E.', N'Facilities Manager', 14, 148, CAST(N'2002-01-03T00:00:00' AS SmallDateTime), 24000.0000, 203)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (219, N'Charles', N'Fitzgerald', N'B', N'Production Technician', 7, 18, CAST(N'2002-01-04T00:00:00' AS SmallDateTime), 12500.0000, 223)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (220, N'Ebru', N'Ersan', N'', N'Production Technician', 7, 25, CAST(N'2002-01-07T00:00:00' AS SmallDateTime), 13500.0000, 225)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (221, N'Sylvester', N'Valdez', N'A', N'Production Technician', 7, 108, CAST(N'2002-01-12T00:00:00' AS SmallDateTime), 14000.0000, 25)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (222, N'Brian', N'Goldstein', N'Richard', N'Production Technician', 7, 51, CAST(N'2002-01-12T00:00:00' AS SmallDateTime), 15000.0000, 48)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (223, N'Linda', N'Meisner', N'P', N'Buyer', 5, 274, CAST(N'2002-01-18T00:00:00' AS SmallDateTime), 18300.0000, 28)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (224, N'Betsy', N'Stadick', N'A', N'Production Technician', 7, 64, CAST(N'2002-01-19T00:00:00' AS SmallDateTime), 13500.0000, 47)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (225, N'Magnus', N'Hedlund', N'E', N'Facilities Administrative Assistant', 14, 218, CAST(N'2002-01-22T00:00:00' AS SmallDateTime), 9800.0000, 211)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (226, N'Karan', N'Khanna', N'R', N'Production Technician', 7, 18, CAST(N'2002-01-23T00:00:00' AS SmallDateTime), 12500.0000, 248)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (227, N'Mary', N'Baker', N'R', N'Production Technician', 7, 25, CAST(N'2002-01-26T00:00:00' AS SmallDateTime), 13500.0000, 246)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (228, N'Kevin', N'Homer', N'M', N'Production Technician', 7, 25, CAST(N'2002-01-26T00:00:00' AS SmallDateTime), 13500.0000, 29)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (229, N'Mihail', N'Frintu', N'U', N'Production Technician', 7, 51, CAST(N'2002-01-30T00:00:00' AS SmallDateTime), 15000.0000, 89)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (230, N'Bonnie', N'Kearney', N'', N'Production Technician', 7, 185, CAST(N'2002-02-02T00:00:00' AS SmallDateTime), 13500.0000, 287)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (231, N'Fukiko', N'Ogisu', N'J', N'Buyer', 5, 274, CAST(N'2002-02-05T00:00:00' AS SmallDateTime), 18300.0000, 17)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (232, N'Hung-Fu', N'Ting', N'T', N'Production Technician', 7, 108, CAST(N'2002-02-07T00:00:00' AS SmallDateTime), 14000.0000, 220)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (233, N'Gordon', N'Hee', N'L', N'Buyer', 5, 274, CAST(N'2002-02-12T00:00:00' AS SmallDateTime), 18300.0000, 15)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (234, N'Kimberly', N'Zimmerman', N'B', N'Production Technician', 7, 64, CAST(N'2002-02-13T00:00:00' AS SmallDateTime), 13500.0000, 266)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (235, N'Kim', N'Abercrombie', N'B', N'Production Technician', 7, 16, CAST(N'2002-02-17T00:00:00' AS SmallDateTime), 12500.0000, 56)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (236, N'Sandeep', N'Kaliyath', N'P', N'Production Technician', 7, 51, CAST(N'2002-02-18T00:00:00' AS SmallDateTime), 15000.0000, 234)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (237, N'Prasanna', N'Samarawickrama', N'E', N'Production Technician', 7, 108, CAST(N'2002-02-23T00:00:00' AS SmallDateTime), 14000.0000, 187)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (238, N'Frank', N'Pellow', N'S', N'Buyer', 5, 274, CAST(N'2002-02-24T00:00:00' AS SmallDateTime), 18300.0000, 213)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (239, N'Min', N'Su', N'G', N'Production Technician', 7, 108, CAST(N'2002-02-25T00:00:00' AS SmallDateTime), 14000.0000, 24)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (240, N'Eric', N'Brown', N'L', N'Production Technician', 7, 51, CAST(N'2002-02-25T00:00:00' AS SmallDateTime), 15000.0000, 67)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (241, N'Eric', N'Kurjan', N'S', N'Buyer', 5, 274, CAST(N'2002-02-28T00:00:00' AS SmallDateTime), 18300.0000, 207)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (242, N'Pat', N'Coleman', N'H', N'Janitor', 14, 49, CAST(N'2002-02-28T00:00:00' AS SmallDateTime), 9300.0000, 116)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (243, N'Maciej', N'Dusza', N'W', N'Production Technician', 7, 18, CAST(N'2002-03-01T00:00:00' AS SmallDateTime), 12500.0000, 83)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (244, N'Erin', N'Hagens', N'M', N'Buyer', 5, 274, CAST(N'2002-03-03T00:00:00' AS SmallDateTime), 18300.0000, 8)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (245, N'Patrick', N'Wedge', N'C', N'Production Technician', 7, 64, CAST(N'2002-03-04T00:00:00' AS SmallDateTime), 13500.0000, 7)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (246, N'Frank', N'Martinez', N'R', N'Production Technician', 7, 51, CAST(N'2002-03-08T00:00:00' AS SmallDateTime), 15000.0000, 290)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (247, N'Ed', N'Dudenhoefer', N'R', N'Production Technician', 7, 16, CAST(N'2002-03-08T00:00:00' AS SmallDateTime), 12500.0000, 243)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (248, N'Christopher', N'Hill', N'E', N'Production Technician', 7, 25, CAST(N'2002-03-11T00:00:00' AS SmallDateTime), 13500.0000, 41)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (249, N'Patrick', N'Cook', N'M', N'Production Technician', 7, 51, CAST(N'2002-03-15T00:00:00' AS SmallDateTime), 15000.0000, 264)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (250, N'Krishna', N'Sunkammurali', NULL, N'Production Technician', 7, 108, CAST(N'2002-03-16T00:00:00' AS SmallDateTime), 14000.0000, 79)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (251, N'Lori', N'Penor', N'K', N'Janitor', 14, 49, CAST(N'2002-03-19T00:00:00' AS SmallDateTime), 9300.0000, 124)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (252, N'Danielle', N'Tiedt', N'C', N'Production Technician', 7, 64, CAST(N'2002-03-23T00:00:00' AS SmallDateTime), 13500.0000, 146)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (253, N'Sootha', N'Charncherngkha', N'T', N'Quality Assurance Technician', 13, 41, CAST(N'2002-03-26T00:00:00' AS SmallDateTime), 10600.0000, 149)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (254, N'Michael', N'Zwilling', N'J', N'Production Technician', 7, 18, CAST(N'2002-03-26T00:00:00' AS SmallDateTime), 12500.0000, 76)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (255, N'Randy', N'Reeves', N'T', N'Production Technician', 7, 18, CAST(N'2002-03-26T00:00:00' AS SmallDateTime), 12500.0000, 84)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (256, N'John', N'Kane', N'T', N'Production Technician', 7, 25, CAST(N'2002-03-30T00:00:00' AS SmallDateTime), 13500.0000, 69)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (257, N'Jack', N'Creasey', N'T', N'Production Technician', 7, 51, CAST(N'2002-04-03T00:00:00' AS SmallDateTime), 15000.0000, 265)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (258, N'Olinda', N'Turner', N'C', N'Production Technician', 7, 108, CAST(N'2002-04-04T00:00:00' AS SmallDateTime), 14000.0000, 33)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (259, N'Stuart', N'Macrae', N'J', N'Janitor', 14, 49, CAST(N'2002-04-05T00:00:00' AS SmallDateTime), 9300.0000, 205)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (260, N'Jo', N'Berry', N'L', N'Janitor', 14, 49, CAST(N'2002-04-07T00:00:00' AS SmallDateTime), 9300.0000, 121)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (261, N'Ben', N'Miller', N'T', N'Buyer', 5, 274, CAST(N'2002-04-09T00:00:00' AS SmallDateTime), 18300.0000, 192)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (262, N'Tom', N'Vande Velde', N'M', N'Production Technician', 7, 64, CAST(N'2002-04-10T00:00:00' AS SmallDateTime), 13500.0000, 98)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (263, N'Ovidiu', N'Cracium', N'V', N'Senior Tool Designer', 2, 3, CAST(N'2003-01-05T00:00:00' AS SmallDateTime), 28800.0000, 145)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (264, N'Annette', N'Hill', N'L', N'Purchasing Assistant', 5, 274, CAST(N'2003-01-06T00:00:00' AS SmallDateTime), 12800.0000, 181)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (265, N'Janice', N'Galvin', N'M', N'Tool Designer', 2, 263, CAST(N'2003-01-23T00:00:00' AS SmallDateTime), 25000.0000, 200)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (266, N'Reinout', N'Hillmann', N'', N'Purchasing Assistant', 5, 274, CAST(N'2003-01-25T00:00:00' AS SmallDateTime), 12800.0000, 27)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (267, N'Michael', N'Sullivan', N'I', N'Senior Design Engineer', 1, 3, CAST(N'2003-01-30T00:00:00' AS SmallDateTime), 36100.0000, 217)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (268, N'Stephen', N'Jiang', N'Y', N'North American Sales Manager', 3, 273, CAST(N'2003-02-04T00:00:00' AS SmallDateTime), 48100.0000, 196)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (269, N'Wanida', N'Benshoof', N'M', N'Marketing Assistant', 4, 6, CAST(N'2003-02-07T00:00:00' AS SmallDateTime), 13500.0000, 221)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (270, N'Sharon', N'Salavaria', N'B', N'Design Engineer', 1, 3, CAST(N'2003-02-18T00:00:00' AS SmallDateTime), 32700.0000, 216)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (271, N'John', N'Wood', N'L', N'Marketing Specialist', 4, 6, CAST(N'2003-03-10T00:00:00' AS SmallDateTime), 14400.0000, 180)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (272, N'Mary', N'Dempsey', N'A', N'Marketing Assistant', 4, 6, CAST(N'2003-03-17T00:00:00' AS SmallDateTime), 13500.0000, 26)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (273, N'Brian', N'Welcker', N'S', N'Vice President of Sales', 3, 109, CAST(N'2003-03-18T00:00:00' AS SmallDateTime), 72100.0000, 134)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (274, N'Sheela', N'Word', N'H', N'Purchasing Manager', 13, 71, CAST(N'2003-03-28T00:00:00' AS SmallDateTime), 30000.0000, 222)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (275, N'Michael', N'Blythe', N'G', N'Sales Representative', 3, 268, CAST(N'2003-07-01T00:00:00' AS SmallDateTime), 23100.0000, 60)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (276, N'Linda', N'Mitchell', N'C', N'Sales Representative', 3, 268, CAST(N'2003-07-01T00:00:00' AS SmallDateTime), 23100.0000, 170)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (277, N'Jillian', N'Carson', NULL, N'Sales Representative', 3, 268, CAST(N'2003-07-01T00:00:00' AS SmallDateTime), 23100.0000, 61)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (278, N'Garrett', N'Vargas', N'R', N'Sales Representative', 3, 268, CAST(N'2003-07-01T00:00:00' AS SmallDateTime), 23100.0000, 52)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (279, N'Tsvi', N'Reiter', N'Michael', N'Sales Representative', 3, 268, CAST(N'2003-07-01T00:00:00' AS SmallDateTime), 23100.0000, 154)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (280, N'Pamela', N'Ansman-Wolfe', N'O', N'Sales Representative', 3, 268, CAST(N'2003-07-01T00:00:00' AS SmallDateTime), 23100.0000, 179)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (281, N'Shu', N'Ito', N'K', N'Sales Representative', 3, 268, CAST(N'2003-07-01T00:00:00' AS SmallDateTime), 23100.0000, 235)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (282, N'Jose', N'Saraiva', N'Edvaldo', N'Sales Representative', 3, 268, CAST(N'2003-07-01T00:00:00' AS SmallDateTime), 23100.0000, 178)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (283, N'David', N'Campbell', N'R', N'Sales Representative', 3, 268, CAST(N'2003-07-01T00:00:00' AS SmallDateTime), 23100.0000, 13)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (284, N'Amy', N'Alberts', N'E', N'European Sales Manager', 3, 273, CAST(N'2004-05-18T00:00:00' AS SmallDateTime), 48100.0000, 202)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (285, N'Jae', N'Pak', N'B', N'Sales Representative', 3, 284, CAST(N'2004-07-01T00:00:00' AS SmallDateTime), 23100.0000, 54)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (286, N'Ranjit', N'Varkey Chudukatil', N'R', N'Sales Representative', 3, 284, CAST(N'2004-07-01T00:00:00' AS SmallDateTime), 23100.0000, 38)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (287, N'Tete', N'Mensa-Annan', N'A', N'Sales Representative', 3, 268, CAST(N'2004-11-01T00:00:00' AS SmallDateTime), 23100.0000, 53)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (288, N'Syed', N'Abbas', N'E', N'Pacific Sales Manager', 3, 273, CAST(N'2005-04-15T00:00:00' AS SmallDateTime), 48100.0000, 49)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (289, N'Rachel', N'Valdez', N'B', N'Sales Representative', 3, 284, CAST(N'2005-07-01T00:00:00' AS SmallDateTime), 23100.0000, 37)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (290, N'Lynn', N'Tsoflias', N'', N'Sales Representative', 3, 288, CAST(N'2005-07-01T00:00:00' AS SmallDateTime), 23100.0000, 153)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (291, N'Svetlin', N'Nakov', N'Ivanov', N'Independent Software Development  Consultant', 6, NULL, CAST(N'2005-03-01T00:00:00' AS SmallDateTime), 48000.0000, 291)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (292, N'Martin', N'Kulov', NULL, N'Independent .NET Consultant', 6, NULL, CAST(N'2005-03-01T00:00:00' AS SmallDateTime), 48000.0000, 291)
GO
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [MiddleName], [JobTitle], [DepartmentID], [ManagerID], [HireDate], [Salary], [AddressID]) VALUES (293, N'George', N'Denchev', NULL, N'Independent Java Consultant', 6, NULL, CAST(N'2005-03-01T00:00:00' AS SmallDateTime), 48000.0000, 291)
GO
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (1, 4)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (1, 24)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (1, 38)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (1, 113)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (3, 1)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (3, 21)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (3, 58)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (3, 110)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (4, 25)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (4, 39)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (4, 53)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (4, 105)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (5, 27)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (5, 41)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (5, 55)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (5, 107)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (7, 12)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (7, 32)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (7, 107)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (7, 121)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (8, 2)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (8, 22)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (8, 36)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (8, 111)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (9, 9)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (9, 52)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (9, 104)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (9, 118)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (10, 3)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (10, 23)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (10, 37)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (10, 112)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (11, 10)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (11, 53)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (11, 105)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (11, 119)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (12, 28)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (12, 42)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (12, 56)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (12, 108)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (13, 20)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (13, 34)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (13, 48)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (13, 127)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (14, 19)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (14, 33)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (14, 108)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (14, 122)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (15, 1)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (15, 21)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (15, 35)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (15, 110)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (16, 20)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (16, 34)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (16, 109)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (16, 127)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (17, 20)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (17, 34)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (17, 109)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (17, 127)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (18, 1)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (18, 21)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (18, 35)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (18, 110)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (19, 12)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (19, 32)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (19, 107)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (19, 121)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (20, 19)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (20, 33)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (20, 108)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (20, 122)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (21, 10)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (21, 30)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (21, 105)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (21, 119)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (22, 8)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (22, 28)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (22, 42)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (22, 117)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (23, 9)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (23, 29)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (23, 43)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (23, 118)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (24, 10)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (24, 30)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (24, 44)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (24, 119)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (25, 11)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (25, 31)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (25, 106)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (25, 120)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (26, 5)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (26, 25)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (26, 39)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (26, 114)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (27, 26)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (27, 40)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (27, 115)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (29, 7)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (29, 27)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (29, 41)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (29, 116)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (30, 26)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (30, 78)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (30, 115)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (31, 11)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (31, 31)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (31, 45)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (31, 120)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (32, 12)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (32, 32)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (32, 46)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (32, 121)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (33, 19)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (33, 33)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (33, 47)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (33, 122)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (36, 1)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (36, 21)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (36, 35)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (36, 49)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (37, 2)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (37, 22)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (37, 36)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (37, 50)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (38, 2)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (38, 22)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (38, 36)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (38, 111)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (39, 3)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (39, 23)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (39, 60)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (39, 112)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (40, 4)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (40, 24)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (40, 61)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (40, 113)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (41, 4)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (41, 24)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (41, 38)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (41, 52)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (42, 7)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (42, 27)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (42, 79)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (42, 116)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (43, 26)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (43, 78)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (43, 115)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (44, 9)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (44, 29)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (44, 104)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (44, 118)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (45, 5)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (45, 25)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (45, 77)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (45, 114)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (48, 12)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (48, 55)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (48, 107)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (48, 121)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (49, 8)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (49, 28)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (49, 80)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (49, 117)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (50, 7)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (50, 27)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (50, 79)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (50, 116)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (51, 3)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (51, 23)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (51, 37)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (51, 112)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (52, 49)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (52, 78)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (52, 115)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (53, 7)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (53, 50)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (53, 79)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (53, 116)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (54, 7)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (54, 50)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (54, 79)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (54, 116)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (55, 8)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (55, 28)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (55, 80)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (55, 117)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (56, 9)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (56, 29)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (56, 104)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (56, 118)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (57, 10)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (57, 30)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (57, 105)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (57, 119)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (58, 11)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (58, 31)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (58, 106)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (58, 120)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (60, 8)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (60, 51)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (60, 80)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (60, 117)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (61, 9)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (61, 52)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (61, 104)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (61, 118)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (62, 10)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (62, 53)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (62, 105)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (62, 119)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (63, 11)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (63, 54)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (63, 106)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (63, 120)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (64, 4)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (64, 24)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (64, 38)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (64, 113)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (65, 5)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (65, 48)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (65, 77)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (65, 114)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (66, 1)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (66, 44)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (66, 58)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (66, 110)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (67, 20)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (67, 57)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (67, 109)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (67, 127)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (68, 1)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (68, 21)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (68, 58)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (68, 110)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (69, 2)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (69, 22)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (69, 59)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (69, 111)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (70, 49)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (70, 78)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (70, 115)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (73, 19)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (73, 56)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (73, 108)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (73, 122)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (74, 10)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (74, 30)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (74, 44)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (74, 119)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (75, 11)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (75, 31)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (75, 45)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (75, 120)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (76, 12)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (76, 32)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (76, 46)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (76, 121)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (77, 7)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (77, 27)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (77, 41)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (77, 55)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (78, 19)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (78, 33)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (78, 47)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (78, 122)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (79, 9)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (79, 29)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (79, 43)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (79, 57)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (80, 20)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (80, 34)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (80, 48)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (80, 127)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (81, 1)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (81, 21)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (81, 35)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (81, 49)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (83, 4)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (83, 24)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (83, 38)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (83, 52)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (84, 5)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (84, 25)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (84, 39)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (84, 53)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (86, 9)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (86, 29)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (86, 43)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (86, 57)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (87, 9)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (87, 29)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (87, 43)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (87, 118)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (88, 2)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (88, 22)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (88, 36)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (88, 50)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (89, 3)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (89, 23)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (89, 37)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (89, 51)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (90, 20)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (90, 57)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (90, 109)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (90, 127)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (91, 26)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (91, 40)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (91, 54)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (92, 7)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (92, 27)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (92, 41)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (92, 55)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (93, 8)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (93, 28)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (93, 42)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (93, 56)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (95, 12)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (95, 32)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (95, 46)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (95, 60)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (96, 22)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (96, 36)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (96, 50)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (96, 79)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (97, 21)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (97, 35)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (97, 49)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (97, 78)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (98, 22)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (98, 36)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (98, 50)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (98, 79)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (99, 23)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (99, 37)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (99, 51)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (99, 80)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (100, 24)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (100, 38)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (100, 52)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (100, 104)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (101, 25)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (101, 39)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (101, 53)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (101, 105)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (102, 2)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (102, 45)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (102, 59)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (102, 111)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (103, 5)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (103, 48)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (103, 77)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (103, 114)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (104, 19)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (104, 33)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (104, 47)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (104, 61)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (105, 20)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (105, 34)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (105, 48)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (105, 77)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (107, 11)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (107, 31)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (107, 45)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (107, 59)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (108, 8)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (108, 28)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (108, 42)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (108, 117)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (110, 10)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (110, 30)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (110, 44)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (110, 58)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (111, 26)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (111, 40)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (111, 54)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (112, 1)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (112, 44)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (112, 58)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (112, 110)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (113, 2)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (113, 45)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (113, 59)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (113, 111)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (114, 10)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (114, 30)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (114, 44)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (114, 58)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (115, 3)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (115, 46)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (115, 60)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (115, 112)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (116, 4)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (116, 47)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (116, 61)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (116, 113)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (118, 43)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (118, 57)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (118, 109)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (118, 127)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (120, 42)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (120, 56)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (120, 108)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (120, 122)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (122, 40)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (122, 54)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (122, 106)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (122, 120)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (123, 5)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (123, 25)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (123, 39)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (123, 114)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (124, 37)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (124, 51)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (124, 80)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (124, 117)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (125, 38)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (125, 52)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (125, 104)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (125, 118)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (126, 39)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (126, 53)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (126, 105)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (126, 119)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (127, 19)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (127, 56)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (127, 108)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (127, 122)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (129, 41)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (129, 55)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (129, 107)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (129, 121)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (131, 29)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (131, 43)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (131, 57)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (131, 109)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (132, 21)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (132, 35)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (132, 49)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (132, 78)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (133, 30)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (133, 44)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (133, 58)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (133, 110)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (134, 31)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (134, 45)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (134, 59)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (134, 111)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (135, 7)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (135, 27)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (135, 41)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (135, 116)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (136, 26)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (136, 40)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (136, 54)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (136, 106)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (137, 27)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (137, 41)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (137, 55)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (137, 107)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (138, 28)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (138, 42)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (138, 56)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (138, 108)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (141, 35)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (141, 49)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (141, 78)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (141, 115)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (142, 36)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (142, 50)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (142, 79)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (142, 116)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (143, 26)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (143, 40)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (143, 115)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (144, 32)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (144, 46)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (144, 60)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (144, 112)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (145, 5)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (145, 25)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (145, 39)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (145, 53)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (146, 33)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (146, 47)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (146, 61)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (146, 113)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (147, 34)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (147, 48)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (147, 77)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (147, 114)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (148, 29)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (148, 43)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (148, 57)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (148, 109)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (149, 3)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (149, 46)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (149, 60)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (149, 112)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (151, 49)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (151, 78)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (151, 115)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (152, 7)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (152, 50)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (152, 79)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (152, 116)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (153, 8)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (153, 51)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (153, 80)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (153, 117)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (154, 5)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (154, 25)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (154, 77)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (154, 114)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (155, 9)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (155, 52)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (155, 104)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (155, 118)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (156, 10)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (156, 53)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (156, 105)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (156, 119)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (157, 11)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (157, 54)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (157, 106)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (157, 120)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (158, 12)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (158, 32)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (158, 46)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (158, 60)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (159, 11)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (159, 31)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (159, 45)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (159, 120)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (160, 43)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (160, 57)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (160, 109)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (160, 127)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (161, 12)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (161, 55)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (161, 107)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (161, 121)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (162, 1)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (162, 44)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (162, 58)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (162, 110)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (163, 2)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (163, 45)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (163, 59)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (163, 111)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (165, 40)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (165, 54)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (165, 106)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (165, 120)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (167, 3)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (167, 46)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (167, 60)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (167, 112)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (168, 4)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (168, 47)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (168, 61)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (168, 113)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (169, 5)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (169, 48)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (169, 77)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (169, 114)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (170, 19)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (170, 33)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (170, 47)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (170, 61)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (171, 41)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (171, 55)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (171, 107)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (171, 121)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (172, 42)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (172, 56)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (172, 108)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (172, 122)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (173, 12)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (173, 32)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (173, 46)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (173, 121)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (174, 37)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (174, 51)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (174, 80)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (174, 117)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (175, 38)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (175, 52)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (175, 104)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (175, 118)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (176, 4)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (176, 47)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (176, 61)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (176, 113)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (177, 39)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (177, 53)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (177, 105)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (177, 119)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (179, 34)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (179, 48)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (179, 77)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (179, 114)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (180, 35)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (180, 49)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (180, 78)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (180, 115)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (181, 36)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (181, 50)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (181, 79)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (181, 116)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (182, 1)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (182, 21)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (182, 35)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (182, 49)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (183, 26)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (183, 40)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (183, 54)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (183, 106)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (184, 19)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (184, 33)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (184, 47)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (184, 122)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (185, 20)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (185, 34)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (185, 48)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (185, 127)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (186, 32)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (186, 46)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (186, 60)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (186, 112)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (187, 33)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (187, 47)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (187, 61)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (187, 113)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (189, 27)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (189, 41)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (189, 55)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (189, 107)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (190, 28)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (190, 42)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (190, 56)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (190, 108)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (191, 4)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (191, 24)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (191, 61)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (191, 113)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (192, 29)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (192, 43)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (192, 57)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (192, 109)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (193, 30)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (193, 44)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (193, 58)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (193, 110)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (194, 31)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (194, 45)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (194, 59)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (194, 111)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (196, 22)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (196, 36)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (196, 50)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (196, 79)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (197, 2)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (197, 22)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (197, 36)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (197, 50)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (199, 23)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (199, 37)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (199, 51)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (199, 80)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (200, 3)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (200, 23)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (200, 37)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (200, 51)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (202, 12)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (202, 32)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (202, 46)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (202, 60)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (204, 24)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (204, 38)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (204, 52)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (204, 104)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (205, 25)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (205, 39)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (205, 53)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (205, 105)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (206, 20)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (206, 34)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (206, 48)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (206, 77)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (207, 19)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (207, 33)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (207, 47)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (207, 61)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (208, 20)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (208, 34)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (208, 48)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (208, 77)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (209, 21)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (209, 35)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (209, 49)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (209, 78)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (210, 3)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (210, 23)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (210, 37)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (210, 51)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (211, 4)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (211, 24)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (211, 38)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (211, 52)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (212, 8)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (212, 51)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (212, 80)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (212, 117)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (213, 9)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (213, 29)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (213, 43)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (213, 57)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (214, 10)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (214, 30)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (214, 44)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (214, 58)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (215, 11)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (215, 31)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (215, 45)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (215, 59)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (217, 31)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (217, 45)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (217, 59)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (218, 3)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (218, 23)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (218, 60)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (218, 112)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (219, 53)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (220, 26)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (220, 40)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (220, 54)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (221, 7)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (221, 27)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (221, 41)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (221, 55)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (222, 8)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (222, 42)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (222, 56)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (224, 10)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (224, 44)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (224, 119)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (225, 22)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (225, 59)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (225, 111)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (226, 4)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (226, 24)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (226, 38)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (226, 113)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (227, 114)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (228, 26)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (228, 40)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (228, 115)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (229, 7)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (229, 27)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (229, 41)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (229, 116)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (230, 8)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (230, 42)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (230, 117)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (232, 29)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (232, 43)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (232, 118)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (234, 20)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (234, 34)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (234, 109)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (234, 127)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (235, 1)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (235, 21)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (235, 35)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (235, 110)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (236, 22)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (236, 36)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (236, 111)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (237, 3)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (237, 23)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (237, 37)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (237, 112)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (239, 12)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (239, 32)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (239, 107)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (239, 121)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (240, 108)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (240, 122)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (243, 31)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (243, 106)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (243, 120)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (245, 20)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (245, 57)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (245, 109)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (245, 127)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (246, 1)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (246, 21)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (246, 58)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (246, 110)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (247, 22)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (247, 59)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (247, 111)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (248, 3)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (248, 23)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (248, 60)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (248, 112)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (249, 4)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (249, 24)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (249, 61)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (249, 113)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (250, 77)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (250, 114)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (252, 12)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (252, 55)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (252, 107)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (252, 121)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (253, 8)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (253, 42)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (253, 56)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (254, 26)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (254, 78)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (254, 115)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (255, 7)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (255, 27)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (255, 79)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (255, 116)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (256, 8)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (256, 80)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (256, 117)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (257, 29)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (257, 104)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (257, 118)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (258, 10)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (258, 105)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (258, 119)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (262, 56)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (262, 108)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (262, 122)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (263, 24)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (267, 37)
GO
INSERT [dbo].[EmployeesProjects] ([EmployeeID], [ProjectID]) VALUES (267, 80)
GO
SET IDENTITY_INSERT [dbo].[Projects] ON 
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (1, N'Classic Vest', N'Research, design and development of Classic Vest. Light-weight, wind-resistant, packs to fit into a pocket.', CAST(N'2003-06-01T00:00:00' AS SmallDateTime), NULL)
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (2, N'Cycling Cap', N'Research, design and development of Cycling Cap. Traditional style with a flip-up brim; one-size fits all.', CAST(N'2001-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (3, N'Full-Finger Gloves', N'Research, design and development of Full-Finger Gloves. Synthetic palm, flexible knuckles, breathable mesh upper. Worn by the AWC team riders.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (4, N'Half-Finger Gloves', N'Research, design and development of Half-Finger Gloves. Full padding, improved finger flex, durable palm, adjustable closure.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (5, N'HL Mountain Frame', N'Research, design and development of HL Mountain Frame. Each frame is hand-crafted in our Bothell facility to the optimum diameter and wall-thickness required of a premium mountain frame. The heat-treated welded aluminum frame has a larger diameter tube that absorbs the bumps.', CAST(N'2001-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (6, N'HL Road Frame', N'Research, design and development of HL Road Frame. Our lightest and best quality aluminum frame made from the newest alloy; it is welded and heat-treated for strength. Our innovative design results in maximum comfort and performance.', CAST(N'1998-05-02T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (7, N'HL Touring Frame', N'Research, design and development of HL Touring Frame. The HL aluminum frame is custom-shaped for both good looks and strength; it will withstand the most rigorous challenges of daily riding. Men''s version.', CAST(N'2005-05-16T16:34:00' AS SmallDateTime), NULL)
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (8, N'LL Mountain Frame', N'Research, design and development of LL Mountain Frame. Our best value utilizing the same, ground-breaking frame technology as the ML aluminum frame.', CAST(N'2002-11-20T09:57:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (9, N'LL Road Frame', N'Research, design and development of LL Road Frame. The LL Frame provides a safe comfortable ride, while offering superior bump absorption in a value-priced aluminum frame.', CAST(N'2001-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (10, N'LL Touring Frame', N'Research, design and development of LL Touring Frame. Lightweight butted aluminum frame provides a more upright riding position for a trip around town.  Our ground-breaking design provides optimum comfort.', CAST(N'2005-05-16T16:34:00' AS SmallDateTime), NULL)
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (11, N'Long-Sleeve Logo Jersey', N'Research, design and development of Long-Sleeve Logo Jersey. Unisex long-sleeve AWC logo microfiber cycling jersey', CAST(N'2001-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (12, N'Men''s Bib-Shorts', N'Research, design and development of Men''s Bib-Shorts. Designed for the AWC team with stay-put straps, moisture-control, chamois padding, and leg grippers.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (19, N'Mountain-100', N'Research, design and development of Mountain-100. Top-of-the-line competition mountain bike. Performance-enhancing options include the innovative HL Frame, super-smooth front suspension, and traction for all terrain.', CAST(N'2001-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (20, N'Mountain-200', N'Research, design and development of Mountain-200. Serious back-country riding. Perfect for all levels of competition. Uses the same HL Frame as the Mountain-100.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2004-03-11T10:32:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (21, N'Mountain-300', N'Research, design and development of Mountain-300. For true trail addicts.  An extremely durable bike that will go anywhere and keep you in control on challenging terrain - without breaking your budget.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (22, N'Mountain-400-W', N'Research, design and development of Mountain-400-W. This bike delivers a high-level of performance on a budget. It is responsive and maneuverable, and offers peace-of-mind when you decide to go off-road.', CAST(N'2006-02-22T00:00:00' AS SmallDateTime), NULL)
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (23, N'Mountain-500', N'Research, design and development of Mountain-500. Suitable for any type of riding, on or off-road. Fits any budget. Smooth-shifting with a comfortable ride.', CAST(N'2002-11-20T09:57:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (24, N'Racing Socks', N'Research, design and development of Racing Socks. Thin, lightweight and durable with cuffs that stay up.', CAST(N'2005-11-22T00:00:00' AS SmallDateTime), NULL)
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (25, N'Road-150', N'Research, design and development of Road-150. This bike is ridden by race winners. Developed with the Adventure Works Cycles professional race team, it has a extremely light heat-treated aluminum frame, and steering that allows precision control.', CAST(N'2001-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (26, N'Road-250', N'Research, design and development of Road-250. Alluminum-alloy frame provides a light, stiff ride, whether you are racing in the velodrome or on a demanding club ride on country roads.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (27, N'Road-350-W', N'Research, design and development of Road-350-W. Cross-train, race, or just socialize on a sleek, aerodynamic bike designed for a woman.  Advanced seat technology provides comfort all day.', CAST(N'2003-06-01T00:00:00' AS SmallDateTime), NULL)
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (28, N'Road-450', N'Research, design and development of Road-450. A true multi-sport bike that offers streamlined riding and a revolutionary design. Aerodynamic design lets you ride with the pros, and the gearing will conquer hilly roads.', CAST(N'2001-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (29, N'Road-550-W', N'Research, design and development of Road-550-W. Same technology as all of our Road series bikes, but the frame is sized for a woman.  Perfect all-around bike for road or racing.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (30, N'Road-650', N'Research, design and development of Road-650. Value-priced bike with many features of our top-of-the-line models. Has the same light, stiff frame, and the quick acceleration we''re famous for.', CAST(N'2001-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (31, N'Road-750', N'Research, design and development of Road-750. Entry level adult bike; offers a comfortable ride cross-country or down the block. Quick-release hubs and rims.', CAST(N'2002-11-20T09:57:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (32, N'Short-Sleeve Classic Jersey', N'Research, design and development of Short-Sleeve Classic Jersey. Short sleeve classic breathable jersey with superior moisture control, front zipper, and 3 back pockets.', CAST(N'2003-06-01T00:00:00' AS SmallDateTime), NULL)
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (33, N'Sport-100', N'Research, design and development of Sport-100. Universal fit, well-vented, lightweight , snap-on visor.', CAST(N'2001-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (34, N'Touring-1000', N'Research, design and development of Touring-1000. Travel in style and comfort. Designed for maximum comfort and safety. Wide gear range takes on all hills. High-tech aluminum alloy construction provides durability without added weight.', CAST(N'2002-11-20T09:57:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (35, N'Touring-2000', N'Research, design and development of Touring-2000. The plush custom saddle keeps you riding all day,  and there''s plenty of space to add panniers and bike bags to the newly-redesigned carrier.  This bike has stability when fully-loaded.', CAST(N'2002-11-20T09:57:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (36, N'Touring-3000', N'Research, design and development of Touring-3000. All-occasion value bike with our basic comfort and safety features. Offers wider, more stable tires for a ride around town or weekend trip.', CAST(N'2002-11-20T09:57:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (37, N'Women''s Mountain Shorts', N'Research, design and development of Women''s Mountain Shorts. Heavy duty, abrasion-resistant shorts feature seamless, lycra inner shorts with anti-bacterial chamois for comfort.', CAST(N'2003-06-01T00:00:00' AS SmallDateTime), NULL)
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (38, N'Women''s Tights', N'Research, design and development of Women''s Tights. Warm spandex tights for winter riding; seamless chamois construction eliminates pressure points.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (39, N'Mountain-400', N'Research, design and development of Mountain-400. Suitable for any type of off-road trip. Fits any budget.', CAST(N'2001-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (40, N'Road-550', N'Research, design and development of Road-550. Same technology as all of our Road series bikes.  Perfect all-around bike for road or racing.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (41, N'Road-350', N'Research, design and development of Road-350. Cross-train, race, or just socialize on a sleek, aerodynamic bike.  Advanced seat technology provides comfort all day.', CAST(N'2002-11-20T09:57:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (42, N'LL Mountain Front Wheel', N'Research, design and development of LL Mountain Front Wheel. Replacement mountain wheel for entry-level rider.', CAST(N'2002-11-20T09:57:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (43, N'Touring Rear Wheel', N'Research, design and development of Touring Rear Wheel. Excellent aerodynamic rims guarantee a smooth ride.', CAST(N'2005-05-16T16:34:00' AS SmallDateTime), NULL)
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (44, N'Touring Front Wheel', N'Research, design and development of Touring Front Wheel. Aerodynamic rims for smooth riding.', CAST(N'2005-05-16T16:34:00' AS SmallDateTime), NULL)
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (45, N'ML Mountain Front Wheel', N'Research, design and development of ML Mountain Front Wheel. Replacement mountain wheel for the casual to serious rider.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (46, N'HL Mountain Front Wheel', N'Research, design and development of HL Mountain Front Wheel. High-performance mountain replacement wheel.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (47, N'LL Touring Handlebars', N'Research, design and development of LL Touring Handlebars. Unique shape reduces fatigue for entry level riders.', CAST(N'2005-05-16T16:34:00' AS SmallDateTime), NULL)
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (48, N'HL Touring Handlebars', N'Research, design and development of HL Touring Handlebars. A light yet stiff aluminum bar for long distance riding.', CAST(N'2005-05-16T16:34:00' AS SmallDateTime), NULL)
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (49, N'LL Road Front Wheel', N'Research, design and development of LL Road Front Wheel. Replacement road front wheel for entry-level cyclist.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (50, N'ML Road Front Wheel', N'Research, design and development of ML Road Front Wheel. Sturdy alloy features a quick-release hub.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (51, N'HL Road Front Wheel', N'Research, design and development of HL Road Front Wheel. Strong wheel with double-walled rim.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (52, N'LL Mountain Handlebars', N'Research, design and development of LL Mountain Handlebars. All-purpose bar for on or off-road.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (53, N'Touring Pedal', N'Research, design and development of Touring Pedal. A stable pedal for all-day riding.', CAST(N'2005-05-16T16:34:00' AS SmallDateTime), NULL)
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (54, N'ML Mountain Handlebars', N'Research, design and development of ML Mountain Handlebars. Tough aluminum alloy bars for downhill.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (55, N'HL Mountain Handlebars', N'Research, design and development of HL Mountain Handlebars. Flat bar strong enough for the pro circuit.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (56, N'LL Road Handlebars', N'Research, design and development of LL Road Handlebars. Unique shape provides easier reach to the levers.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (57, N'ML Road Handlebars', N'Research, design and development of ML Road Handlebars. Anatomically shaped aluminum tube bar will suit all riders.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (58, N'HL Road Handlebars', N'Research, design and development of HL Road Handlebars. Designed for racers; high-end anatomically shaped bar from aluminum alloy.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (59, N'LL Headset', N'Research, design and development of LL Headset. Threadless headset provides quality at an economical price.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (60, N'ML Headset', N'Research, design and development of ML Headset. Sealed cartridge keeps dirt out.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (61, N'HL Headset', N'Research, design and development of HL Headset. High-quality 1" threadless headset with a grease port for quick lubrication.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (77, N'ML Road Rear Wheel', N'Research, design and development of ML Road Rear Wheel. Aluminum alloy rim with stainless steel spokes; built for speed.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (78, N'HL Road Rear Wheel', N'Research, design and development of HL Road Rear Wheel. Strong rear wheel with double-walled rim.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (79, N'LL Mountain Seat/Saddle 2', N'Research, design and development of LL Mountain Seat/Saddle 2. Synthetic leather. Features gel for increased comfort.', CAST(N'2003-06-01T00:00:00' AS SmallDateTime), NULL)
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (80, N'ML Mountain Seat/Saddle 2', N'Research, design and development of ML Mountain Seat/Saddle 2. Designed to absorb shock.', CAST(N'2003-06-01T00:00:00' AS SmallDateTime), CAST(N'2004-03-11T10:32:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (104, N'LL Fork', N'Research, design and development of LL Fork. Stout design absorbs shock and offers more precise steering.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (105, N'ML Fork', N'Research, design and development of ML Fork. Composite road fork with an aluminum steerer tube.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (106, N'HL Fork', N'Research, design and development of HL Fork. High-performance carbon road fork with curved legs.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (107, N'Hydration Pack', N'Research, design and development of Hydration Pack. Versatile 70 oz hydration pack offers extra storage, easy-fill access, and a waist belt.', CAST(N'2003-06-01T00:00:00' AS SmallDateTime), NULL)
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (108, N'Taillight', N'Research, design and development of Taillight. Affordable light for safe night riding - uses 3 AAA batteries', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (109, N'Headlights - Dual-Beam', N'Research, design and development of Headlights - Dual-Beam. Rechargeable dual-beam headlight.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (110, N'Headlights - Weatherproof', N'Research, design and development of Headlights - Weatherproof. Rugged weatherproof headlight.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (111, N'Water Bottle', N'Research, design and development of Water Bottle. AWC logo water bottle - holds 30 oz; leak-proof.', CAST(N'2003-06-01T00:00:00' AS SmallDateTime), NULL)
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (112, N'Mountain Bottle Cage', N'Research, design and development of Mountain Bottle Cage. Tough aluminum cage holds bottle securly on tough terrain.', CAST(N'2003-06-01T00:00:00' AS SmallDateTime), NULL)
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (113, N'Road Bottle Cage', N'Research, design and development of Road Bottle Cage. Aluminum cage is lighter than our mountain version; perfect for long distance trips.', CAST(N'2004-02-21T00:00:00' AS SmallDateTime), NULL)
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (114, N'Patch kit', N'Research, design and development of Patch kit. Includes 8 different size patches, glue and sandpaper.', CAST(N'2003-06-01T00:00:00' AS SmallDateTime), NULL)
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (115, N'Cable Lock', N'Research, design and development of Cable Lock. Wraps to fit front and rear tires, carrier and 2 keys included.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (116, N'Minipump', N'Research, design and development of Minipump. Designed for convenience. Fits in your pocket. Aluminum barrel. 160psi rated.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (117, N'Mountain Pump', N'Research, design and development of Mountain Pump. Simple and light-weight. Emergency patches stored in handle.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (118, N'Hitch Rack - 4-Bike', N'Research, design and development of Hitch Rack - 4-Bike. Carries 4 bikes securely; steel construction, fits 2" receiver hitch.', CAST(N'2003-06-01T00:00:00' AS SmallDateTime), NULL)
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (119, N'Bike Wash', N'Research, design and development of Bike Wash. Washes off the toughest road grime; dissolves grease, environmentally safe. 1-liter bottle.', CAST(N'2005-08-01T00:00:00' AS SmallDateTime), NULL)
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (120, N'Touring-Panniers', N'Research, design and development of Touring-Panniers. Durable, water-proof nylon construction with easy access. Large enough for weekend trips.', CAST(N'2002-06-01T00:00:00' AS SmallDateTime), CAST(N'2003-06-01T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (121, N'Fender Set - Mountain', N'Research, design and development of Fender Set - Mountain. Clip-on fenders fit most mountain bikes.', CAST(N'2003-06-01T00:00:00' AS SmallDateTime), NULL)
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (122, N'All-Purpose Bike Stand', N'Research, design and development of All-Purpose Bike Stand. Perfect all-purpose bike stand for working on your bike at home. Quick-adjusting clamps and steel construction.', CAST(N'2005-09-01T00:00:00' AS SmallDateTime), NULL)
GO
INSERT [dbo].[Projects] ([ProjectID], [Name], [Description], [StartDate], [EndDate]) VALUES (127, N'Rear Derailleur', N'Research, design and development of Rear Derailleur. Wide-link design.', CAST(N'2003-06-01T00:00:00' AS SmallDateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Projects] OFF
GO
SET IDENTITY_INSERT [dbo].[Towns] ON 
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (1, N'Redmond')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (2, N'Calgary')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (3, N'Edmonds')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (4, N'Seattle')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (5, N'Bellevue')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (6, N'Issaquah')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (7, N'Everett')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (8, N'Bothell')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (9, N'San Francisco')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (10, N'Index')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (11, N'Snohomish')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (12, N'Monroe')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (13, N'Renton')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (14, N'Newport Hills')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (15, N'Carnation')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (16, N'Sammamish')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (17, N'Duvall')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (18, N'Gold Bar')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (19, N'Nevada')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (20, N'Kenmore')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (21, N'Melbourne')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (22, N'Kent')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (23, N'Cambridge')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (24, N'Minneapolis')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (25, N'Portland')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (26, N'Duluth')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (27, N'Detroit')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (28, N'Memphis')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (29, N'Ottawa')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (30, N'Bordeaux')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (31, N'Berlin')
GO
INSERT [dbo].[Towns] ([TownID], [Name]) VALUES (32, N'Sofia')
GO
SET IDENTITY_INSERT [dbo].[Towns] OFF
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Towns] FOREIGN KEY([TownID])
REFERENCES [dbo].[Towns] ([TownID])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Towns]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [FK_Departments_Employees] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [FK_Departments_Employees]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Addresses] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Addresses] ([AddressID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Addresses]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Employees]
GO
ALTER TABLE [dbo].[EmployeesProjects]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesProjects_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeesProjects] CHECK CONSTRAINT [FK_EmployeesProjects_Employees]
GO
ALTER TABLE [dbo].[EmployeesProjects]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesProjects_Projects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[EmployeesProjects] CHECK CONSTRAINT [FK_EmployeesProjects_Projects]
GO
USE [master]
GO
ALTER DATABASE [SoftUni] SET  READ_WRITE 
GO
