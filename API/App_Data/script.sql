USE [master]
GO
/****** Object:  Database [InvigilationTest]    Script Date: 6/5/2018 2:07:31 PM ******/

https://www.c-sharpcorner.com/article/asp-net-web-api-crud-logics-using-entity-framework-without-writing-single-code/
CREATE DATABASE [InvigilationTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Invigilation', FILENAME = N'F:\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\InvigilationTest.mdf' , SIZE = 13632KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Invigilation_log', FILENAME = N'F:\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\InvigilationTest_log.ldf' , SIZE = 13312KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [InvigilationTest] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InvigilationTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InvigilationTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InvigilationTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InvigilationTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InvigilationTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InvigilationTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [InvigilationTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InvigilationTest] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [InvigilationTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InvigilationTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InvigilationTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InvigilationTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InvigilationTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InvigilationTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InvigilationTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InvigilationTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InvigilationTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [InvigilationTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InvigilationTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InvigilationTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InvigilationTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InvigilationTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InvigilationTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InvigilationTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InvigilationTest] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [InvigilationTest] SET  MULTI_USER 
GO
ALTER DATABASE [InvigilationTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InvigilationTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InvigilationTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InvigilationTest] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'InvigilationTest', N'ON'
GO
USE [InvigilationTest]
GO
/****** Object:  User [PEROOT\MELBN-IT-Data]    Script Date: 6/5/2018 2:07:31 PM ******/
CREATE USER [PEROOT\MELBN-IT-Data] FOR LOGIN [PEROOT\MELBN-IT-Data]
GO
/****** Object:  User [PEROOT\MELBN-IT]    Script Date: 6/5/2018 2:07:31 PM ******/
CREATE USER [PEROOT\MELBN-IT] FOR LOGIN [PEROOT\MELBN-IT]
GO
/****** Object:  User [EPENAU\Imviewer_user]    Script Date: 6/5/2018 2:07:31 PM ******/
CREATE USER [EPENAU\Imviewer_user] FOR LOGIN [EPENAU\Imviewer_user] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [PEROOT\MELBN-IT-Data]
GO
ALTER ROLE [db_datareader] ADD MEMBER [PEROOT\MELBN-IT]
GO
ALTER ROLE [db_owner] ADD MEMBER [EPENAU\Imviewer_user]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 6/5/2018 2:07:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[AddressLine1] [nvarchar](50) NOT NULL,
	[AddressLine2] [nvarchar](50) NULL,
	[State] [nvarchar](50) NOT NULL,
	[Suburb] [nvarchar](50) NULL,
	[Postcode] [nvarchar](10) NULL,
	[Country] [nvarchar](50) NULL,
	[Active] [bit] NOT NULL,
	[Geocode] [geography] NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Audit]    Script Date: 6/5/2018 2:07:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit](
	[AuditID] [int] IDENTITY(1,1) NOT NULL,
	[DateTimeModified] [datetime] NOT NULL,
	[AuditTableName] [nvarchar](50) NOT NULL,
	[ChangedColumns] [nvarchar](255) NULL,
	[OldValue] [nvarchar](1000) NULL,
	[NewValue] [nvarchar](1000) NULL,
	[PK_ID] [nvarchar](100) NULL,
	[Action] [nvarchar](1) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Audit] PRIMARY KEY CLUSTERED 
