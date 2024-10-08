USE [master]
GO
/****** Object:  Database [ArtSuppliesStore]    Script Date: 9/30/2024 6:17:46 PM ******/
CREATE DATABASE [ArtSuppliesStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ArtSuppliesStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ArtSuppliesStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ArtSuppliesStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ArtSuppliesStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ArtSuppliesStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ArtSuppliesStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ArtSuppliesStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ArtSuppliesStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ArtSuppliesStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ArtSuppliesStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ArtSuppliesStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [ArtSuppliesStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ArtSuppliesStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ArtSuppliesStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ArtSuppliesStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ArtSuppliesStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ArtSuppliesStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ArtSuppliesStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ArtSuppliesStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ArtSuppliesStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ArtSuppliesStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ArtSuppliesStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ArtSuppliesStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ArtSuppliesStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ArtSuppliesStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ArtSuppliesStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ArtSuppliesStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ArtSuppliesStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ArtSuppliesStore] SET RECOVERY FULL 
GO
ALTER DATABASE [ArtSuppliesStore] SET  MULTI_USER 
GO
ALTER DATABASE [ArtSuppliesStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ArtSuppliesStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ArtSuppliesStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ArtSuppliesStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ArtSuppliesStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ArtSuppliesStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ArtSuppliesStore', N'ON'
GO
ALTER DATABASE [ArtSuppliesStore] SET QUERY_STORE = OFF
GO
USE [ArtSuppliesStore]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 9/30/2024 6:17:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Address_ID] [int] IDENTITY(1,1) NOT NULL,
	[Street_1] [nchar](50) NULL,
	[Street_2] [nchar](50) NULL,
	[City] [nchar](15) NOT NULL,
	[State] [nchar](15) NOT NULL,
	[Zip_Code] [int] NOT NULL,
	[Person_ID] [int] NOT NULL,
 CONSTRAINT [PK_Adress] PRIMARY KEY CLUSTERED 
(
	[Address_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 9/30/2024 6:17:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[Invoice_ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_ID] [int] NULL,
	[Invoice_Date] [date] NOT NULL,
	[Due_Date] [date] NOT NULL,
	[Product_ID] [nchar](100) NULL,
	[Description] [nchar](100) NULL,
	[SubTotal] [money] NULL,
	[Member_Discount_ID] [int] NULL,
	[Discount_Applied?] [nchar](10) NULL,
	[Calculated_Discount] [money] NULL,
	[Total_Invoice_Amount_Due] [money] NOT NULL,
	[Receipt_ID] [int] NULL,
	[Artist_ID] [int] NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[Invoice_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LineItem]    Script Date: 9/30/2024 6:17:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LineItem](
	[Line_Item_ID] [int] IDENTITY(1,1) NOT NULL,
	[Invoice_ID] [int] NULL,
	[Invoice_Date] [date] NULL,
	[Product_ID] [int] NULL,
	[Unit_Price] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Item_Subtotal] [money] NULL,
	[Invoice_Total] [money] NOT NULL,
 CONSTRAINT [PK_LineItem] PRIMARY KEY CLUSTERED 
(
	[Line_Item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 9/30/2024 6:17:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Person_ID] [int] IDENTITY(1,1) NOT NULL,
	[Role] [nchar](30) NOT NULL,
	[First_Name] [nchar](20) NOT NULL,
	[Last_Name] [nchar](20) NOT NULL,
	[Address_ID] [int] NULL,
	[Phone_Number] [nchar](15) NULL,
	[Email_Address] [nchar](50) NULL,
	[Skills] [nchar](100) NULL,
	[Services] [nchar](100) NULL,
	[Member_Join_Date] [date] NULL,
	[Employee_Hire_Date] [date] NULL,
	[Contractor_Hire_Date] [date] NULL,
	[Member_Rank_ID] [int] NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Person_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product/Service]    Script Date: 9/30/2024 6:17:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product/Service](
	[Product_Service_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](100) NOT NULL,
	[Category] [nchar](100) NOT NULL,
	[Art_Service] [nchar](50) NULL,
	[Price] [money] NULL,
	[Per Hour?] [nchar](10) NULL,
	[Discount] [nchar](10) NULL,
	[Brand] [nchar](60) NULL,
	[Description] [nchar](100) NULL,
	[Duration] [time](7) NULL,
	[Frequency] [nchar](15) NULL,
	[Artist_ID] [int] NULL,
 CONSTRAINT [PK_Product/Service] PRIMARY KEY CLUSTERED 
(
	[Product_Service_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipt]    Script Date: 9/30/2024 6:17:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt](
	[Receipt_ID] [int] IDENTITY(1,1) NOT NULL,
	[Receipt_Date] [date] NOT NULL,
	[Invoice_ID] [int] NOT NULL,
	[Invoice_Date] [date] NOT NULL,
	[Payment_Amount] [money] NULL,
	[Payment_Type] [nchar](15) NULL,
	[Customer_ID] [int] NULL,
 CONSTRAINT [PK_Receipt] PRIMARY KEY CLUSTERED 
(
	[Receipt_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([Address_ID], [Street_1], [Street_2], [City], [State], [Zip_Code], [Person_ID]) VALUES (1, N'145 Spring Street                                 ', NULL, N'Nashville      ', N'TN             ', 37203, 18)
INSERT [dbo].[Address] ([Address_ID], [Street_1], [Street_2], [City], [State], [Zip_Code], [Person_ID]) VALUES (2, N'987 Elm Avenue                                    ', NULL, N'Memphis        ', N'TN             ', 38103, 19)
INSERT [dbo].[Address] ([Address_ID], [Street_1], [Street_2], [City], [State], [Zip_Code], [Person_ID]) VALUES (3, N'321 Blossom Road                                  ', NULL, N'Knoxville      ', N'TN             ', 37920, 20)
INSERT [dbo].[Address] ([Address_ID], [Street_1], [Street_2], [City], [State], [Zip_Code], [Person_ID]) VALUES (4, N'10 Oak Street                                     ', NULL, N'Chattanooga    ', N'TN             ', 37415, 21)
INSERT [dbo].[Address] ([Address_ID], [Street_1], [Street_2], [City], [State], [Zip_Code], [Person_ID]) VALUES (5, N'2500 Maple Lane                                   ', NULL, N'Nashville      ', N'TN             ', 37215, 22)
INSERT [dbo].[Address] ([Address_ID], [Street_1], [Street_2], [City], [State], [Zip_Code], [Person_ID]) VALUES (7, N'112 Oakwood Drive                                 ', NULL, N'Nashville      ', N'TN             ', 37209, 23)
INSERT [dbo].[Address] ([Address_ID], [Street_1], [Street_2], [City], [State], [Zip_Code], [Person_ID]) VALUES (8, N'89 Riverbend Road                                 ', NULL, N'Memphis        ', N'TN             ', 38107, 24)
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([Invoice_ID], [Customer_ID], [Invoice_Date], [Due_Date], [Product_ID], [Description], [SubTotal], [Member_Discount_ID], [Discount_Applied?], [Calculated_Discount], [Total_Invoice_Amount_Due], [Receipt_ID], [Artist_ID]) VALUES (1, 18, CAST(N'2024-09-10' AS Date), CAST(N'2024-09-24' AS Date), N'15, 25                                                                                              ', N'Painters Paradise Suscription Workshop, Intro to Watercolor Painting Workshop                       ', 110.0000, 32, N'no        ', NULL, 110.0000, 1, 1)
INSERT [dbo].[Invoice] ([Invoice_ID], [Customer_ID], [Invoice_Date], [Due_Date], [Product_ID], [Description], [SubTotal], [Member_Discount_ID], [Discount_Applied?], [Calculated_Discount], [Total_Invoice_Amount_Due], [Receipt_ID], [Artist_ID]) VALUES (2, 22, CAST(N'2021-09-10' AS Date), CAST(N'2024-09-24' AS Date), N'3, 23                                                                                               ', N'Pottery Kit, Art & Mindfulness Subscription Box                                                     ', 130.0000, 32, N'yes       ', 32.5000, 97.5000, 2, NULL)
INSERT [dbo].[Invoice] ([Invoice_ID], [Customer_ID], [Invoice_Date], [Due_Date], [Product_ID], [Description], [SubTotal], [Member_Discount_ID], [Discount_Applied?], [Calculated_Discount], [Total_Invoice_Amount_Due], [Receipt_ID], [Artist_ID]) VALUES (3, 21, CAST(N'2024-09-15' AS Date), CAST(N'2024-09-29' AS Date), N'41                                                                                                  ', N'Ceramic for Beginners Workshop21                                                                    ', 85.0000, 29, N'no        ', NULL, 85.0000, NULL, 25)
SET IDENTITY_INSERT [dbo].[Invoice] OFF
GO
SET IDENTITY_INSERT [dbo].[LineItem] ON 

INSERT [dbo].[LineItem] ([Line_Item_ID], [Invoice_ID], [Invoice_Date], [Product_ID], [Unit_Price], [Quantity], [Item_Subtotal], [Invoice_Total]) VALUES (1, 1, CAST(N'2024-09-10' AS Date), 15, 50.0000, 1, 50.0000, 110.0000)
INSERT [dbo].[LineItem] ([Line_Item_ID], [Invoice_ID], [Invoice_Date], [Product_ID], [Unit_Price], [Quantity], [Item_Subtotal], [Invoice_Total]) VALUES (3, 1, CAST(N'2024-09-10' AS Date), 25, 60.0000, 1, 60.0000, 110.0000)
INSERT [dbo].[LineItem] ([Line_Item_ID], [Invoice_ID], [Invoice_Date], [Product_ID], [Unit_Price], [Quantity], [Item_Subtotal], [Invoice_Total]) VALUES (4, 2, CAST(N'2021-09-10' AS Date), 3, 75.0000, 1, 75.0000, 97.5000)
INSERT [dbo].[LineItem] ([Line_Item_ID], [Invoice_ID], [Invoice_Date], [Product_ID], [Unit_Price], [Quantity], [Item_Subtotal], [Invoice_Total]) VALUES (5, 2, CAST(N'2021-09-10' AS Date), 23, 55.0000, 1, 55.0000, 97.5000)
INSERT [dbo].[LineItem] ([Line_Item_ID], [Invoice_ID], [Invoice_Date], [Product_ID], [Unit_Price], [Quantity], [Item_Subtotal], [Invoice_Total]) VALUES (6, 3, CAST(N'2024-09-15' AS Date), 41, 85.0000, 1, 85.0000, 85.0000)
SET IDENTITY_INSERT [dbo].[LineItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([Person_ID], [Role], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [Email_Address], [Skills], [Services], [Member_Join_Date], [Employee_Hire_Date], [Contractor_Hire_Date], [Member_Rank_ID]) VALUES (1, N'Artist                        ', N'Emma                ', N'Rivera              ', NULL, N'615-55-1200    ', NULL, N'Watercolor Painting                                                                                 ', N'Workshop, Custom Painting                                                                           ', NULL, NULL, CAST(N'2022-01-15' AS Date), NULL)
INSERT [dbo].[Person] ([Person_ID], [Role], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [Email_Address], [Skills], [Services], [Member_Join_Date], [Employee_Hire_Date], [Contractor_Hire_Date], [Member_Rank_ID]) VALUES (2, N'Artist                        ', N'Lei                 ', N'Wei                 ', NULL, N'615-555-1400   ', NULL, N'Digital Artist                                                                                      ', N'Workshop                                                                                            ', NULL, NULL, CAST(N'2021-03-22' AS Date), NULL)
INSERT [dbo].[Person] ([Person_ID], [Role], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [Email_Address], [Skills], [Services], [Member_Join_Date], [Employee_Hire_Date], [Contractor_Hire_Date], [Member_Rank_ID]) VALUES (3, N'Artist                        ', N'Anton               ', N'Kuznetsov           ', NULL, N'615-555-1300   ', NULL, N'Pottery and Sculpting                                                                               ', N'Workshop, Tutorials                                                                                 ', NULL, NULL, CAST(N'2020-07-10' AS Date), NULL)
INSERT [dbo].[Person] ([Person_ID], [Role], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [Email_Address], [Skills], [Services], [Member_Join_Date], [Employee_Hire_Date], [Contractor_Hire_Date], [Member_Rank_ID]) VALUES (4, N'Artist                        ', N'Olivia              ', N'Adebayo             ', NULL, N'865-555-1100   ', NULL, N'Abstract Art, Acrylic Painting,Oil Painting                                                         ', N'Workshop, Custom Painting                                                                           ', NULL, NULL, CAST(N'2023-05-05' AS Date), NULL)
INSERT [dbo].[Person] ([Person_ID], [Role], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [Email_Address], [Skills], [Services], [Member_Join_Date], [Employee_Hire_Date], [Contractor_Hire_Date], [Member_Rank_ID]) VALUES (5, N'Artist                        ', N'Hiroshi             ', N'Nakamura            ', NULL, N'931-55-1500    ', NULL, N'Sketching Drawing                                                                                   ', N'Workshop                                                                                            ', NULL, NULL, CAST(N'2019-09-18' AS Date), NULL)
INSERT [dbo].[Person] ([Person_ID], [Role], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [Email_Address], [Skills], [Services], [Member_Join_Date], [Employee_Hire_Date], [Contractor_Hire_Date], [Member_Rank_ID]) VALUES (7, N'Artist                        ', N'Carla               ', N'Rodriguez           ', NULL, N'423-555-1600   ', NULL, N'Jewelry Crafting                                                                                    ', N'Custom Jewelry Crafting                                                                             ', NULL, NULL, CAST(N'2021-11-25' AS Date), NULL)
INSERT [dbo].[Person] ([Person_ID], [Role], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [Email_Address], [Skills], [Services], [Member_Join_Date], [Employee_Hire_Date], [Contractor_Hire_Date], [Member_Rank_ID]) VALUES (8, N'Artist                        ', N'Fatima              ', N'El-Hassan           ', NULL, N'615-555-1700   ', NULL, N'Mixed Media Art                                                                                     ', N'Workshop                                                                                            ', NULL, NULL, CAST(N'2022-02-14' AS Date), NULL)
INSERT [dbo].[Person] ([Person_ID], [Role], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [Email_Address], [Skills], [Services], [Member_Join_Date], [Employee_Hire_Date], [Contractor_Hire_Date], [Member_Rank_ID]) VALUES (9, N'Artist                        ', N'David               ', N'Ortiz               ', NULL, N'901-555-1800   ', NULL, N'Murals, Street Art                                                                                  ', N'Workshop, Custom Murals                                                                             ', NULL, NULL, CAST(N'2020-08-30' AS Date), NULL)
INSERT [dbo].[Person] ([Person_ID], [Role], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [Email_Address], [Skills], [Services], [Member_Join_Date], [Employee_Hire_Date], [Contractor_Hire_Date], [Member_Rank_ID]) VALUES (10, N'Artist                        ', N'Thandiwe            ', N'Ndlovu              ', NULL, N'865-555-2000   ', NULL, N'Sustainable art, Eco Textixtile Printinng                                                           ', N'Workshop, Custom art and prints                                                                     ', NULL, NULL, CAST(N'2023-04-08' AS Date), NULL)
INSERT [dbo].[Person] ([Person_ID], [Role], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [Email_Address], [Skills], [Services], [Member_Join_Date], [Employee_Hire_Date], [Contractor_Hire_Date], [Member_Rank_ID]) VALUES (13, N'Administrator                 ', N'Yolanda             ', N'Carter              ', NULL, N'615--555-2100  ', NULL, NULL, NULL, NULL, CAST(N'2018-01-10' AS Date), NULL, NULL)
INSERT [dbo].[Person] ([Person_ID], [Role], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [Email_Address], [Skills], [Services], [Member_Join_Date], [Employee_Hire_Date], [Contractor_Hire_Date], [Member_Rank_ID]) VALUES (14, N'Curator                       ', N'Jonathon            ', N'Reed                ', NULL, N'901-555-2200   ', NULL, NULL, NULL, NULL, CAST(N'2019-05-22' AS Date), NULL, NULL)
INSERT [dbo].[Person] ([Person_ID], [Role], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [Email_Address], [Skills], [Services], [Member_Join_Date], [Employee_Hire_Date], [Contractor_Hire_Date], [Member_Rank_ID]) VALUES (16, N'Customer Support Manager      ', N'Linda               ', N'Thompson            ', NULL, N'865-555-2300   ', NULL, NULL, NULL, NULL, CAST(N'2020-03-15' AS Date), NULL, NULL)
INSERT [dbo].[Person] ([Person_ID], [Role], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [Email_Address], [Skills], [Services], [Member_Join_Date], [Employee_Hire_Date], [Contractor_Hire_Date], [Member_Rank_ID]) VALUES (17, N'Store Manager                 ', N'Robert              ', N'Jenkins             ', NULL, N'423-555-2400   ', NULL, NULL, NULL, NULL, CAST(N'2017-07-30' AS Date), NULL, NULL)
INSERT [dbo].[Person] ([Person_ID], [Role], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [Email_Address], [Skills], [Services], [Member_Join_Date], [Employee_Hire_Date], [Contractor_Hire_Date], [Member_Rank_ID]) VALUES (18, N'Customer                      ', N'Aisha               ', N'Khan                ', 1, N'615-555-1234   ', N'aisha.khan@example.com                            ', NULL, NULL, CAST(N'2022-01-15' AS Date), NULL, NULL, 32)
INSERT [dbo].[Person] ([Person_ID], [Role], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [Email_Address], [Skills], [Services], [Member_Join_Date], [Employee_Hire_Date], [Contractor_Hire_Date], [Member_Rank_ID]) VALUES (19, N'Customer                      ', N'Miguel              ', N'Hernandez           ', 2, N'901-555-5678   ', N'miguel.hernandez@example.com                      ', NULL, NULL, CAST(N'2021-05-20' AS Date), NULL, NULL, 29)
INSERT [dbo].[Person] ([Person_ID], [Role], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [Email_Address], [Skills], [Services], [Member_Join_Date], [Employee_Hire_Date], [Contractor_Hire_Date], [Member_Rank_ID]) VALUES (20, N'Customer                      ', N'Emily               ', N'Wong                ', 3, N'901-555-5678   ', N'emily.wong@example.com                            ', NULL, NULL, CAST(N'2023-03-10' AS Date), NULL, NULL, 27)
INSERT [dbo].[Person] ([Person_ID], [Role], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [Email_Address], [Skills], [Services], [Member_Join_Date], [Employee_Hire_Date], [Contractor_Hire_Date], [Member_Rank_ID]) VALUES (21, N'Customer                      ', N'Johannes            ', N'Muller              ', 4, N'423-555-8765   ', N'johannes.mueller@example.com                      ', NULL, NULL, CAST(N'2022-08-02' AS Date), NULL, NULL, 29)
INSERT [dbo].[Person] ([Person_ID], [Role], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [Email_Address], [Skills], [Services], [Member_Join_Date], [Employee_Hire_Date], [Contractor_Hire_Date], [Member_Rank_ID]) VALUES (22, N'Customer                      ', N'Priya               ', N'Patel               ', 5, N'615-555-6543   ', N'priya.patel@example.com                           ', NULL, NULL, CAST(N'2020-11-18' AS Date), NULL, NULL, 32)
INSERT [dbo].[Person] ([Person_ID], [Role], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [Email_Address], [Skills], [Services], [Member_Join_Date], [Employee_Hire_Date], [Contractor_Hire_Date], [Member_Rank_ID]) VALUES (23, N'Customer                      ', N'Matthew             ', N'Richardson          ', 7, N'615-555-0010   ', N'matthew.richardson@example.com                    ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Person] ([Person_ID], [Role], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [Email_Address], [Skills], [Services], [Member_Join_Date], [Employee_Hire_Date], [Contractor_Hire_Date], [Member_Rank_ID]) VALUES (24, N'Customer                      ', N'Jessica             ', N'Davis               ', 8, N'901-555-002    ', N'jessica.davis@example.com                         ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Person] ([Person_ID], [Role], [First_Name], [Last_Name], [Address_ID], [Phone_Number], [Email_Address], [Skills], [Services], [Member_Join_Date], [Employee_Hire_Date], [Contractor_Hire_Date], [Member_Rank_ID]) VALUES (25, N'Artist                        ', N'Allessia            ', N'Romano              ', NULL, N'423-555-1900   ', NULL, N'Pottery,                                                                                            ', N'Workshop                                                                                            ', NULL, NULL, CAST(N'2018-12-07' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
SET IDENTITY_INSERT [dbo].[Product/Service] ON 

INSERT [dbo].[Product/Service] ([Product_Service_ID], [Name], [Category], [Art_Service], [Price], [Per Hour?], [Discount], [Brand], [Description], [Duration], [Frequency], [Artist_ID]) VALUES (1, N'Professional Watercolors                                                                            ', N'Art Supplies                                                                                        ', NULL, 50.0000, NULL, NULL, N'Winsor & Newton                                             ', N'Professional Watercolor Paint set                                                                   ', NULL, NULL, NULL)
INSERT [dbo].[Product/Service] ([Product_Service_ID], [Name], [Category], [Art_Service], [Price], [Per Hour?], [Discount], [Brand], [Description], [Duration], [Frequency], [Artist_ID]) VALUES (2, N'Custom Canvas Printing                                                                              ', N'Services                                                                                            ', N'Custom Digital Printing                           ', 120.0000, N'no        ', NULL, NULL, N'Custom Canvas Printing Services                                                                     ', NULL, NULL, NULL)
INSERT [dbo].[Product/Service] ([Product_Service_ID], [Name], [Category], [Art_Service], [Price], [Per Hour?], [Discount], [Brand], [Description], [Duration], [Frequency], [Artist_ID]) VALUES (3, N'Pottery Kit                                                                                         ', N'Art Supplies                                                                                        ', NULL, 75.0000, NULL, NULL, N'Kemper                                                      ', N'Clay, Pottery Wheel, and Pottery Tool Bundle                                                        ', NULL, NULL, NULL)
INSERT [dbo].[Product/Service] ([Product_Service_ID], [Name], [Category], [Art_Service], [Price], [Per Hour?], [Discount], [Brand], [Description], [Duration], [Frequency], [Artist_ID]) VALUES (6, N'Digital Illustration                                                                                ', N'Services                                                                                            ', N'Custom Digital Illustration                       ', 90.0000, N'yes       ', NULL, NULL, N'Custom Digital Illustration Services                                                                ', NULL, NULL, 2)
INSERT [dbo].[Product/Service] ([Product_Service_ID], [Name], [Category], [Art_Service], [Price], [Per Hour?], [Discount], [Brand], [Description], [Duration], [Frequency], [Artist_ID]) VALUES (13, N'Custom Mural                                                                                        ', N'Services                                                                                            ', N'Custom Mural Painting                             ', 500.0000, N'yes       ', NULL, NULL, N'Custom Mural Painting Services                                                                      ', NULL, NULL, 9)
INSERT [dbo].[Product/Service] ([Product_Service_ID], [Name], [Category], [Art_Service], [Price], [Per Hour?], [Discount], [Brand], [Description], [Duration], [Frequency], [Artist_ID]) VALUES (14, N'Recycled Sketchbook                                                                                 ', N'Art Supplies                                                                                        ', NULL, 7.0000, NULL, NULL, N'Canson                                                      ', N'Recycled 10x12 Sketchbook                                                                           ', NULL, NULL, NULL)
INSERT [dbo].[Product/Service] ([Product_Service_ID], [Name], [Category], [Art_Service], [Price], [Per Hour?], [Discount], [Brand], [Description], [Duration], [Frequency], [Artist_ID]) VALUES (15, N'Painter''s Paradise Subscription Box                                                                 ', N'Subscription Boxes                                                                                  ', NULL, 50.0000, NULL, NULL, NULL, N'Including premium paints, brushes, and cancases                                                     ', NULL, N'Monthly        ', NULL)
INSERT [dbo].[Product/Service] ([Product_Service_ID], [Name], [Category], [Art_Service], [Price], [Per Hour?], [Discount], [Brand], [Description], [Duration], [Frequency], [Artist_ID]) VALUES (16, N'Sculptor''s Studio Subscription Box                                                                  ', N'Subscription Box                                                                                    ', NULL, 75.0000, NULL, NULL, NULL, N'Including clay, sculpting tools, and exclusive video tutorials.                                     ', NULL, N'Bi-Monthly     ', NULL)
INSERT [dbo].[Product/Service] ([Product_Service_ID], [Name], [Category], [Art_Service], [Price], [Per Hour?], [Discount], [Brand], [Description], [Duration], [Frequency], [Artist_ID]) VALUES (18, N'Creative Craft Corner Subscription Box                                                              ', N'Subscription Box                                                                                    ', NULL, 45.0000, NULL, NULL, NULL, N'DIY kits, craft supplies, and seasonal projects.                                                    ', NULL, N'Quaterly       ', NULL)
INSERT [dbo].[Product/Service] ([Product_Service_ID], [Name], [Category], [Art_Service], [Price], [Per Hour?], [Discount], [Brand], [Description], [Duration], [Frequency], [Artist_ID]) VALUES (19, N'Eco-Friendly Art Kit Subscription Box                                                               ', N'Subscription Box                                                                                    ', NULL, 80.0000, NULL, NULL, NULL, N'Sustainable art supplies like recycled paper and ink and earth pigments.                            ', NULL, N'Monthly        ', NULL)
INSERT [dbo].[Product/Service] ([Product_Service_ID], [Name], [Category], [Art_Service], [Price], [Per Hour?], [Discount], [Brand], [Description], [Duration], [Frequency], [Artist_ID]) VALUES (20, N'Digital Artist Dream Subscription Box                                                               ', N'Subscription Box                                                                                    ', NULL, 60.0000, NULL, NULL, NULL, N'Digital tools, drawing tablets, and software tutorials                                              ', NULL, N'Monthy         ', NULL)
INSERT [dbo].[Product/Service] ([Product_Service_ID], [Name], [Category], [Art_Service], [Price], [Per Hour?], [Discount], [Brand], [Description], [Duration], [Frequency], [Artist_ID]) VALUES (21, N'The Abstract Experience Subscription Box                                                            ', N'Subscription Box                                                                                    ', NULL, 65.0000, N'NULL      ', NULL, NULL, N'Abstract art supplies and a guide to freeform techniques.                                           ', NULL, N'Quarterly      ', NULL)
INSERT [dbo].[Product/Service] ([Product_Service_ID], [Name], [Category], [Art_Service], [Price], [Per Hour?], [Discount], [Brand], [Description], [Duration], [Frequency], [Artist_ID]) VALUES (22, N'Watercolor Wonders                                                                                  ', N'Subscription Box                                                                                    ', NULL, 70.0000, NULL, NULL, NULL, N'High-quality watercolors nd exclusive online lessons.                                               ', NULL, N'Monthly        ', NULL)
INSERT [dbo].[Product/Service] ([Product_Service_ID], [Name], [Category], [Art_Service], [Price], [Per Hour?], [Discount], [Brand], [Description], [Duration], [Frequency], [Artist_ID]) VALUES (23, N'Art & Mindfulness Subscription Box                                                                  ', N'Subscription Box                                                                                    ', NULL, 55.0000, NULL, NULL, NULL, N'Mindful art projects and relaxing art therapy materials                                             ', NULL, N'Bi-Monthly     ', NULL)
INSERT [dbo].[Product/Service] ([Product_Service_ID], [Name], [Category], [Art_Service], [Price], [Per Hour?], [Discount], [Brand], [Description], [Duration], [Frequency], [Artist_ID]) VALUES (24, N'Illustrator''s Imagination Subscription Box                                                          ', N'Subscription Box                                                                                    ', NULL, 65.0000, NULL, NULL, NULL, N'Markers, pens, and sketchbooks for llustrators.                                                     ', NULL, N'Monthly        ', NULL)
INSERT [dbo].[Product/Service] ([Product_Service_ID], [Name], [Category], [Art_Service], [Price], [Per Hour?], [Discount], [Brand], [Description], [Duration], [Frequency], [Artist_ID]) VALUES (25, N'Intro to Watercolor Painting Workshop                                                               ', N'Workshop                                                                                            ', N'Workshop                                          ', 60.0000, NULL, NULL, NULL, N'Watercolor art workshop                                                                             ', CAST(N'03:00:00' AS Time), NULL, 1)
INSERT [dbo].[Product/Service] ([Product_Service_ID], [Name], [Category], [Art_Service], [Price], [Per Hour?], [Discount], [Brand], [Description], [Duration], [Frequency], [Artist_ID]) VALUES (27, N'Enthuisast Membership Discount                                                                      ', N'Membership                                                                                          ', NULL, NULL, NULL, N'15 percent', NULL, N'Membership rank for purchases of at least one subscription box and/ or workshop                     ', NULL, NULL, NULL)
INSERT [dbo].[Product/Service] ([Product_Service_ID], [Name], [Category], [Art_Service], [Price], [Per Hour?], [Discount], [Brand], [Description], [Duration], [Frequency], [Artist_ID]) VALUES (29, N'Hobbyist Membership Discount                                                                        ', N'Membership                                                                                          ', NULL, NULL, NULL, N'20 percent', NULL, N'Membership rank for purchases of at least 3 subsription boxes and/ or workshops                     ', NULL, NULL, NULL)
INSERT [dbo].[Product/Service] ([Product_Service_ID], [Name], [Category], [Art_Service], [Price], [Per Hour?], [Discount], [Brand], [Description], [Duration], [Frequency], [Artist_ID]) VALUES (32, N'Professional Membership Discount                                                                    ', N'Membership                                                                                          ', NULL, NULL, NULL, N'25 percent', NULL, N'Membership rank for purchases of at least 5 subscription boxes and/ or workshops                    ', NULL, NULL, NULL)
INSERT [dbo].[Product/Service] ([Product_Service_ID], [Name], [Category], [Art_Service], [Price], [Per Hour?], [Discount], [Brand], [Description], [Duration], [Frequency], [Artist_ID]) VALUES (36, N'Digital Illustration Basics Workshop                                                                ', N'Workshop                                                                                            ', N'Workshop                                          ', 75.0000, N'no        ', NULL, NULL, N'Digital art workshop                                                                                ', CAST(N'04:00:00' AS Time), NULL, 2)
INSERT [dbo].[Product/Service] ([Product_Service_ID], [Name], [Category], [Art_Service], [Price], [Per Hour?], [Discount], [Brand], [Description], [Duration], [Frequency], [Artist_ID]) VALUES (37, N'Sculpting With Clay Workshop                                                                        ', N'Workshop                                                                                            ', N'Workshop                                          ', 80.0000, N'no        ', NULL, NULL, N'Pottery and Clay Workshop                                                                           ', CAST(N'05:00:00' AS Time), NULL, 3)
INSERT [dbo].[Product/Service] ([Product_Service_ID], [Name], [Category], [Art_Service], [Price], [Per Hour?], [Discount], [Brand], [Description], [Duration], [Frequency], [Artist_ID]) VALUES (39, N'Abstract Expressionism Workshop                                                                     ', N'Workshop                                                                                            ', N'Workshop                                          ', 100.0000, N'no        ', NULL, NULL, N'Absrtract Painting Workshop                                                                         ', CAST(N'06:00:00' AS Time), NULL, 4)
INSERT [dbo].[Product/Service] ([Product_Service_ID], [Name], [Category], [Art_Service], [Price], [Per Hour?], [Discount], [Brand], [Description], [Duration], [Frequency], [Artist_ID]) VALUES (41, N'Ceramic for Beginners                                                                               ', N'Workshop                                                                                            ', N'Workshop                                          ', 85.0000, N'no        ', NULL, NULL, N'Beginners Ceramics Workshop                                                                         ', CAST(N'05:00:00' AS Time), NULL, 25)
SET IDENTITY_INSERT [dbo].[Product/Service] OFF
GO
SET IDENTITY_INSERT [dbo].[Receipt] ON 

INSERT [dbo].[Receipt] ([Receipt_ID], [Receipt_Date], [Invoice_ID], [Invoice_Date], [Payment_Amount], [Payment_Type], [Customer_ID]) VALUES (1, CAST(N'2024-09-10' AS Date), 1, CAST(N'2024-09-10' AS Date), 110.0000, N'Credit_Card    ', 8)
INSERT [dbo].[Receipt] ([Receipt_ID], [Receipt_Date], [Invoice_ID], [Invoice_Date], [Payment_Amount], [Payment_Type], [Customer_ID]) VALUES (2, CAST(N'2024-09-12' AS Date), 2, CAST(N'2021-09-10' AS Date), 97.5000, N'Debit_Card     ', 22)
INSERT [dbo].[Receipt] ([Receipt_ID], [Receipt_Date], [Invoice_ID], [Invoice_Date], [Payment_Amount], [Payment_Type], [Customer_ID]) VALUES (3, CAST(N'2024-09-14' AS Date), 3, CAST(N'2024-09-15' AS Date), 85.0000, NULL, 21)
SET IDENTITY_INSERT [dbo].[Receipt] OFF
GO
USE [master]
GO
ALTER DATABASE [ArtSuppliesStore] SET  READ_WRITE 
GO
