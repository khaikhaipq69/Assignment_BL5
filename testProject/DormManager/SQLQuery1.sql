CREATE DATABASE [DormManager]

ALTER DATABASE [OnlineShopSP2023] SET COMPATIBILITY_LEVEL = 150
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

CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


INSERT [dbo].[Account] ([Id], [Username], [Password], [Email], [Address], [Phone], [roleId]) VALUES (1, N'user1', N'123456', N'user1@gmail.com', N'123 Main St, Anytown, USA', N'123-456-7890', NULL)
INSERT [dbo].[Account] ([Id], [Username], [Password], [Email], [Address], [Phone], [roleId]) VALUES (2, N'user2', N'abcdef', N'user2@gmail.com', N'456 Oak St, Anytown, USA', N'555-123-4567', NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO