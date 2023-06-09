USE [master]
GO
/****** Object:  Database [OCD_DB]    Script Date: 11/10/2022 11:46:55 AM ******/
CREATE DATABASE [OCD_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OCD_DB', FILENAME = N'E:\Program\SQLServer\MSSQL15.SQLEXPRESS\MSSQL\DATA\OCD_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OCD_DB_log', FILENAME = N'E:\Program\SQLServer\MSSQL15.SQLEXPRESS\MSSQL\DATA\OCD_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [OCD_DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OCD_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OCD_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OCD_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OCD_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OCD_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OCD_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [OCD_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OCD_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OCD_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OCD_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OCD_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OCD_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OCD_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OCD_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OCD_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OCD_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OCD_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OCD_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OCD_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OCD_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OCD_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OCD_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OCD_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OCD_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OCD_DB] SET  MULTI_USER 
GO
ALTER DATABASE [OCD_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OCD_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OCD_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OCD_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OCD_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OCD_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [OCD_DB] SET QUERY_STORE = OFF
GO
USE [OCD_DB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/10/2022 11:46:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[accountId] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[fullname] [varchar](50) NOT NULL,
	[gender] [bit] NOT NULL,
	[balance] [bigint] NOT NULL,
	[rollNumber] [varchar](10) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[accountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountRoom]    Script Date: 11/10/2022 11:46:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountRoom](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[accountId] [int] NOT NULL,
	[roomId] [int] NOT NULL,
	[termId] [int] NOT NULL,
 CONSTRAINT [PK_AccountRoom] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dom]    Script Date: 11/10/2022 11:46:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dom](
	[domId] [int] IDENTITY(1,1) NOT NULL,
	[domName] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Dom] PRIMARY KEY CLUSTERED 
(
	[domId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Infomation]    Script Date: 11/10/2022 11:46:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Infomation](
	[infoId] [int] IDENTITY(1,1) NOT NULL,
	[roomId] [int] NOT NULL,
	[termId] [int] NOT NULL,
	[electricUsage] [float] NOT NULL,
	[waterUsage] [float] NOT NULL,
 CONSTRAINT [PK_Infomation] PRIMARY KEY CLUSTERED 
(
	[infoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 11/10/2022 11:46:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[roomId] [int] IDENTITY(1,1) NOT NULL,
	[roomCode] [varchar](4) NOT NULL,
	[floor] [int] NOT NULL,
	[domId] [int] NOT NULL,
	[freeBed] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[typeId] [int] NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[roomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 11/10/2022 11:46:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomType](
	[typeId] [int] IDENTITY(1,1) NOT NULL,
	[typeName] [varchar](50) NOT NULL,
	[bed] [int] NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_RoomType] PRIMARY KEY CLUSTERED 
(
	[typeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Term]    Script Date: 11/10/2022 11:46:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Term](
	[termId] [int] IDENTITY(1,1) NOT NULL,
	[termCode] [varchar](12) NOT NULL,
 CONSTRAINT [PK_Term] PRIMARY KEY CLUSTERED 
(
	[termId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([accountId], [email], [password], [fullname], [gender], [balance], [rollNumber]) VALUES (1, N'khoann@fpt.edu.vn', N'123456', N'Nguyen Anh Khoa', 1, 699999, N'HE161231')
INSERT [dbo].[Account] ([accountId], [email], [password], [fullname], [gender], [balance], [rollNumber]) VALUES (2, N'quyenlt@gmail.com', N'123', N'Le Van Quyen', 1, 2200000, N'SE167647')
INSERT [dbo].[Account] ([accountId], [email], [password], [fullname], [gender], [balance], [rollNumber]) VALUES (3, N'nguyenkhoa@gmail.com', N'123', N'Nguyen Nguyen Khoa', 0, 1000000, N'HE161233')
INSERT [dbo].[Account] ([accountId], [email], [password], [fullname], [gender], [balance], [rollNumber]) VALUES (4, N'khoant1@fpt.edu.vn', N'123456', N'Nguyen Nguyen Khoa', 0, 700000, NULL)
INSERT [dbo].[Account] ([accountId], [email], [password], [fullname], [gender], [balance], [rollNumber]) VALUES (5, N'nguyenkhoa@gmail.com', N'123', N'Nguyen Nguyen Khoa', 0, 700000, NULL)
INSERT [dbo].[Account] ([accountId], [email], [password], [fullname], [gender], [balance], [rollNumber]) VALUES (6, N'duongtongmon32@gmail.com', N'123', N'Nguyen Nguyen Khoa', 1, 700000, NULL)
INSERT [dbo].[Account] ([accountId], [email], [password], [fullname], [gender], [balance], [rollNumber]) VALUES (7, N'duongtongmon32@gmail.com', N'123', N'Nguyen Nguyen Khoa', 1, 700000, NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[AccountRoom] ON 

INSERT [dbo].[AccountRoom] ([id], [accountId], [roomId], [termId]) VALUES (20, 1, 1, 1)
INSERT [dbo].[AccountRoom] ([id], [accountId], [roomId], [termId]) VALUES (21, 3, 1, 1)
SET IDENTITY_INSERT [dbo].[AccountRoom] OFF
GO
SET IDENTITY_INSERT [dbo].[Dom] ON 

INSERT [dbo].[Dom] ([domId], [domName]) VALUES (1, N'Dom A')
INSERT [dbo].[Dom] ([domId], [domName]) VALUES (2, N'Dom B')
INSERT [dbo].[Dom] ([domId], [domName]) VALUES (3, N'Dom C')
INSERT [dbo].[Dom] ([domId], [domName]) VALUES (4, N'Dom D')
SET IDENTITY_INSERT [dbo].[Dom] OFF
GO
SET IDENTITY_INSERT [dbo].[Infomation] ON 

INSERT [dbo].[Infomation] ([infoId], [roomId], [termId], [electricUsage], [waterUsage]) VALUES (2, 1, 1, 200, 50)
SET IDENTITY_INSERT [dbo].[Infomation] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([roomId], [roomCode], [floor], [domId], [freeBed], [status], [typeId]) VALUES (1, N'A101', 1, 1, 1, 1, 1)
INSERT [dbo].[Room] ([roomId], [roomCode], [floor], [domId], [freeBed], [status], [typeId]) VALUES (2, N'A201', 2, 1, 2, 1, 1)
INSERT [dbo].[Room] ([roomId], [roomCode], [floor], [domId], [freeBed], [status], [typeId]) VALUES (3, N'B208', 2, 2, 2, 1, 1)
INSERT [dbo].[Room] ([roomId], [roomCode], [floor], [domId], [freeBed], [status], [typeId]) VALUES (4, N'A102', 1, 1, 3, 1, 1)
INSERT [dbo].[Room] ([roomId], [roomCode], [floor], [domId], [freeBed], [status], [typeId]) VALUES (5, N'A103', 1, 1, 6, 1, 1)
INSERT [dbo].[Room] ([roomId], [roomCode], [floor], [domId], [freeBed], [status], [typeId]) VALUES (6, N'A104', 1, 1, 1, 1, 4)
INSERT [dbo].[Room] ([roomId], [roomCode], [floor], [domId], [freeBed], [status], [typeId]) VALUES (7, N'A105', 1, 1, 1, 1, 4)
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomType] ON 

INSERT [dbo].[RoomType] ([typeId], [typeName], [bed], [price]) VALUES (1, N'SVVN', 6, 700000)
INSERT [dbo].[RoomType] ([typeId], [typeName], [bed], [price]) VALUES (2, N'SVVN', 3, 950000)
INSERT [dbo].[RoomType] ([typeId], [typeName], [bed], [price]) VALUES (3, N'SVVN', 4, 850000)
INSERT [dbo].[RoomType] ([typeId], [typeName], [bed], [price]) VALUES (4, N'SVQT', 3, 2300000)
SET IDENTITY_INSERT [dbo].[RoomType] OFF
GO
SET IDENTITY_INSERT [dbo].[Term] ON 

INSERT [dbo].[Term] ([termId], [termCode]) VALUES (1, N'Spring2022')
INSERT [dbo].[Term] ([termId], [termCode]) VALUES (3, N'Summer2022')
INSERT [dbo].[Term] ([termId], [termCode]) VALUES (4, N'Fall2022')
INSERT [dbo].[Term] ([termId], [termCode]) VALUES (5, N'Spring2023')
INSERT [dbo].[Term] ([termId], [termCode]) VALUES (6, N'Summer2023')
SET IDENTITY_INSERT [dbo].[Term] OFF
GO
/****** Object:  Index [IX_AccountRoom]    Script Date: 11/10/2022 11:46:55 AM ******/
ALTER TABLE [dbo].[AccountRoom] ADD  CONSTRAINT [IX_AccountRoom] UNIQUE NONCLUSTERED 
(
	[accountId] ASC,
	[termId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Trigger [dbo].[tg_status]    Script Date: 11/10/2022 11:46:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tg_status]   ON  [dbo].[Room]
AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	if (select freeBed from inserted ) <= 0
	begin
		update Room   set status = 0  from Room r join inserted on r.roomId=inserted.roomId
	end
END
GO
ALTER TABLE [dbo].[Room] ENABLE TRIGGER [tg_status]
GO
USE [master]
GO
ALTER DATABASE [OCD_DB] SET  READ_WRITE 
GO
