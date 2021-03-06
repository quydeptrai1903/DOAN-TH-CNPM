USE [master]
GO
/****** Object:  Database [QLHS]    Script Date: 09/08/2020 12:26:03 CH ******/
CREATE DATABASE [QLHS]
 
ALTER DATABASE [QLHS] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLHS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLHS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLHS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLHS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLHS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLHS] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLHS] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLHS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLHS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLHS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLHS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLHS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLHS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLHS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLHS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLHS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLHS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLHS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLHS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLHS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLHS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLHS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLHS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLHS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLHS] SET  MULTI_USER 
GO
ALTER DATABASE [QLHS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLHS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLHS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLHS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLHS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLHS] SET QUERY_STORE = OFF
GO
USE [QLHS]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 09/08/2020 12:26:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [varchar](30) NOT NULL,
	[Pass] [varchar](30) NULL,
	[Email] [varchar](30) NULL,
	[FullName] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIEM]    Script Date: 09/08/2020 12:26:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIEM](
	[MADIEM] [int] IDENTITY(1,1) NOT NULL,
	[LOAIDIEM] [nvarchar](20) NOT NULL,
	[MAHS] [int] NOT NULL,
	[MAMONHOC] [varchar](10) NOT NULL,
	[HOCKY] [nvarchar](10) NOT NULL,
	[MALOP] [int] NOT NULL,
	[GIATRIDIEM] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MADIEM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOCSINH]    Script Date: 09/08/2020 12:26:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOCSINH](
	[MAHS] [int] IDENTITY(1,1) NOT NULL,
	[MALOP] [int] NOT NULL,
	[HOTEN] [nvarchar](40) NOT NULL,
	[NGAYSINH] [smalldatetime] NOT NULL,
	[GIOITINH] [nvarchar](20) NOT NULL,
	[NOISINH] [nvarchar](40) NOT NULL,
	[TENNGGIAMHO] [nvarchar](40) NOT NULL,
	[SODT] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MAHS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOP]    Script Date: 09/08/2020 12:26:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOP](
	[MALOP] [int] IDENTITY(1,1) NOT NULL,
	[TENLOP] [nvarchar](20) NOT NULL,
	[SISO] [int] NOT NULL,
	[TENGV] [nvarchar](50) NOT NULL,
	[KHOI] [nvarchar](20) NOT NULL,
	[TENNAMHOC] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MALOP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MONHOC]    Script Date: 09/08/2020 12:26:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MONHOC](
	[MAMONHOC] [varchar](10) NOT NULL,
	[TENMONHOC] [nvarchar](40) NOT NULL,
	[SOTIET] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MAMONHOC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[DeleteClass]    Script Date: 09/08/2020 12:26:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteClass]
@malop int
as 
begin
	delete lop where malop=@malop
end 
GO
/****** Object:  StoredProcedure [dbo].[DeleteHS]    Script Date: 09/08/2020 12:26:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteHS]
@mahs int
as
begin
	delete HOCSINH where MAHS=@mahs
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteMark]    Script Date: 09/08/2020 12:26:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteMark]
@madiem int
as
begin
	delete DIEM where MADIEM=@madiem
end
GO
/****** Object:  StoredProcedure [dbo].[GetAllClass]    Script Date: 09/08/2020 12:26:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetAllClass]
as
begin 
	select*from lop
end
GO
/****** Object:  StoredProcedure [dbo].[GetAllHS]    Script Date: 09/08/2020 12:26:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetAllHS]
@malop int
as
begin	
	select mahs,HOCSINH.MALOP,hoten,ngaysinh,gioitinh,noisinh,TENNGGIAMHO,sodt
	from lop,HOCSINH
	where lop.malop=hocsinh.malop and lop.malop=@malop
end
GO
/****** Object:  StoredProcedure [dbo].[GetAllMarks]    Script Date: 09/08/2020 12:26:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetAllMarks]
@mahs int
as
begin
	select *from DIEM where mahs=@mahs
end
GO
/****** Object:  StoredProcedure [dbo].[InsertMark]    Script Date: 09/08/2020 12:26:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertMark]
@mahs int,
@mamh varchar(10),
@loaidiem nvarchar(20),
@malop int,
@hocky nvarchar(10),
@diem float
as
begin
	insert into DIEM values(@loaidiem,@mahs,@mamh,@hocky,@malop,@diem)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertNewClass]    Script Date: 09/08/2020 12:26:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertNewClass]
@tenlop nvarchar(20),
@siso int,
@tengv nvarchar(50),
@khoi nvarchar(20),
@tennamhoc nvarchar(20)
as 
begin
	insert into lop values(@tenlop,@siso,@tengv,@khoi,@tennamhoc)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertNewStudent]    Script Date: 09/08/2020 12:26:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertNewStudent]
@malop int,
@hoten nvarchar(40),
@ngaysinh smalldatetime,
@gioitinh nvarchar(20),
@noisinh nvarchar(40),
@tennggiamho nvarchar(40),
@sodt varchar(20)
as
begin
	insert into HOCSINH values (@malop,@hoten,@ngaysinh,@gioitinh,@noisinh,@tennggiamho,@sodt)
end
GO
/****** Object:  StoredProcedure [dbo].[LoginAccount]    Script Date: 09/08/2020 12:26:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[LoginAccount]
@username nvarchar(30),
@password nvarchar(30)
as
begin
SELECT FullName, Email
FROM Account
WHERE Username = @username and Pass = @password
end
GO
/****** Object:  StoredProcedure [dbo].[SignUpAccount]    Script Date: 09/08/2020 12:26:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SignUpAccount]
@username varchar(30),
@password varchar(30),
@email	  varchar(30),
@name	  nvarchar(30)
as
begin
insert into Account values (@username, @password, @email, @name)
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateHS]    Script Date: 09/08/2020 12:26:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateHS]
@mahs int,
@malop int,
@hoten nvarchar(40),
@ngaysinh smalldatetime,
@gioitinh nvarchar(20),
@noisinh nvarchar(40),
@tennggiamho nvarchar(40),
@sodt varchar(20)
as
begin
	update HOCSINH set MALOP=@malop,HOTEN=@hoten,NGAYSINH=@ngaysinh,GIOITINH=@gioitinh,NOISINH=@noisinh,TENNGGIAMHO=@tennggiamho,SODT=@sodt where MAHS=@mahs
end
GO
USE [master]
GO
ALTER DATABASE [QLHS] SET  READ_WRITE 
GO
