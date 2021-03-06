USE [master]
GO
/****** Object:  Database [LearningPlatform]    Script Date: 1/26/2021 10:06:03 AM ******/
CREATE DATABASE [LearningPlatform]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LearningPlatform', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\LearningPlatform.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LearningPlatform_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\LearningPlatform_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [LearningPlatform] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LearningPlatform].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LearningPlatform] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LearningPlatform] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LearningPlatform] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LearningPlatform] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LearningPlatform] SET ARITHABORT OFF 
GO
ALTER DATABASE [LearningPlatform] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LearningPlatform] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LearningPlatform] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LearningPlatform] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LearningPlatform] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LearningPlatform] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LearningPlatform] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LearningPlatform] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LearningPlatform] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LearningPlatform] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LearningPlatform] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LearningPlatform] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LearningPlatform] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LearningPlatform] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LearningPlatform] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LearningPlatform] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LearningPlatform] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LearningPlatform] SET RECOVERY FULL 
GO
ALTER DATABASE [LearningPlatform] SET  MULTI_USER 
GO
ALTER DATABASE [LearningPlatform] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LearningPlatform] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LearningPlatform] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LearningPlatform] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LearningPlatform] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LearningPlatform', N'ON'
GO
ALTER DATABASE [LearningPlatform] SET QUERY_STORE = OFF
GO
USE [LearningPlatform]
GO
USE [LearningPlatform]
GO
/****** Object:  Sequence [dbo].[hibernate_sequence]    Script Date: 1/26/2021 10:06:03 AM ******/
CREATE SEQUENCE [dbo].[hibernate_sequence] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Table [dbo].[courses]    Script Date: 1/26/2021 10:06:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[id] [varchar](255) NOT NULL,
	[description] [varchar](255) NULL,
	[course_name] [varchar](255) NULL,
	[teacher] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 1/26/2021 10:06:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[id] [varchar](255) NOT NULL,
	[department] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[lastname] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[password] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students_courses]    Script Date: 1/26/2021 10:06:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students_courses](
	[student_id] [varchar](255) NOT NULL,
	[course_id] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[student_id] ASC,
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[students_courses]  WITH CHECK ADD  CONSTRAINT [FKcc42107lsifo5rjyjlhdu6i6u] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[students_courses] CHECK CONSTRAINT [FKcc42107lsifo5rjyjlhdu6i6u]
GO
ALTER TABLE [dbo].[students_courses]  WITH CHECK ADD  CONSTRAINT [FKfbiw8vd6a6fxgjlqi99c977al] FOREIGN KEY([student_id])
REFERENCES [dbo].[student] ([id])
GO
ALTER TABLE [dbo].[students_courses] CHECK CONSTRAINT [FKfbiw8vd6a6fxgjlqi99c977al]
GO
USE [master]
GO
ALTER DATABASE [LearningPlatform] SET  READ_WRITE 
GO
