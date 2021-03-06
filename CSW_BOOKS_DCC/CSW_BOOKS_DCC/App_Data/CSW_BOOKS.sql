USE [master]
GO
/****** Object:  Database [CSW_Books]    Script Date: 12/8/2016 3:12:55 PM ******/
CREATE DATABASE [CSW_Books]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CSW_Books', FILENAME = N'C:\MSSQL\DATA\CSW_Books.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CSW_Books_log', FILENAME = N'C:\MSSQL\DATA\CSW_Books_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CSW_Books] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CSW_Books].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CSW_Books] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CSW_Books] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CSW_Books] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CSW_Books] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CSW_Books] SET ARITHABORT OFF 
GO
ALTER DATABASE [CSW_Books] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CSW_Books] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CSW_Books] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CSW_Books] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CSW_Books] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CSW_Books] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CSW_Books] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CSW_Books] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CSW_Books] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CSW_Books] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CSW_Books] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CSW_Books] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CSW_Books] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CSW_Books] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CSW_Books] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CSW_Books] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CSW_Books] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CSW_Books] SET RECOVERY FULL 
GO
ALTER DATABASE [CSW_Books] SET  MULTI_USER 
GO
ALTER DATABASE [CSW_Books] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CSW_Books] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CSW_Books] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CSW_Books] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CSW_Books] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CSW_Books', N'ON'
GO
ALTER DATABASE [CSW_Books] SET QUERY_STORE = OFF
GO
USE [CSW_Books]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [CSW_Books]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 12/8/2016 3:12:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[IdAuthor] [int] IDENTITY(1,1) NOT NULL,
	[AuthorName] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[IdAuthor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Book]    Script Date: 12/8/2016 3:12:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[ISBN] [varchar](20) NOT NULL,
	[Title] [varchar](200) NOT NULL,
	[Year] [int] NOT NULL,
	[Edition] [int] NOT NULL,
	[IdPublisher] [int] NOT NULL,
	[Img] [varchar](50) NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/8/2016 3:12:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[IdCategory] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Categorie] PRIMARY KEY CLUSTERED 
(
	[IdCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 12/8/2016 3:12:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[IdPublisher] [int] IDENTITY(1,1) NOT NULL,
	[PublisherName] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Publisher] PRIMARY KEY CLUSTERED 
(
	[IdPublisher] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rel_BookAuthor]    Script Date: 12/8/2016 3:12:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rel_BookAuthor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ISBN] [varchar](20) NOT NULL,
	[IdAuthor] [int] NOT NULL,
 CONSTRAINT [PK_Rel_BookAuthor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rel_BookCategory]    Script Date: 12/8/2016 3:12:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rel_BookCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ISBN] [varchar](20) NOT NULL,
	[IdCategory] [int] NOT NULL,
 CONSTRAINT [PK_Rel_BookCategorie] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Author] ON 

INSERT [dbo].[Author] ([IdAuthor], [AuthorName]) VALUES (1, N'Colson Whitehead')
INSERT [dbo].[Author] ([IdAuthor], [AuthorName]) VALUES (2, N'Bill O''Reilly')
INSERT [dbo].[Author] ([IdAuthor], [AuthorName]) VALUES (3, N'Martin Dugard')
INSERT [dbo].[Author] ([IdAuthor], [AuthorName]) VALUES (4, N'Ethan Michaeli')
INSERT [dbo].[Author] ([IdAuthor], [AuthorName]) VALUES (5, N'Ronald C. White')
SET IDENTITY_INSERT [dbo].[Author] OFF
INSERT [dbo].[Book] ([ISBN], [Title], [Year], [Edition], [IdPublisher], [Img]) VALUES (N' 978-0547560694', N'The Defender: How the Legendary Black Newspaper Changed America', 2016, 1, 3, N'978-0547560694.jpg')
INSERT [dbo].[Book] ([ISBN], [Title], [Year], [Edition], [IdPublisher], [Img]) VALUES (N'978-0385542364', N'The Underground Railroad', 2016, 1, 1, N'978-0385542364.jpg')
INSERT [dbo].[Book] ([ISBN], [Title], [Year], [Edition], [IdPublisher], [Img]) VALUES (N'978-0805096682', N'Killing Patton: The Strange Death of World War II''s Most Audacious General', 2014, 1, 2, N'978-0805096682.jpg')
INSERT [dbo].[Book] ([ISBN], [Title], [Year], [Edition], [IdPublisher], [Img]) VALUES (N'978-0812975703', N'A. Lincoln: A Biography', 2010, 1, 4, N'978-0812975703.jpg')
INSERT [dbo].[Book] ([ISBN], [Title], [Year], [Edition], [IdPublisher], [Img]) VALUES (N'978-1400069026', N'American Ulysses: A Life of Ulysses S. Grant', 2016, 1, 4, N'978-1400069026.jpg')
INSERT [dbo].[Book] ([ISBN], [Title], [Year], [Edition], [IdPublisher], [Img]) VALUES (N'978-1627790628', N'Killing the Rising Sun', 2016, 1, 2, N'978-1627790628.jpg')
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([IdCategory], [CategoryName]) VALUES (1, N'Fiction')
INSERT [dbo].[Category] ([IdCategory], [CategoryName]) VALUES (2, N'Japanese History')
INSERT [dbo].[Category] ([IdCategory], [CategoryName]) VALUES (3, N'History')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Publisher] ON 