(
	[AuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Audit_Backup]    Script Date: 6/5/2018 2:07:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit_Backup](
	[AuditID] [int] IDENTITY(1,1) NOT NULL,
	[DateTimeModified] [datetime] NOT NULL,
	[AuditTableName] [nvarchar](50) NOT NULL,
	[ChangedColumns] [nvarchar](255) NULL,
	[OldValue] [nvarchar](1000) NULL,
	[NewValue] [nvarchar](1000) NULL,
	[PK_ID] [nvarchar](100) NULL,
	[Action] [nvarchar](1) NOT NULL,
	[Username] [nvarchar](100) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Centre]    Script Date: 6/5/2018 2:07:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Centre](
	[PRACentreID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[ACARAClientCentreID] [int] NOT NULL,
	[ClientCentreID] [nvarchar](10) NULL,
	[CentreName] [nvarchar](100) NOT NULL,
	[CampusName] [nvarchar](100) NULL,
	[Sector] [char](1) NOT NULL,
	[Location] [nvarchar](100) NULL,
	[AddressID] [int] NOT NULL,
	[TestOrder] [nvarchar](20) NULL,
	[Active] [bit] NOT NULL,
	[CentreDetailsConfirmed] [bit] NULL,
	[ContactDetailsConfirmed] [bit] NULL,
	[ClassScheduleConfirmed] [bit] NULL,
 CONSTRAINT [PK_Centre] PRIMARY KEY CLUSTERED 
(
	[PRACentreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CentreContact]    Script Date: 6/5/2018 2:07:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CentreContact](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[ContactTitle] [nvarchar](50) NOT NULL,
	[ContactFirstName] [nvarchar](50) NOT NULL,
	[ContactLastName] [nvarchar](50) NOT NULL,
	[ContactEmail] [nvarchar](50) NOT NULL,
	[ContactPhone] [nvarchar](50) NOT NULL,
	[ContactMobile] [nvarchar](50) NULL,
	[ContactTypeID] [int] NOT NULL,
 CONSTRAINT [PK_ContactID] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CentreContacts]    Script Date: 6/5/2018 2:07:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CentreContacts](
	[PRACentreID] [int] NOT NULL,
	[ContactID] [int] NOT NULL,
 CONSTRAINT [PK_CentreContacts] PRIMARY KEY CLUSTERED 
(
	[PRACentreID] ASC,
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CentreTestTypeYearlevel]    Script Date: 6/5/2018 2:07:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CentreTestTypeYearlevel](
	[PRACentreID] [int] NOT NULL,
	[TestTypeID] [int] NOT NULL,
	[ClassID] [int] NULL,
	[Total] [int] NULL,
	[NumberOfDevices] [int] NULL,
	[Comments] [nvarchar](250) NULL,
 CONSTRAINT [PK_CentreTestTypeYearlevel_1] PRIMARY KEY CLUSTERED 
(
	[PRACentreID] ASC,
	[TestTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Class]    Script Date: 6/5/2018 2:07:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClassDeviceTypes]    Script Date: 6/5/2018 2:07:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassDeviceTypes](
	[ClassDeviceTypesID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NOT NULL,
	[DeviceTypeID] [int] NOT NULL,
 CONSTRAINT [PK_ClassDeviceTypes] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC,
	[DeviceTypeID] ASC,
	[ClassDeviceTypesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClassTestDates]    Script Date: 6/5/2018 2:07:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassTestDates](
	[ClassTestDateID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NOT NULL,
	[TestDate] [datetimeoffset](7) NOT NULL,
	[RoomName] [nvarchar](150) NULL,
	[InvigilatorAvailableDateId] [int] NULL,
 CONSTRAINT [PK_ClassTestDates] PRIMARY KEY CLUSTERED 
(
	[ClassTestDateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContactTypes]    Script Date: 6/5/2018 2:07:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactTypes](
	[ContactTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ContactDescription] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ContactTypes] PRIMARY KEY CLUSTERED 
(
	[ContactTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_ContactDescription] UNIQUE NONCLUSTERED 
(
	[ContactDescription] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DeviceType]    Script Date: 6/5/2018 2:07:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceType](
	[DeviceTypeID] [int] IDENTITY(1,1) NOT NULL,
	[DeviceTypeName] [nvarchar](20) NULL,
 CONSTRAINT [PK_DeviceType] PRIMARY KEY CLUSTERED 
(
	[DeviceTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Invigilator]    Script Date: 6/5/2018 2:07:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invigilator](
	[InvigilatorID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[AddressID] [int] NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[Mobile] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[WillingToTravel] [bit] NULL,
	[KilometersWillingToTravel] [int] NULL,
	[Active] [bit] NOT NULL,
	[WWCC] [nvarchar](20) NULL,
	[WWCCState] [nvarchar](3) NULL,
	[Notes] [nvarchar](150) NULL,
	[TeacherRegNumber] [nvarchar](20) NULL,
	[InvigilatorDetailsConfirmed] [bit] NOT NULL,
	[InvigilatorAvailableDatesConfirmed] [bit] NOT NULL,
	[TravelInterState] [bit] NOT NULL,
	[StayOverNight] [bit] NOT NULL,
 CONSTRAINT [PK_Invigilator] PRIMARY KEY CLUSTERED 
(
	[InvigilatorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InvigilatorAvailableDates]    Script Date: 6/5/2018 2:07:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvigilatorAvailableDates](
	[InvigilatorAvailableDateId] [int] IDENTITY(1,1) NOT NULL,
	[InvigilatorID] [int] NOT NULL,
	[InvigilatorAvailDate] [datetime] NOT NULL,
 CONSTRAINT [PK_InvigilatorTestDates] PRIMARY KEY CLUSTERED 
(
	[InvigilatorAvailableDateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Project]    Script Date: 6/5/2018 2:07:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [nvarchar](150) NOT NULL,
	[TestStartDate] [datetime] NOT NULL,
	[TestEndDate] [datetime] NOT NULL,
	[ProjectType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProjectSettings] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectDeviceTypes]    Script Date: 6/5/2018 2:07:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectDeviceTypes](
	[ProjectID] [int] NOT NULL,
	[DeviceTypeID] [int] NOT NULL,
 CONSTRAINT [PK_ProjectDeviceTypes] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC,
	[DeviceTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TestType]    Script Date: 6/5/2018 2:07:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestType](
	[TestTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TestTypeDescription] [nvarchar](50) NOT NULL,
	[YearLevel] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TestType] PRIMARY KEY CLUSTERED 
(
	[TestTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zDataForInvigilatorMailingLabels]    Script Date: 6/5/2018 2:07:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[zDataForInvigilatorMailingLabels](
	[Sequence] [varchar](2) NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Street Address] [nvarchar](50) NOT NULL,
	[Suburb] [nvarchar](50) NULL,
	[Postcode] [nvarchar](10) NULL,
	[State] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[zDataForInvigilatorPackingList]    Script Date: 6/5/2018 2:07:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zDataForInvigilatorPackingList](
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[SchoolCode] [int] NOT NULL,
	[SchoolName] [nvarchar](100) NOT NULL,
	[YearLevel] [nvarchar](50) NOT NULL,
	[TestTypeDescription] [nvarchar](50) NOT NULL,
	[ClassName] [nvarchar](50) NULL,
	[TestDate] [datetimeoffset](7) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zDataForSchoolClassPolyBagLabels]    Script Date: 6/5/2018 2:07:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zDataForSchoolClassPolyBagLabels](
	[ACARAClientCentreID] [int] NOT NULL,
	[CentreName] [nvarchar](100) NOT NULL,
	[ContactFirstName] [nvarchar](50) NOT NULL,
	[ContactLastName] [nvarchar](50) NOT NULL,
	[ContactPhone] [nvarchar](50) NOT NULL,
	[TestOrder] [nvarchar](20) NULL,
	[AddressLine1] [nvarchar](50) NOT NULL,
	[Suburb] [nvarchar](50) NULL,
	[Postcode] [nvarchar](10) NULL,
	[State] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zInvigi]    Script Date: 6/5/2018 2:07:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zInvigi](
	[First Name] [nvarchar](255) NULL,
	[Last Name] [nvarchar](255) NULL,
	[Street address] [nvarchar](255) NULL,
	[Suburb] [nvarchar](255) NULL,
	[Postcode] [float] NULL,
	[State] [nvarchar](255) NULL,
	[Phone number] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Teacher registration] [nvarchar](255) NULL,
	[WWCC number] [nvarchar](255) NULL,
	[WWCC expiry] [nvarchar](255) NULL,
	[WWCC state] [nvarchar](255) NULL,
	[Willingness to travel] [float] NULL,
	[Travel distance (kms)] [float] NULL,
	[Wilingness to travel interstate] [float] NULL,
	[Willingness to stay overnight] [float] NULL,
	[Notes] [nvarchar](255) NULL,
	[Username] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[AddressID] [int] NULL,
	[InvID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zInvigi_1]    Script Date: 6/5/2018 2:07:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zInvigi_1](
	[First Name] [nvarchar](255) NULL,
	[Last Name] [nvarchar](255) NULL,
	[Street address] [nvarchar](255) NULL,
	[Suburb] [nvarchar](255) NULL,
	[Postcode] [float] NULL,
	[State] [nvarchar](255) NULL,
	[Phone number] [float] NULL,
	[Email] [nvarchar](255) NULL,
	[Teacher registration] [nvarchar](255) NULL,
	[WWCC number] [nvarchar](255) NULL,
	[WWCC expiry] [nvarchar](255) NULL,
	[WWCC state] [nvarchar](255) NULL,
	[Willingness to travel] [nvarchar](255) NULL,
	[Travel distance (kms)] [nvarchar](255) NULL,
	[Wilingness to travel interstate] [nvarchar](255) NULL,
	[Willingness to stay overnight] [nvarchar](255) NULL,
	[Notes] [nvarchar](max) NULL,
	[Username] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[Mon_15/08] [float] NULL,
	[Tues_16/08] [float] NULL,
	[Wed_17/08] [float] NULL,
	[Thurs_18/08] [float] NULL,
	[Fri_19/08] [float] NULL,
	[Mon_22/08] [float] NULL,
	[Tues_23/08] [float] NULL,
	[Wed_24/08] [float] NULL,
	[Thurs_25/08] [float] NULL,
	[Fri_26/08] [float] NULL,
	[Mon_29/08] [float] NULL,
	[Tues_30/08] [float] NULL,
	[Wed_31/08] [float] NULL,
	[Thurs_01/09] [float] NULL,
	[Fri_02/09] [float] NULL,
	[Mon_05/09] [float] NULL,
	[Tues_06/09] [float] NULL,
	[Wed_07/09] [float] NULL,
	[Thurs_08/09] [float] NULL,
	[Fri_09/09] [float] NULL,
	[Mon_12/09] [float] NULL,
	[Tues_13/09] [float] NULL,
	[Wed_14/09] [float] NULL,
	[Thurs_15/09] [float] NULL,
	[Fri_16/09] [float] NULL,
	[AddressID] [int] NULL,
	[InvID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zMain Template]    Script Date: 6/5/2018 2:07:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zMain Template](
	[State] [nvarchar](255) NULL,
	[Sector] [nvarchar](255) NULL,
	[ACARA school ID] [float] NULL,
	[State School ID] [nvarchar](255) NULL,
	[School Name] [nvarchar](255) NULL,
	[School Type] [nvarchar](255) NULL,
	[Address line 1] [nvarchar](255) NULL,
	[Suburb] [nvarchar](255) NULL,
	[State1] [nvarchar](255) NULL,
	[Postcode] [float] NULL,
	[Geolocation] [float] NULL,
	[Principal Title] [nvarchar](255) NULL,
	[Principal Fname] [nvarchar](255) NULL,
	[Principal's LName] [nvarchar](255) NULL,
	[Principal full name] [nvarchar](255) NULL,
	[Principal's email] [nvarchar](255) NULL,
	[School Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[Year 3] [float] NULL,
	[Year 5] [nvarchar](255) NULL,
	[Year 7] [nvarchar](255) NULL,
	[Year 9] [nvarchar](255) NULL,
	[Linking_Primary] [nvarchar](255) NULL,
	[Linking_Secondary] [nvarchar](255) NULL,
	[Involvement in other studies] [nvarchar](255) NULL,
	[Comments] [nvarchar](255) NULL,
	[Subject] [nvarchar](255) NULL,
	[Test Order] [nvarchar](255) NULL,
	[3] [nvarchar](255) NULL,
	[5] [nvarchar](255) NULL,
	[7] [nvarchar](255) NULL,
	[9] [nvarchar](255) NULL,
	[F34] [nvarchar](255) NULL,
	[F35] [nvarchar](255) NULL,
	[Class1 yr] [nvarchar](255) NULL,
	[Class1 subject] [nvarchar](255) NULL,
	[Class1 order] [nvarchar](255) NULL,
	[Class2 yr] [nvarchar](255) NULL,
	[Class2 subject] [nvarchar](255) NULL,
	[Class2 order] [nvarchar](255) NULL,
	[Class3 yr] [nvarchar](255) NULL,
	[Class3 subject] [nvarchar](255) NULL,
	[Class3 order] [nvarchar](255) NULL,
	[Class4 yr] [nvarchar](255) NULL,
	[Class4 subject] [nvarchar](255) NULL,
	[Class4 order] [nvarchar](255) NULL,
	[Total classes] [float] NULL,
	[Website username] [float] NULL,
	[Website password] [nvarchar](255) NULL,
	[TestOrderText] [nvarchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_TestType]    Script Date: 6/5/2018 2:07:31 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TestType] ON [dbo].[TestType]
(
	[TestTypeDescription] ASC,
	[YearLevel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Addresses] ADD  CONSTRAINT [DF_Addresses_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Centre] ADD  CONSTRAINT [DF_Centre_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Centre] ADD  CONSTRAINT [DF_Centre_CentreDetailsConfirmed]  DEFAULT ((0)) FOR [CentreDetailsConfirmed]
GO
ALTER TABLE [dbo].[Centre] ADD  CONSTRAINT [DF_Centre_ContactDetailsConfirmed]  DEFAULT ((0)) FOR [ContactDetailsConfirmed]
GO
ALTER TABLE [dbo].[Centre] ADD  CONSTRAINT [DF_Centre_ClassScheduleConfirmed]  DEFAULT ((0)) FOR [ClassScheduleConfirmed]
GO
ALTER TABLE [dbo].[Invigilator] ADD  CONSTRAINT [DF_Invigilator_WillingToTravel]  DEFAULT ((0)) FOR [WillingToTravel]
GO
ALTER TABLE [dbo].[Invigilator] ADD  CONSTRAINT [DF_Invigilator_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Invigilator] ADD  CONSTRAINT [DF_Invigilator_InvigilatorDetailsConfirmed]  DEFAULT ((0)) FOR [InvigilatorDetailsConfirmed]
GO
ALTER TABLE [dbo].[Invigilator] ADD  CONSTRAINT [DF_Invigilator_InvigilatorAvailableDatesConfirmed]  DEFAULT ((0)) FOR [InvigilatorAvailableDatesConfirmed]
GO
ALTER TABLE [dbo].[Invigilator] ADD  CONSTRAINT [DF_Invigilator_TravelInterState]  DEFAULT ((0)) FOR [TravelInterState]
GO
ALTER TABLE [dbo].[Invigilator] ADD  CONSTRAINT [DF_Invigilator_StayOverNight]  DEFAULT ((0)) FOR [StayOverNight]
GO
ALTER TABLE [dbo].[Centre]  WITH CHECK ADD  CONSTRAINT [FK_Centre_Addresses] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Addresses] ([AddressID])
GO
ALTER TABLE [dbo].[Centre] CHECK CONSTRAINT [FK_Centre_Addresses]
GO
ALTER TABLE [dbo].[Centre]  WITH NOCHECK ADD  CONSTRAINT [FK_Centre_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ProjectID])
GO
ALTER TABLE [dbo].[Centre] NOCHECK CONSTRAINT [FK_Centre_Project]
GO
ALTER TABLE [dbo].[CentreContact]  WITH CHECK ADD  CONSTRAINT [FK_CentreContact_ContactTypes] FOREIGN KEY([ContactTypeID])
REFERENCES [dbo].[ContactTypes] ([ContactTypeID])
GO
ALTER TABLE [dbo].[CentreContact] CHECK CONSTRAINT [FK_CentreContact_ContactTypes]
GO
ALTER TABLE [dbo].[CentreContacts]  WITH CHECK ADD  CONSTRAINT [FK_CentreContacts_Centre] FOREIGN KEY([ContactID])
REFERENCES [dbo].[CentreContact] ([ContactID])
GO
ALTER TABLE [dbo].[CentreContacts] CHECK CONSTRAINT [FK_CentreContacts_Centre]
GO
ALTER TABLE [dbo].[CentreContacts]  WITH CHECK ADD  CONSTRAINT [FK_CentreContacts_Centre1] FOREIGN KEY([PRACentreID])
REFERENCES [dbo].[Centre] ([PRACentreID])
GO
ALTER TABLE [dbo].[CentreContacts] CHECK CONSTRAINT [FK_CentreContacts_Centre1]
GO
ALTER TABLE [dbo].[CentreTestTypeYearlevel]  WITH CHECK ADD  CONSTRAINT [FK_CentreTestTypeYearlevel_Centre] FOREIGN KEY([PRACentreID])
REFERENCES [dbo].[Centre] ([PRACentreID])
GO
ALTER TABLE [dbo].[CentreTestTypeYearlevel] CHECK CONSTRAINT [FK_CentreTestTypeYearlevel_Centre]
GO
ALTER TABLE [dbo].[CentreTestTypeYearlevel]  WITH NOCHECK ADD  CONSTRAINT [FK_CentreTestTypeYearlevel_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[CentreTestTypeYearlevel] NOCHECK CONSTRAINT [FK_CentreTestTypeYearlevel_Class]
GO
ALTER TABLE [dbo].[CentreTestTypeYearlevel]  WITH CHECK ADD  CONSTRAINT [FK_CentreTestTypeYearlevel_TestType] FOREIGN KEY([TestTypeID])
REFERENCES [dbo].[TestType] ([TestTypeID])
GO
ALTER TABLE [dbo].[CentreTestTypeYearlevel] CHECK CONSTRAINT [FK_CentreTestTypeYearlevel_TestType]
GO
ALTER TABLE [dbo].[ClassDeviceTypes]  WITH CHECK ADD  CONSTRAINT [FK_ClassDeviceTypes_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClassDeviceTypes] CHECK CONSTRAINT [FK_ClassDeviceTypes_Class]
GO
ALTER TABLE [dbo].[ClassDeviceTypes]  WITH CHECK ADD  CONSTRAINT [FK_ClassDeviceTypes_DeviceType] FOREIGN KEY([DeviceTypeID])
REFERENCES [dbo].[DeviceType] ([DeviceTypeID])
GO
ALTER TABLE [dbo].[ClassDeviceTypes] CHECK CONSTRAINT [FK_ClassDeviceTypes_DeviceType]
GO
ALTER TABLE [dbo].[ClassTestDates]  WITH CHECK ADD  CONSTRAINT [FK_ClassTestDates_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClassTestDates] CHECK CONSTRAINT [FK_ClassTestDates_Class]
GO
ALTER TABLE [dbo].[ClassTestDates]  WITH CHECK ADD  CONSTRAINT [FK_ClassTestDates_InvigilatorAvailableDates] FOREIGN KEY([InvigilatorAvailableDateId])
REFERENCES [dbo].[InvigilatorAvailableDates] ([InvigilatorAvailableDateId])
GO
ALTER TABLE [dbo].[ClassTestDates] CHECK CONSTRAINT [FK_ClassTestDates_InvigilatorAvailableDates]
GO
ALTER TABLE [dbo].[Invigilator]  WITH CHECK ADD  CONSTRAINT [FK_Invigilator_Addresses] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Addresses] ([AddressID])
GO
ALTER TABLE [dbo].[Invigilator] CHECK CONSTRAINT [FK_Invigilator_Addresses]
GO
ALTER TABLE [dbo].[InvigilatorAvailableDates]  WITH CHECK ADD  CONSTRAINT [FK_AvailableDatesInvigilator_Invigilator] FOREIGN KEY([InvigilatorID])
REFERENCES [dbo].[Invigilator] ([InvigilatorID])
GO
ALTER TABLE [dbo].[InvigilatorAvailableDates] CHECK CONSTRAINT [FK_AvailableDatesInvigilator_Invigilator]
GO
ALTER TABLE [dbo].[ProjectDeviceTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProjectDeviceTypes_DeviceType] FOREIGN KEY([DeviceTypeID])
REFERENCES [dbo].[DeviceType] ([DeviceTypeID])
GO
ALTER TABLE [dbo].[ProjectDeviceTypes] CHECK CONSTRAINT [FK_ProjectDeviceTypes_DeviceType]
GO
ALTER TABLE [dbo].[ProjectDeviceTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProjectDeviceTypes_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ProjectID])
GO
ALTER TABLE [dbo].[ProjectDeviceTypes] CHECK CONSTRAINT [FK_ProjectDeviceTypes_Project]
GO
USE [master]
GO
ALTER DATABASE [InvigilationTest] SET  READ_WRITE 
GO
