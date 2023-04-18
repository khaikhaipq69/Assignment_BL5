USE [master]
GO
/****** Object:  Database [DormManager]    Script Date: 3/9/2023 9:44:41 AM ******/
CREATE DATABASE [DormManager]

GO
ALTER DATABASE [DormManager] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DormManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DormManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DormManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DormManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DormManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DormManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [DormManager] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DormManager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DormManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DormManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DormManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DormManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DormManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DormManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DormManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DormManager] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DormManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DormManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DormManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DormManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DormManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DormManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DormManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DormManager] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DormManager] SET  MULTI_USER 
GO
ALTER DATABASE [DormManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DormManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DormManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DormManager] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DormManager] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DormManager] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DormManager] SET QUERY_STORE = OFF
GO
USE [DormManager]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/9/2023 9:44:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Address] [varchar](200) NULL,
	[Phone] [varchar](20) NULL,
	[roleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/9/2023 9:44:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 3/9/2023 9:44:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/9/2023 9:44:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/9/2023 9:44:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](200) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Status] [bit] NULL,
	[CategoryId] [int] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/9/2023 9:44:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Id], [Username], [Password], [Email], [Address], [Phone], [roleId]) VALUES (1, N'user1', N'123456', N'user1@gmail.com', N'123 Main St, Anytown, USA', N'123-456-7890', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Email], [Address], [Phone], [roleId]) VALUES (2, N'user2', N'abcdef', N'user2@gmail.com', N'456 Oak St, Anytown, USA', N'555-123-4567', NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Description]) VALUES (1, N'Category 1', N'Description for category 1')
INSERT [dbo].[Category] ([Id], [Name], [Description]) VALUES (2, N'Category 2', N'Description for category 2')
INSERT [dbo].[Category] ([Id], [Name], [Description]) VALUES (3, N'Category 3', N'Description for category 3')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [Price]) VALUES (1, 1, 1, 2, CAST(19.99 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [Price]) VALUES (2, 1, 2, 1, CAST(29.99 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderID], [ProductID], [Quantity], [Price]) VALUES (3, 2, 3, 1, CAST(9.99 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [AccountID], [OrderDate], [TotalAmount], [Status]) VALUES (1, 1, CAST(N'2023-03-08T10:00:00.000' AS DateTime), CAST(49.98 AS Decimal(18, 2)), 1)
INSERT [dbo].[Orders] ([Id], [AccountID], [OrderDate], [TotalAmount], [Status]) VALUES (2, 2, CAST(N'2023-03-13T13:00:00.000' AS DateTime), CAST(9.99 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Status], [CategoryId], [Quantity]) VALUES (1, N'Product 1', N'Description for product 1', CAST(19.99 AS Decimal(18, 2)), NULL, 1, 1, 12)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Status], [CategoryId], [Quantity]) VALUES (2, N'Product 2', N'Description for product 2', CAST(29.99 AS Decimal(18, 2)), NULL, 1, 2, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Status], [CategoryId], [Quantity]) VALUES (3, N'Product 3', N'Description for product 3', CAST(9.99 AS Decimal(18, 2)), NULL, 1, 3, 2)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Status], [CategoryId], [Quantity]) VALUES (4, N'Product 9', N'Description for product 9', CAST(29.99 AS Decimal(18, 2)), NULL, 1, 1, 3)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Status], [CategoryId], [Quantity]) VALUES (5, N'Product 10', N'Description for product 10', CAST(19.99 AS Decimal(18, 2)), NULL, 1, 1, 3)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Status], [CategoryId], [Quantity]) VALUES (6, N'Product 11', N'Description for product 11', CAST(9.99 AS Decimal(18, 2)), NULL, 1, 2, 3)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Status], [CategoryId], [Quantity]) VALUES (7, N'Product 12', N'Description for product 12', CAST(39.99 AS Decimal(18, 2)), NULL, 1, 2, 3)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Status], [CategoryId], [Quantity]) VALUES (8, N'Product 13', N'Description for product 13', CAST(14.99 AS Decimal(18, 2)), NULL, 1, 3, 3)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Price], [Status], [CategoryId], [Quantity]) VALUES (9, N'Product 14', N'Description for product 14', CAST(24.99 AS Decimal(18, 2)), NULL, 1, 3, 3)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Order__2F10007B] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK__OrderDeta__Order__2F10007B]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__AccountI__2C3393D0] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__AccountI__2C3393D0]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [DormManager] SET  READ_WRITE 
GO