INSERT [dbo].[Publisher] ([IdPublisher], [PublisherName]) VALUES (1, N'Doubleday')
INSERT [dbo].[Publisher] ([IdPublisher], [PublisherName]) VALUES (2, N'Henry Holt and Company')
INSERT [dbo].[Publisher] ([IdPublisher], [PublisherName]) VALUES (3, N'Houghton Mifflin Harcourt')
INSERT [dbo].[Publisher] ([IdPublisher], [PublisherName]) VALUES (4, N'Random House')
SET IDENTITY_INSERT [dbo].[Publisher] OFF
SET IDENTITY_INSERT [dbo].[Rel_BookAuthor] ON 

INSERT [dbo].[Rel_BookAuthor] ([Id], [ISBN], [IdAuthor]) VALUES (1, N'978-0385542364', 1)
INSERT [dbo].[Rel_BookAuthor] ([Id], [ISBN], [IdAuthor]) VALUES (2, N'978-1627790628', 2)
INSERT [dbo].[Rel_BookAuthor] ([Id], [ISBN], [IdAuthor]) VALUES (3, N'978-0805096682', 2)
INSERT [dbo].[Rel_BookAuthor] ([Id], [ISBN], [IdAuthor]) VALUES (4, N'978-0805096682', 3)
INSERT [dbo].[Rel_BookAuthor] ([Id], [ISBN], [IdAuthor]) VALUES (5, N'978-1627790628', 3)
INSERT [dbo].[Rel_BookAuthor] ([Id], [ISBN], [IdAuthor]) VALUES (6, N' 978-0547560694', 4)
INSERT [dbo].[Rel_BookAuthor] ([Id], [ISBN], [IdAuthor]) VALUES (7, N'978-1400069026', 5)
INSERT [dbo].[Rel_BookAuthor] ([Id], [ISBN], [IdAuthor]) VALUES (8, N'978-0812975703', 5)
SET IDENTITY_INSERT [dbo].[Rel_BookAuthor] OFF
SET IDENTITY_INSERT [dbo].[Rel_BookCategory] ON 

INSERT [dbo].[Rel_BookCategory] ([Id], [ISBN], [IdCategory]) VALUES (1, N'978-0385542364', 1)
INSERT [dbo].[Rel_BookCategory] ([Id], [ISBN], [IdCategory]) VALUES (2, N'978-1627790628', 2)
INSERT [dbo].[Rel_BookCategory] ([Id], [ISBN], [IdCategory]) VALUES (3, N'978-0805096682', 2)
INSERT [dbo].[Rel_BookCategory] ([Id], [ISBN], [IdCategory]) VALUES (4, N'978-1627790628', 3)
INSERT [dbo].[Rel_BookCategory] ([Id], [ISBN], [IdCategory]) VALUES (5, N'978-0805096682', 3)
INSERT [dbo].[Rel_BookCategory] ([Id], [ISBN], [IdCategory]) VALUES (6, N' 978-0547560694', 3)
INSERT [dbo].[Rel_BookCategory] ([Id], [ISBN], [IdCategory]) VALUES (7, N'978-1400069026', 3)
INSERT [dbo].[Rel_BookCategory] ([Id], [ISBN], [IdCategory]) VALUES (9, N'978-0812975703', 3)
SET IDENTITY_INSERT [dbo].[Rel_BookCategory] OFF
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Publisher] FOREIGN KEY([IdPublisher])
REFERENCES [dbo].[Publisher] ([IdPublisher])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Publisher]
GO
ALTER TABLE [dbo].[Rel_BookAuthor]  WITH CHECK ADD  CONSTRAINT [FK_Rel_BookAuthor_Author] FOREIGN KEY([IdAuthor])
REFERENCES [dbo].[Author] ([IdAuthor])
GO
ALTER TABLE [dbo].[Rel_BookAuthor] CHECK CONSTRAINT [FK_Rel_BookAuthor_Author]
GO
ALTER TABLE [dbo].[Rel_BookAuthor]  WITH CHECK ADD  CONSTRAINT [FK_Rel_BookAuthor_Book] FOREIGN KEY([ISBN])
REFERENCES [dbo].[Book] ([ISBN])
GO
ALTER TABLE [dbo].[Rel_BookAuthor] CHECK CONSTRAINT [FK_Rel_BookAuthor_Book]
GO
ALTER TABLE [dbo].[Rel_BookCategory]  WITH CHECK ADD  CONSTRAINT [FK_Rel_BookCategorie_Book] FOREIGN KEY([ISBN])
REFERENCES [dbo].[Book] ([ISBN])
GO
ALTER TABLE [dbo].[Rel_BookCategory] CHECK CONSTRAINT [FK_Rel_BookCategorie_Book]
GO
ALTER TABLE [dbo].[Rel_BookCategory]  WITH CHECK ADD  CONSTRAINT [FK_Rel_BookCategorie_Categorie] FOREIGN KEY([IdCategory])
REFERENCES [dbo].[Category] ([IdCategory])
GO
ALTER TABLE [dbo].[Rel_BookCategory] CHECK CONSTRAINT [FK_Rel_BookCategorie_Categorie]
GO
USE [master]
GO
ALTER DATABASE [CSW_Books] SET  READ_WRITE 
GO
