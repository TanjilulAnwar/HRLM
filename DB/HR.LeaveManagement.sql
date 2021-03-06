USE [master]
GO
/****** Object:  Database [hr_leavemanagement_db]    Script Date: 2/16/2022 6:48:34 PM ******/
CREATE DATABASE [hr_leavemanagement_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'hr_leavemanagement_db', FILENAME = N'C:\Users\tanjilul\hr_leavemanagement_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'hr_leavemanagement_db_log', FILENAME = N'C:\Users\tanjilul\hr_leavemanagement_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [hr_leavemanagement_db] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [hr_leavemanagement_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [hr_leavemanagement_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [hr_leavemanagement_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [hr_leavemanagement_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [hr_leavemanagement_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [hr_leavemanagement_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [hr_leavemanagement_db] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [hr_leavemanagement_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [hr_leavemanagement_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [hr_leavemanagement_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [hr_leavemanagement_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [hr_leavemanagement_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [hr_leavemanagement_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [hr_leavemanagement_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [hr_leavemanagement_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [hr_leavemanagement_db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [hr_leavemanagement_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [hr_leavemanagement_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [hr_leavemanagement_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [hr_leavemanagement_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [hr_leavemanagement_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [hr_leavemanagement_db] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [hr_leavemanagement_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [hr_leavemanagement_db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [hr_leavemanagement_db] SET  MULTI_USER 
GO
ALTER DATABASE [hr_leavemanagement_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [hr_leavemanagement_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [hr_leavemanagement_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [hr_leavemanagement_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [hr_leavemanagement_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [hr_leavemanagement_db] SET QUERY_STORE = OFF
GO
USE [hr_leavemanagement_db]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [hr_leavemanagement_db]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2/16/2022 6:48:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveAllocations]    Script Date: 2/16/2022 6:48:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveAllocations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NumberOfDays] [int] NOT NULL,
	[LeaveTypeId] [int] NOT NULL,
	[Period] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastModifiedDate] [nvarchar](max) NULL,
	[LastModifiedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_LeaveAllocations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveRequests]    Script Date: 2/16/2022 6:48:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveRequests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[LeaveTypeId] [int] NOT NULL,
	[DateRequested] [datetime2](7) NOT NULL,
	[RequestComments] [nvarchar](max) NULL,
	[DateActioned] [datetime2](7) NULL,
	[Approved] [bit] NULL,
	[Cancelled] [bit] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastModifiedDate] [nvarchar](max) NULL,
	[LastModifiedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_LeaveRequests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveTypess]    Script Date: 2/16/2022 6:48:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveTypess](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[DefaultDays] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[LastModifiedDate] [nvarchar](max) NULL,
	[LastModifiedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_LeaveTypess] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220216073536_InitialCreation', N'5.0.14')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220216101111_SeedingLeaveTypes', N'5.0.14')
SET IDENTITY_INSERT [dbo].[LeaveAllocations] ON 

INSERT [dbo].[LeaveAllocations] ([Id], [NumberOfDays], [LeaveTypeId], [Period], [DateCreated], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1, 55, 6, 2023, CAST(N'2022-02-16T18:21:25.0829185' AS DateTime2), NULL, N'2/16/2022 6:41:43 PM', NULL)
INSERT [dbo].[LeaveAllocations] ([Id], [NumberOfDays], [LeaveTypeId], [Period], [DateCreated], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2, 15, 6, 2023, CAST(N'2022-02-16T18:36:24.3807808' AS DateTime2), NULL, N'2/16/2022 6:36:24 PM', NULL)
SET IDENTITY_INSERT [dbo].[LeaveAllocations] OFF
SET IDENTITY_INSERT [dbo].[LeaveRequests] ON 

INSERT [dbo].[LeaveRequests] ([Id], [StartDate], [EndDate], [LeaveTypeId], [DateRequested], [RequestComments], [DateActioned], [Approved], [Cancelled], [DateCreated], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (5, CAST(N'2022-02-10T11:47:02.6250000' AS DateTime2), CAST(N'2022-02-25T11:47:02.6250000' AS DateTime2), 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Vacation', NULL, NULL, 0, CAST(N'2022-02-16T17:49:56.4732048' AS DateTime2), NULL, N'2/16/2022 6:04:00 PM', NULL)
SET IDENTITY_INSERT [dbo].[LeaveRequests] OFF
SET IDENTITY_INSERT [dbo].[LeaveTypess] ON 

INSERT [dbo].[LeaveTypess] ([Id], [Name], [DefaultDays], [DateCreated], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (1, N'Vacation', 10, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, N'2/16/2022 6:21:25 PM', NULL)
INSERT [dbo].[LeaveTypess] ([Id], [Name], [DefaultDays], [DateCreated], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (2, N'Sick', 12, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, N'2/16/2022 5:51:05 PM', NULL)
INSERT [dbo].[LeaveTypess] ([Id], [Name], [DefaultDays], [DateCreated], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (3, N'Casual', 15, CAST(N'2022-02-16T17:20:30.4290459' AS DateTime2), NULL, N'2/16/2022 5:34:15 PM', NULL)
INSERT [dbo].[LeaveTypess] ([Id], [Name], [DefaultDays], [DateCreated], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (4, N'Maternity', 60, CAST(N'2022-02-16T17:20:46.4557456' AS DateTime2), NULL, N'2/16/2022 5:20:46 PM', NULL)
INSERT [dbo].[LeaveTypess] ([Id], [Name], [DefaultDays], [DateCreated], [CreatedBy], [LastModifiedDate], [LastModifiedBy]) VALUES (6, N'Holiday', 10, CAST(N'2022-02-16T18:21:25.0829951' AS DateTime2), NULL, N'2/16/2022 6:41:43 PM', NULL)
SET IDENTITY_INSERT [dbo].[LeaveTypess] OFF
/****** Object:  Index [IX_LeaveAllocations_LeaveTypeId]    Script Date: 2/16/2022 6:48:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_LeaveAllocations_LeaveTypeId] ON [dbo].[LeaveAllocations]
(
	[LeaveTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LeaveRequests_LeaveTypeId]    Script Date: 2/16/2022 6:48:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_LeaveRequests_LeaveTypeId] ON [dbo].[LeaveRequests]
(
	[LeaveTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LeaveAllocations]  WITH CHECK ADD  CONSTRAINT [FK_LeaveAllocations_LeaveTypess_LeaveTypeId] FOREIGN KEY([LeaveTypeId])
REFERENCES [dbo].[LeaveTypess] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LeaveAllocations] CHECK CONSTRAINT [FK_LeaveAllocations_LeaveTypess_LeaveTypeId]
GO
ALTER TABLE [dbo].[LeaveRequests]  WITH CHECK ADD  CONSTRAINT [FK_LeaveRequests_LeaveTypess_LeaveTypeId] FOREIGN KEY([LeaveTypeId])
REFERENCES [dbo].[LeaveTypess] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LeaveRequests] CHECK CONSTRAINT [FK_LeaveRequests_LeaveTypess_LeaveTypeId]
GO
USE [master]
GO
ALTER DATABASE [hr_leavemanagement_db] SET  READ_WRITE 
GO
