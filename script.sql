USE [master]
GO
/****** Object:  Database [ProcedureTest1]    Script Date: 21-08-2023 22:12:00 ******/
CREATE DATABASE [ProcedureTest1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProcedureTest1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProcedureTest1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProcedureTest1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProcedureTest1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ProcedureTest1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProcedureTest1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProcedureTest1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProcedureTest1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProcedureTest1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProcedureTest1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProcedureTest1] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProcedureTest1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProcedureTest1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProcedureTest1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProcedureTest1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProcedureTest1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProcedureTest1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProcedureTest1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProcedureTest1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProcedureTest1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProcedureTest1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProcedureTest1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProcedureTest1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProcedureTest1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProcedureTest1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProcedureTest1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProcedureTest1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProcedureTest1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProcedureTest1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProcedureTest1] SET  MULTI_USER 
GO
ALTER DATABASE [ProcedureTest1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProcedureTest1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProcedureTest1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProcedureTest1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProcedureTest1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProcedureTest1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ProcedureTest1] SET QUERY_STORE = OFF
GO
USE [ProcedureTest1]
GO
/****** Object:  Table [dbo].[tbl_register]    Script Date: 21-08-2023 22:12:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_register](
	[sr] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](80) NULL,
	[mobile] [bigint] NULL,
	[email] [varchar](100) NOT NULL,
	[qualification] [varchar](100) NULL,
	[gender] [varchar](10) NULL,
	[address] [text] NULL,
 CONSTRAINT [PK_tbl_register] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_deletedata]    Script Date: 21-08-2023 22:12:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_deletedata] 
@sr int
AS
BEGIN
	delete from tbl_register where sr= @sr
END
GO
/****** Object:  StoredProcedure [dbo].[sp_deletedata1]    Script Date: 21-08-2023 22:12:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_deletedata1] 
@email varchar(100)
AS
BEGIN
	delete from tbl_register where email= @email
END
GO
/****** Object:  StoredProcedure [dbo].[sp_edit]    Script Date: 21-08-2023 22:12:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[sp_edit]
@sr int,
@name varchar(50),
@mobile bigint,
@email varchar(100),
@qualification varchar(100),
@gender varchar(10),
@address text
AS
BEGIN
	update tbl_register set name=@name,mobile=@mobile,email=@email,qualification=@qualification,gender=@gender,address=@address where sr=@sr
END
GO
/****** Object:  StoredProcedure [dbo].[sp_register]    Script Date: 21-08-2023 22:12:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_register]
@name varchar(50),
@mobile bigint,
@email varchar(100),
@qualification varchar(100),
@gender varchar(10),
@address text
as
begin
insert into tbl_register (name,mobile,email,qualification,gender,address)values(@name,@mobile,@email,@qualification,@gender,@address);
end
GO
/****** Object:  StoredProcedure [dbo].[sp_selectdata]    Script Date: 21-08-2023 22:12:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_selectdata]
AS
BEGIN
	select * from tbl_register order by sr desc
END
GO
USE [master]
GO
ALTER DATABASE [ProcedureTest1] SET  READ_WRITE 
GO
