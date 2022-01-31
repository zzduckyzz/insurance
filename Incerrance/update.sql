USE [master]
GO
/****** Object:  Database [InsurraceDB]    Script Date: 4/1/2021 2:41:20 PM ******/
CREATE DATABASE [InsurraceDB] 
GO
ALTER DATABASE [InsurraceDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InsurraceDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InsurraceDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InsurraceDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [InsurraceDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InsurraceDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [InsurraceDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InsurraceDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InsurraceDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InsurraceDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InsurraceDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InsurraceDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InsurraceDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InsurraceDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InsurraceDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [InsurraceDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InsurraceDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InsurraceDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InsurraceDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InsurraceDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InsurraceDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InsurraceDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InsurraceDB] SET RECOVERY FULL 
GO
ALTER DATABASE [InsurraceDB] SET  MULTI_USER 
GO
ALTER DATABASE [InsurraceDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InsurraceDB] SET DB_CHAINING OFF 
GO
USE [InsurraceDB]
GO
/****** Object:  Table [dbo].[About]    Script Date: 4/1/2021 2:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClaimInsurance]    Script Date: 4/1/2021 2:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClaimInsurance](
	[Id] [uniqueidentifier] NOT NULL,
	[Registration_InsuranceId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[Reply] [nvarchar](max) NULL,
	[PlaceOfAccident] [nvarchar](256) NULL,
	[DateOfAccident] [datetime] NULL,
	[PolicyEndDate] [datetime] NULL,
	[InsuredAmount] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [nvarchar](255) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_ClaimInsurance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 4/1/2021 2:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](256) NULL,
	[ObjectName] [nvarchar](256) NULL,
	[Address] [nvarchar](256) NULL,
	[Mobile] [varchar](20) NULL,
	[Website] [varchar](256) NULL,
	[Email] [varchar](256) NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__Contact__3214EC07B68E50F5] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Credential]    Script Date: 4/1/2021 2:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Credential](
	[UserGroupId] [varchar](50) NOT NULL,
	[RoleId] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Credential_1] PRIMARY KEY CLUSTERED 
(
	[UserGroupId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 4/1/2021 2:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Feedback](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](256) NULL,
	[Phone] [varchar](50) NULL,
	[Email] [varchar](256) NULL,
	[Address] [nvarchar](256) NULL,
	[Content] [nvarchar](max) NULL,
	[Reply] [nvarchar](max) NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__Feedback__3214EC07ABFD67FA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Footer]    Script Date: 4/1/2021 2:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footer](
	[Id] [uniqueidentifier] NOT NULL,
	[CoppyRight] [nvarchar](100) NULL,
	[Address] [nvarchar](256) NULL,
	[PhoneNumber] [nvarchar](256) NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__Footer__3214EC07852F6A97] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Insurrance]    Script Date: 4/1/2021 2:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Insurrance](
	[Id] [uniqueidentifier] NOT NULL,
	[VehicleId] [uniqueidentifier] NULL,
	[InsurranceCode] [nvarchar](50) NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[Price] [int] NULL CONSTRAINT [DF_Insurrance_Price_1]  DEFAULT ((0)),
	[TimeInsurrance] [int] NULL,
	[Quantity] [int] NULL CONSTRAINT [DF_Insurrance_Quantity_1]  DEFAULT ((0)),
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
 CONSTRAINT [PK_Insurrance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 4/1/2021 2:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](256) NOT NULL,
	[Link] [nvarchar](256) NULL,
	[DisplayOrder] [int] NULL,
	[ParentId] [int] NULL,
	[Target] [nvarchar](256) NOT NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__Menu__3214EC079B6A10D6] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 4/1/2021 2:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[News](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](256) NULL,
	[Summary] [nvarchar](max) NULL,
	[MetaTitle] [varchar](256) NULL,
	[Description] [nvarchar](max) NULL,
	[UrlImage] [nvarchar](256) NULL,
	[NewsCategoryId] [uniqueidentifier] NULL,
	[Warranty] [int] NULL,
	[MetaKeywords] [nvarchar](256) NULL,
	[MetaDescriptions] [nvarchar](256) NULL,
	[TopHot] [datetime] NULL,
	[ViewCount] [int] NULL,
	[Tag] [nvarchar](256) NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__Content__3214EC0722536217] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NewsCategory]    Script Date: 4/1/2021 2:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NewsCategory](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](256) NULL,
	[MetaTitle] [varchar](256) NULL,
	[ParentId] [int] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](256) NULL,
	[MetaKeywords] [nvarchar](256) NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__Category__3214EC07DEE8C6AA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Registration_Insurance]    Script Date: 4/1/2021 2:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration_Insurance](
	[Id] [uniqueidentifier] NOT NULL,
	[InsurranceId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[FullName] [nvarchar](255) NULL,
	[DateOfBirth] [date] NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[LicensePlate] [nvarchar](255) NULL,
	[VehicleRate] [int] NULL,
	[RangeOfVehicle] [nvarchar](255) NULL,
	[RegistrationDate] [datetime] NULL,
	[ExpirationDate] [datetime] NULL,
	[TotalMoney] [int] NULL,
	[CMND] [nvarchar](255) NULL,
	[Status] [nvarchar](255) NULL,
	[RegistrationInsuranceCode] [nvarchar](50) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Registration_Insurance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 4/1/2021 2:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 4/1/2021 2:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UrlImage] [nvarchar](256) NOT NULL,
	[DisplayOrder] [int] NULL,
	[Link] [nvarchar](256) NULL,
	[Description] [nvarchar](256) NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__Slide__3214EC073DFECF16] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 4/1/2021 2:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] NOT NULL,
	[GroupId] [varchar](50) NULL,
	[AvatarUrl] [nvarchar](256) NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
	[ConfirmPassword] [varchar](50) NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[ResetPasswordCode] [nvarchar](100) NULL,
	[Email] [varchar](256) NULL,
	[Address] [nvarchar](max) NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__User__3214EC07B2B93D14] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 4/1/2021 2:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserGroup](
	[Id] [varchar](50) NOT NULL,
	[Name] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 4/1/2021 2:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[Id] [uniqueidentifier] NOT NULL,
	[VehicleTypeId] [uniqueidentifier] NULL,
	[Name] [nvarchar](250) NULL,
	[VehicleModel] [nvarchar](250) NULL,
	[VehicleVersion] [nvarchar](250) NULL,
	[VehicleBodyNumber] [nvarchar](250) NULL,
	[ImageVehicle] [nvarchar](250) NULL,
	[VehicleEngineNumber] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](50) NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_InsurranceCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VehicleType]    Script Date: 4/1/2021 2:41:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleType](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[CreatedOn] [datetimeoffset](7) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[ModifiedOn] [datetimeoffset](7) NULL,
	[ModifiedBy] [nvarchar](256) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_VehicleType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[About] ([Id], [Title], [Description], [Content], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (N'71725cfd-cf6d-49d9-b152-9102907d997e', N'ABOUT AA INSURRANCE', N'For nearly a century, AIA has served the ever-changing needs of millions of people across the Asia-Pacific region.', N'<p>AIA Vietnam is a member of AIA Group - the world&#39;s largest listed independent life insurance group with Asian origin.</p>

<p>Founded in 2000 with the aim of protecting the prosperity and financial safety of the Vietnamese people, AIA Vietnam is currently one of the leading life insurance companies and a brand recognized by customers and trusted public.</p>

<p>WHY CHOOSE AIA?<br />
We know that life is inherently unpredictable. With a strong financial background and a deep understanding of the Asian market, we are here to help you overcome the ups and downs of life.</p>

<p>We are always a pioneer in building innovative service models to deliver classy experiences to customers. This is most clearly demonstrated through &quot;iPoS&quot;, &quot;nest by AIA&quot;, &quot;AIA Exchange&quot; and &quot;NEXT General Agent&quot;.<br />
AIA Vietnam&#39;s goal is to become the preeminent life insurer in Vietnam.</p>
', 0, NULL, NULL, N'admin', CAST(N'2021-01-18T01:13:31.5559755+07:00' AS DateTimeOffset))
INSERT [dbo].[ClaimInsurance] ([Id], [Registration_InsuranceId], [UserId], [Reply], [PlaceOfAccident], [DateOfAccident], [PolicyEndDate], [InsuredAmount], [Description], [Status], [ModifiedBy], [CreatedOn], [CreatedBy], [ModifiedOn]) VALUES (N'b678c522-9229-43b3-ab55-3eee301c3f00', N'b8437348-65a5-4925-816b-15b26d2dc6ed', N'f51b6b74-6f9a-466e-8b7a-539bf0c5c6f1', N'rter234', N'Ha Noi', CAST(N'2021-03-31 00:00:00.000' AS DateTime), NULL, 234243, N'sdfdsf', N'Responded', N'admin', CAST(N'2021-03-31T15:52:44.0000000+07:00' AS DateTimeOffset), N'test3', CAST(N'2021-03-31T15:57:34.7204246+07:00' AS DateTimeOffset))
INSERT [dbo].[ClaimInsurance] ([Id], [Registration_InsuranceId], [UserId], [Reply], [PlaceOfAccident], [DateOfAccident], [PolicyEndDate], [InsuredAmount], [Description], [Status], [ModifiedBy], [CreatedOn], [CreatedBy], [ModifiedOn]) VALUES (N'647079bd-1261-4abf-ac85-c5f4e9f0179d', N'0b2fdc80-5556-464a-8529-5738a5ea5984', N'0ef711e7-7200-4214-b81d-e090ab3ca926', N'rêtretertert', N'Gia Lai', CAST(N'2021-04-01 00:00:00.000' AS DateTime), NULL, 85555578, N'OK', N'Responded', N'admin', CAST(N'2021-04-01T14:38:01.0000000-07:00' AS DateTimeOffset), N'test9', CAST(N'2021-04-01T14:39:28.5518686-07:00' AS DateTimeOffset))
INSERT [dbo].[ClaimInsurance] ([Id], [Registration_InsuranceId], [UserId], [Reply], [PlaceOfAccident], [DateOfAccident], [PolicyEndDate], [InsuredAmount], [Description], [Status], [ModifiedBy], [CreatedOn], [CreatedBy], [ModifiedOn]) VALUES (N'20313847-67e3-4c26-9d27-e1f8a4aa679e', N'9ba1c76d-fa89-4b82-8bb7-99e4bcc24d48', N'a0111ffc-dbf9-44ce-baea-25afd756590e', N'ok', N'Gia Lai', CAST(N'2021-03-31 00:00:00.000' AS DateTime), NULL, 15488, N'Ok', N'Responded', N'admin', CAST(N'2021-03-31T15:19:23.0000000+07:00' AS DateTimeOffset), N'test2', CAST(N'2021-03-31T15:43:24.9238025+07:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([Id], [Title], [ObjectName], [Address], [Mobile], [Website], [Email], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (1, N'Insurance', N'Da Nang City Social Insurance', N'99 Xô Viết Nghệ Tĩnh, Hải Châu', N'0236.478.479', N'https://Insurance.com.vn', N'freestyledanang@gmail.com', CAST(N'2019-05-29T12:22:26.0000000+07:00' AS DateTimeOffset), N'admin', CAST(N'2021-01-18T00:57:32.2019090+07:00' AS DateTimeOffset), N'admin', 0)
INSERT [dbo].[Contact] ([Id], [Title], [ObjectName], [Address], [Mobile], [Website], [Email], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (2, N'District Social Insurance', N'Ngu Hanh Son District Social Insurance', N'48 Hai Bà Trung, Hội An', N'0235.487.489', N'https://Insurance.com.vn', N'freestylehoian@gmail.com', CAST(N'2019-05-29T12:22:26.0000000+07:00' AS DateTimeOffset), N'admin', CAST(N'2021-01-18T00:56:32.6704449+07:00' AS DateTimeOffset), N'admin', 0)
SET IDENTITY_INSERT [dbo].[Contact] OFF
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'ADD_USER')
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'CREATE_CREDENTIAL')
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'CREATE_ROLE')
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'CREATE_USER_GROUP')
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'DELETE_CREDENTIAL')
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'DELETE_ROLE')
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'DELETE_USER')
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'DELETE_USER_GROUP')
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'EDIT_USER')
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'UPDATE_ROLE')
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'UPDATE_USER_GROUP')
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'VIEW_CREDENTIAL')
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'VIEW_LAYOUT')
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'VIEW_ROLE')
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'VIEW_USER')
INSERT [dbo].[Credential] ([UserGroupId], [RoleId]) VALUES (N'ADMIN', N'VIEW_USER_GROUP')
INSERT [dbo].[Feedback] ([Id], [Name], [Phone], [Email], [Address], [Content], [Reply], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'0ea663e4-be02-4f8f-a9c7-3a2f0e4c4522', N'Bùi Thế Toàn', N'0213158128', N'toan38582@donga.edu.vn', N'Gia Lai', N'CRUD for Layout, admin, login with facebook', N'Finish', CAST(N'2019-06-04T10:50:20.0000000+07:00' AS DateTimeOffset), NULL, CAST(N'2019-06-04T11:55:22.7982222+07:00' AS DateTimeOffset), N'admin', 0)
INSERT [dbo].[Feedback] ([Id], [Name], [Phone], [Email], [Address], [Content], [Reply], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'b17940d6-204f-4079-9c5d-6411e2ae58fa', N'Lê Văn Quang', N'0789846512', N'quangle@gmail.com', N'Gia Lai', N'Role, User, UserGroup, Credentials (CRUD)', N'Finish', CAST(N'2019-06-04T10:49:28.0000000+07:00' AS DateTimeOffset), NULL, CAST(N'2019-06-04T11:55:36.4814440+07:00' AS DateTimeOffset), N'admin', 0)
INSERT [dbo].[Feedback] ([Id], [Name], [Phone], [Email], [Address], [Content], [Reply], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'ae2f9c04-2189-40d4-8037-afffd451384a', N'QUang oc cho', N'913712903123', N'quangle@gmail.com', N'as;ldfjkas', N'ngu nhu bo', N'ngu nhu cho dsfasdfasdf', CAST(N'2019-06-08T09:58:55.0000000+07:00' AS DateTimeOffset), NULL, CAST(N'2019-06-08T09:59:26.9347532+07:00' AS DateTimeOffset), N'admin', 1)
INSERT [dbo].[Feedback] ([Id], [Name], [Phone], [Email], [Address], [Content], [Reply], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'a848b336-aecf-483d-a2b5-e2d821f5be2b', N'Trần Thị Thùy Linh', N'0912389143', N'linh38447@donga.edu.vn', N'Gia Lai', N'Form Login, Layout for Home page, CRUD, search, pagedlist, sort for User table', N'Finish', CAST(N'2019-06-04T10:51:31.0000000+07:00' AS DateTimeOffset), NULL, CAST(N'2019-06-04T11:55:46.6417554+07:00' AS DateTimeOffset), N'admin', 0)
INSERT [dbo].[Feedback] ([Id], [Name], [Phone], [Email], [Address], [Content], [Reply], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'2101bc7f-ad25-4556-84d7-eddd76209a45', N'Le Van Quang', N'0868486885', N'duachutthoinhe123@gmail.com', N'14 Doan uẩn ', N'ABCDSFG', N'Ok', CAST(N'2021-01-10T21:49:18.0000000+07:00' AS DateTimeOffset), NULL, CAST(N'2021-01-10T21:49:36.3377113+07:00' AS DateTimeOffset), N'admin', 0)
INSERT [dbo].[Feedback] ([Id], [Name], [Phone], [Email], [Address], [Content], [Reply], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'ac526ab9-64dd-488f-8302-fc2f18d9ea7e', N'Trần Hữu Hùng', N'0123456789', N'hung38585@donga.edu.vn', N'Đà Nẵng', N'CRUD, search, pagedlist, sort for Product table', N'Finish', CAST(N'2019-06-04T10:48:30.0000000+07:00' AS DateTimeOffset), NULL, CAST(N'2019-06-04T11:55:52.5782255+07:00' AS DateTimeOffset), N'admin', 0)
INSERT [dbo].[Footer] ([Id], [CoppyRight], [Address], [PhoneNumber], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'044bf44b-24af-4c55-a776-f93ae5e6ceb0', N'© 2021 Insurrance', N' Da Nang City Social Insurance', N'0988.944.608', NULL, NULL, CAST(N'2021-01-18T00:58:36.2258996+07:00' AS DateTimeOffset), N'admin', 0)
INSERT [dbo].[Insurrance] ([Id], [VehicleId], [InsurranceCode], [Name], [Description], [MetaTitle], [Price], [TimeInsurrance], [Quantity], [IsDeleted], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (N'78bba18d-1eb5-4c04-9597-07f174068805', N'73e887e4-52fb-4724-a141-187ea8b55772', N'awe-2', N'Lorem Ipsum 1 ', N'<h2>Kas yra Lorem Ipsum?</h2>

<p><strong>Lorem ipsum</strong>&nbsp;- tai fiktyvus tekstas naudojamas spaudos ir grafinio dizaino pasaulyje jau nuo XVI a. pradžios. Lorem Ipsum tapo standartiniu fiktyviu tekstu, kai nežinomas spaustuvininkas atsitiktine tvarka i&scaron;dėliojo raides atspaudų prese ir tokiu būdu sukūrė raidžių egzempliorių. &Scaron;is tekstas i&scaron;liko beveik nepasikeitęs ne tik penkis amžius, bet ir įžengė i kopiuterinio grafinio dizaino laikus. Jis i&scaron;populiarėjo XX a. &scaron;e&scaron;tajame de&scaron;imtmetyje, kai buvo i&scaron;leisti Letraset lapai su Lorem Ipsum i&scaron;traukomis, o vėliau -leidybinė sistema AldusPageMaker, kurioje buvo ir Lorem Ipsum versija.</p>

<h2>Kam jis naudojamas?</h2>

<p>Jau seniai žinoma, kad vertinant dizainą ir kompoziciją, bla&scaron;ko skaitomas tekstas. Tad Lorem Ipsum naudojamas tam, kad daugiau ar mažiau normalizuotų raidžių paskirstymą vietoje paprasto dubliavimo: &bdquo;Tekstas tekstas tekstas tekstas...&ldquo;. Daugelis leidybinių sistemų programų, o taip pat ir Hiperteksto kalbos redaktoriai naudoja Lorem Ipsum kaip demonstracinę numatyto teksto versiją, todel žodžių &bdquo;Lorem Ipsum&ldquo; internetinė paie&scaron;ka parodo daug tinklalapių kurie yra dar besikuriantys. Egzistuoja ne mažai įvairių Lorem Ipsum versijų. Kai kurios i&scaron; jų buvo sukurtos per klaidą, kitos - tyčia (pvz. jumoristinės).</p>

<p>&nbsp;</p>

<h2>I&scaron; kur jis atsirado?</h2>

<p>Daug kas galvoja, kad Lorem Ipsum - tai vien tik atsitiktinai surinktas tekstas, bet taip nėra. Jo &scaron;aknis galima rasti klasikiniame Lotynų kalba para&scaron;ytame kūrinyje, i&scaron;leistame 45 pr. m. e., t.y. prie&scaron; du tūkstančius metų. Richard McClintock, lotynų kalbos profesorius Hampden-Sydney (JAV) koledže, i&scaron;rinko vieną i&scaron; neai&scaron;kesnių žodžių i&scaron; Lorem Ipsum i&scaron;traukos - &bdquo;consectetur&ldquo;, ir ėmėsi ie&scaron;koti jo klasikinėje lotynų kalbos literatūroje. Tokiu būdu jis rado neabejotiną &scaron;io žodžio ir Lorem Ipsum &scaron;altinį knygos &bdquo;de Finibus Bonorum et Malorum&ldquo; (Apie gėrio ir blogio ribas) 1.10.32 ir 1.10.33 pastraipose. Kūrinio autorius &ndash; Ciceronas, para&scaron;ęs jį 45 pr. m. e. &Scaron;is etikos teorijos traktatas buvo labai populiarus Renesanso laikais. Pirmoji Lorem Ipsum teksto eilutė, &bdquo;Lorem ipsum dolor sit amet..&ldquo; sukurta remiantis 1.10.32 pastraipa.</p>

<p>Klasikinį Lorem Ipsum teksto pavyzdį, naudojamą nuo XVI a., galima pamatyti svetainės apačioje. Taip pat pateikiamos 1.10.32 ir 1.10.33 pastraipos is Cicerono knygos &bdquo;de Finibus Bonorum et Malorum&ldquo;, ir jų vertimai į anglų kalbą H.Rackham 1914m.</p>
', N'Lorem-Ipsum-1', 100000000, 24, 25, 0, CAST(N'2021-03-28T16:24:40.1037013+07:00' AS DateTimeOffset), N'admin', NULL, NULL)
INSERT [dbo].[Insurrance] ([Id], [VehicleId], [InsurranceCode], [Name], [Description], [MetaTitle], [Price], [TimeInsurrance], [Quantity], [IsDeleted], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (N'28498a97-0fb4-463b-88c0-3131cd309cdc', N'9ec4c651-1670-4c6b-8e70-001aa20d3684', N'Real-estate-insurance-8452', N'Real estate insurance', N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque viverra hendrerit rhoncus. Donec sem ex, tempus id nisi sit amet, viverra condimentum ipsum. Proin tempus dui in tellus tincidunt, vel laoreet eros molestie. Donec cursus finibus sapien faucibus auctor. Vivamus eget rhoncus augue. Nulla vitae pellentesque odio. Morbi mauris erat, fringilla quis nunc quis, gravida pretium orci. Pellentesque nec feugiat lectus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin turpis dui, ornare in molestie a, finibus fringilla leo. Sed a tempus nunc, eget euismod elit.</p>

<p>Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed ultricies, nibh in lobortis dapibus, nunc sapien gravida ante, at auctor urna lacus sed quam. Cras tortor sapien, consectetur in purus non, euismod ultrices libero. Suspendisse potenti. Cras faucibus convallis sapien nec rutrum. In interdum mauris eu nunc bibendum mattis. Mauris lobortis mi ac mi ornare dignissim. Sed bibendum leo lorem, at accumsan enim congue sed. Duis volutpat sit amet lacus in ultricies. Mauris ultrices luctus erat, in elementum lacus sodales quis. Ut eu bibendum nisl, eget malesuada lacus.</p>

<p>Quisque sodales laoreet velit. Morbi mattis eu felis a dapibus. Praesent viverra imperdiet elit, quis malesuada lacus bibendum nec. Curabitur et nisl nec tellus ultricies egestas. Sed sollicitudin, magna ac dictum rutrum, massa velit ornare felis, eu condimentum quam ipsum ac ipsum. Vivamus pharetra velit ut libero efficitur congue. Nulla leo dui, rhoncus a quam ac, mollis ornare erat. Nulla hendrerit, ex nec euismod sollicitudin, dolor justo maximus arcu, sit amet pretium eros augue nec felis. Aenean auctor libero eget nulla auctor, sagittis posuere ante imperdiet.</p>

<p>Mauris id mattis tellus. Cras vitae quam dictum, mattis urna a, dignissim tortor. Nulla facilisi. Fusce et eleifend tortor, nec eleifend lorem. Aenean vel diam dolor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec orci ligula, accumsan ut placerat a, convallis egestas libero. Nam vitae libero eleifend, rhoncus metus ut, blandit felis. Vivamus sit amet vestibulum turpis. Donec turpis ipsum, bibendum quis enim ut, molestie gravida lectus. Aenean mattis efficitur euismod. Vivamus rhoncus congue lectus, sed aliquet orci convallis eu. Vestibulum sit amet ipsum gravida, tempor tellus at, ultrices risus.</p>

<p>Cras lacinia imperdiet massa, viverra malesuada nunc egestas ut. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec eleifend malesuada tincidunt. Morbi quis nisi quis justo fermentum luctus non a lacus. Phasellus mattis tincidunt nunc ut vulputate. Donec ac nibh augue. Duis quis nibh massa. Praesent suscipit at arcu sit amet porta.</p>

<p>Generated 5 paragraphs, 419 words, 2805 bytes of&nbsp;<a href="https://www.lipsum.com/" title="Lorem Ipsum">Lorem Ipsum</a></p>
', N'Real-estate-insurance', 30000000, NULL, 50, 1, CAST(N'2021-01-18T01:37:13.1992545+07:00' AS DateTimeOffset), N'admin', NULL, NULL)
INSERT [dbo].[Insurrance] ([Id], [VehicleId], [InsurranceCode], [Name], [Description], [MetaTitle], [Price], [TimeInsurrance], [Quantity], [IsDeleted], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (N'9d119728-a12c-45ee-a4bb-3a18766a8340', N'd00cb1fb-3ee1-4105-bbee-1e8a93842176', N'Motorcycle-insurance-12514', N'Motorcycle insurance', N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque viverra hendrerit rhoncus. Donec sem ex, tempus id nisi sit amet, viverra condimentum ipsum. Proin tempus dui in tellus tincidunt, vel laoreet eros molestie. Donec cursus finibus sapien faucibus auctor. Vivamus eget rhoncus augue. Nulla vitae pellentesque odio. Morbi mauris erat, fringilla quis nunc quis, gravida pretium orci. Pellentesque nec feugiat lectus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin turpis dui, ornare in molestie a, finibus fringilla leo. Sed a tempus nunc, eget euismod elit.</p>

<p>Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed ultricies, nibh in lobortis dapibus, nunc sapien gravida ante, at auctor urna lacus sed quam. Cras tortor sapien, consectetur in purus non, euismod ultrices libero. Suspendisse potenti. Cras faucibus convallis sapien nec rutrum. In interdum mauris eu nunc bibendum mattis. Mauris lobortis mi ac mi ornare dignissim. Sed bibendum leo lorem, at accumsan enim congue sed. Duis volutpat sit amet lacus in ultricies. Mauris ultrices luctus erat, in elementum lacus sodales quis. Ut eu bibendum nisl, eget malesuada lacus.</p>

<p>Quisque sodales laoreet velit. Morbi mattis eu felis a dapibus. Praesent viverra imperdiet elit, quis malesuada lacus bibendum nec. Curabitur et nisl nec tellus ultricies egestas. Sed sollicitudin, magna ac dictum rutrum, massa velit ornare felis, eu condimentum quam ipsum ac ipsum. Vivamus pharetra velit ut libero efficitur congue. Nulla leo dui, rhoncus a quam ac, mollis ornare erat. Nulla hendrerit, ex nec euismod sollicitudin, dolor justo maximus arcu, sit amet pretium eros augue nec felis. Aenean auctor libero eget nulla auctor, sagittis posuere ante imperdiet.</p>

<p>Mauris id mattis tellus. Cras vitae quam dictum, mattis urna a, dignissim tortor. Nulla facilisi. Fusce et eleifend tortor, nec eleifend lorem. Aenean vel diam dolor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec orci ligula, accumsan ut placerat a, convallis egestas libero. Nam vitae libero eleifend, rhoncus metus ut, blandit felis. Vivamus sit amet vestibulum turpis. Donec turpis ipsum, bibendum quis enim ut, molestie gravida lectus. Aenean mattis efficitur euismod. Vivamus rhoncus congue lectus, sed aliquet orci convallis eu. Vestibulum sit amet ipsum gravida, tempor tellus at, ultrices risus.</p>

<p>Cras lacinia imperdiet massa, viverra malesuada nunc egestas ut. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec eleifend malesuada tincidunt. Morbi quis nisi quis justo fermentum luctus non a lacus. Phasellus mattis tincidunt nunc ut vulputate. Donec ac nibh augue. Duis quis nibh massa. Praesent suscipit at arcu sit amet porta.</p>

<p>Generated 5 paragraphs, 419 words, 2805 bytes of&nbsp;<a href="https://www.lipsum.com/" title="Lorem Ipsum">Lorem Ipsum</a></p>
', N'Motorcycle-insurance', 175000, NULL, 200, 1, CAST(N'2021-01-18T01:34:12.8709278+07:00' AS DateTimeOffset), N'admin', NULL, NULL)
INSERT [dbo].[Insurrance] ([Id], [VehicleId], [InsurranceCode], [Name], [Description], [MetaTitle], [Price], [TimeInsurrance], [Quantity], [IsDeleted], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (N'4e5be56d-1492-46e9-b4e9-7a31614310bf', N'd6ec71c7-dbaf-48dd-adcc-5aa7bb05f44a', N'awe-3', N'Lorem Ipsum 2', N'<h2>Qu&egrave; &eacute;s Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;&eacute;s un text de farciment usat per la ind&uacute;stria de la tipografia i la impremta. Lorem Ipsum ha estat el text est&agrave;ndard de la ind&uacute;stria des de l&#39;any 1500, quan un impressor desconegut va fer servir una galerada de text i la va mesclar per crear un llibre de mostres tipogr&agrave;fiques. No nom&eacute;s ha sobreviscut cinc segles, sin&oacute; que ha fet el salt cap a la creaci&oacute; de tipus de lletra electr&ograve;nics, romanent essencialment sense canvis. Es va popularitzar l&#39;any 1960 amb el llan&ccedil;ament de fulls Letraset que contenien passatges de Lorem Ipsum, i m&eacute;s recentment amb programari d&#39;autoedici&oacute; com Aldus Pagemaker que inclou versions de Lorem Ipsum.</p>

<h2>Per qu&egrave; el fem servir?</h2>

<p>&Eacute;s un fet establert de forma evident que un lector es distraur&agrave; amb el contingut llegible d&#39;una p&agrave;gina quan miri a la seva composici&oacute;. El fet de fer servir Lorem Ipsum &eacute;s perqu&egrave; cont&eacute; una distribuci&oacute; m&eacute;s o menys normal de lletres, de forma oposada a quan es fa servir &quot;Contingut aqu&iacute;, contingut aqu&iacute;&quot;, aconseguint aix&iacute; que sembli catal&agrave; llegible. Molts paquets d&#39;autoedici&oacute; fan servir Lorem Ipsum com el seu model de text, i una cerca per &quot;Lorem Ipsum&quot; descobrir&agrave; molts llocs web encara a les baceroles. Diverses versions han anat evolucionant al llarg dels anys, a vegades per acident, a vegades a prop&ograve;sit (inserint humor i coses per l&#39;estil).</p>

<p>&nbsp;</p>

<h2>D&#39;on ve?</h2>

<p>Contr&agrave;riament a la creen&ccedil;a popular, Lorem Ipsum no &eacute;s nom&eacute;s text aleatori. T&eacute; les seves arrels en una pe&ccedil;a cl&agrave;ssica de la literatura llatina del 45 aC, &eacute;s a dir, de fa 2000 anys. Richard McClintock, un professor de llat&iacute; al Hampden-Sydney College a Virg&iacute;nia, va buscar una de les paraules m&eacute;s estranyes del llat&iacute;, &quot;consectetur&quot;, procedent d&#39;un dels par&agrave;grafs de Lorem Ipsum, i anant de citaci&oacute; en citaci&oacute; d&#39;aquesta paraula a la literatura cl&agrave;ssica, en va descobrir l&#39;or&iacute;gen veritable. Lorem ipsum procedeix de les seccions 1.10.32 i 1.10.33 de &quot;De Finibus Bonorum et Malorum&quot; (Sobre el B&eacute; i el Mal) de Cicer&oacute;, escrit l&#39;any 45 aC. Aquest llibre &eacute;s un tractat sobre la teoria de l&#39;&egrave;tica, molt popular durant el Renaixement. La primera l&iacute;nia de Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, prov&eacute; d&#39;una l&iacute;nia a la secci&oacute; 1.10.32.</p>

<p>El fragment est&agrave;ndard de Lorem Ipsum fet servir des del 1500 es reprodueix a continuaci&oacute; per tots aquells interessats. Les seccions 1.10.32 i 1.10.33 de &quot;De Finibus Bonorum et Malorum&quot; de Cicer&oacute; es reprodueixen en la seva forma original, acompanyades de les versions angleses de la traducci&oacute; de 1914 feta per H. Rackham.</p>

<h2>On puc aconseguir-ne una mica?</h2>

<p>Hi ha moltes variacions dels passatges de Lorem Ipsum disponibles, per&ograve; la majoria han sofert alteracions d&#39;alguna manera, ja sigui per humor infiltrat, ja sigui per paraules aleat&ograve;ries que no semblen gaire cre&iuml;bles. Si vols fer servir un passatge de Lorem Ipsum, has d&#39;estar segur que no hi haur&agrave; res comprometedor amagat en el text. Tots els generadors de Lorem ipsum a Internet tendeixen a repetir un tros determinat tantes vegades com calgui, i aix&ograve; fa que aquest sigui el primer generador real a Internet. Fa servir un diccionari d&#39;unes 200 paraules llatines, combinades amb un grapat de models de frases per generar un Lorem Ipsum que sembli raonable. Aix&iacute; doncs, el Lorem Ipsum generat est&agrave; lliure de repeticions, humor injectat, o paraules no caracter&iacute;stiques.</p>
', N'Lorem-Ipsum-2', 5000000, 6, 100, 0, CAST(N'2021-03-28T16:25:35.0811776+07:00' AS DateTimeOffset), N'admin', NULL, NULL)
INSERT [dbo].[Insurrance] ([Id], [VehicleId], [InsurranceCode], [Name], [Description], [MetaTitle], [Price], [TimeInsurrance], [Quantity], [IsDeleted], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (N'd72cea5c-92b2-4f03-a4a5-a0aa1a6be59c', N'73e887e4-52fb-4724-a141-187ea8b55772', N'awe-1', N'Lorem Ipsum', N'<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>

<h2>Why do we use it?</h2>

<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>

<p>&nbsp;</p>

<h2>Where does it come from?</h2>

<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>

<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>

<h2>Where can I get some?</h2>

<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>
', N'Lorem-Ipsum', 50000000, 12, 50, 0, CAST(N'2021-03-28T16:23:36.1493655+07:00' AS DateTimeOffset), N'admin', NULL, NULL)
INSERT [dbo].[Insurrance] ([Id], [VehicleId], [InsurranceCode], [Name], [Description], [MetaTitle], [Price], [TimeInsurrance], [Quantity], [IsDeleted], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (N'174c0af7-5959-4d33-8d4b-c13f9be8b75b', N'bc6878e9-5529-4261-b145-ba2fc5d7a185', N'Lifetime-life-insurance 9999', N'Lifetime life insurance', N'<p>What is life insurance? 1<br />
According to Law on Insurance Business No. 12 / VBHN-VPQH: Life insurance is a type of insurance for the insured&#39;s life or death.</p>

<p>In legal aspect, life insurance is a contract that commits to pay the insurance premium of a life insurance company when the insured happens to have unexpected risks provided that the policyholder pays a fixed premium. The full period under a pre-agreed period could be 5 years, 10 years, 30 years&hellip;. Inside:</p>

<p>Insurance enterprise or life insurance company is an enterprise established, organized and operating under the provisions of this Law and other relevant laws for insurance and reinsurance business.<br />
Insured is a person whose health and life are the main insured subject of a life insurance policy. At present, an insurance policy has only one main insured (except for some participating products for pregnant women).<br />
The insurance buyer is actually the person who pays the periodical premium to maintain the contract. The insured can be the purchaser of insurance.<br />
An insurance policy has two parts: the primary life insurance and the supplementary insurance purchased with the main product. Accordingly, depending on each insurance package that the customer participates in, life insurance will cover the risks of accident, injury, serious illness, death and illness in hospital, surgery, and dentistry , maternity ...</p>

<p>The main purpose of life insurance is to protect people against unexpected risks, but in addition, life insurance combines savings and investment.</p>

<p>Currently on the market there are 18 life insurance companies operating in Vietnam. In which, only Bao Viet Life is a Vietnamese company, the remaining 17 companies are invested companies from major financial corporations in the world such as Manulife, AIA, Prudential, Dai-ichi Life, Hanwha life, Sun Life, Generali ... see more articles Life insurance companies in Vietnam to understand their charter capital and other information before joining.</p>

<p>In fact, insurance companies are also a business model, but especially a &quot;risky business&quot; model. Accordingly, the insurance company is a place to attract capital from the majority to operate a business and pay insurance benefits for unexpected risks occurring with a few of the majority contributing to the same financial fund.</p>

<p>Currently on the market there are 18 life insurance companies operating in Vietnam. In which, only Bao Viet Life is a Vietnamese company, the remaining 17 companies are invested companies from major financial corporations in the world such as Manulife, AIA, Prudential, Dai-ichi Life, Hanwha life, Sun Life, Generali ... see more articles Life insurance companies in Vietnam to understand their charter capital and other information before joining.</p>

<p>In fact, insurance companies are also a business model, but especially a &quot;risky business&quot; model. Accordingly, the insurance company is a place to attract capital from the majority to operate a business and pay insurance benefits for unexpected risks occurring with a few of the majority contributing to the same financial fund.</p>

<p>Currently on the market there are 18 life insurance companies operating in Vietnam. In which, only Bao Viet Life is a Vietnamese company, the remaining 17 companies are invested companies from major financial corporations in the world such as Manulife, AIA, Prudential, Dai-ichi Life, Hanwha life, Sun Life, Generali ... see more articles Life insurance companies in Vietnam to understand their charter capital and other information before joining.</p>

<p>In fact, insurance companies are also a business model, but especially a &quot;risky business&quot; model. Accordingly, the insurance company is a place to attract capital from the majority to operate a business and pay insurance benefits for unexpected risks occurring with a few of the majority contributing to the same financial fund.</p>

<p>Currently on the market there are 18 life insurance companies operating in Vietnam. In which, only Bao Viet Life is a Vietnamese company, the remaining 17 companies are invested companies from major financial corporations in the world such as Manulife, AIA, Prudential, Dai-ichi Life, Hanwha life, Sun Life, Generali ... see more articles Life insurance companies in Vietnam to understand their charter capital and other information before joining.</p>

<p>In fact, insurance companies are also a business model, but especially a &quot;risky business&quot; model. Accordingly, the insurance company is a place to attract capital from the majority to operate a business and pay insurance benefits for unexpected risks occurring with a few of the majority contributing to the same financial fund.</p>
', N'Lifetime-life-insurance', 200000000, NULL, 50, 1, CAST(N'2021-01-18T01:31:27.1985091+07:00' AS DateTimeOffset), N'admin', NULL, NULL)
INSERT [dbo].[Insurrance] ([Id], [VehicleId], [InsurranceCode], [Name], [Description], [MetaTitle], [Price], [TimeInsurrance], [Quantity], [IsDeleted], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (N'27e43e36-1def-4e2d-8ed7-c21956a76194', N'4ce0491b-17b0-49d9-b089-1ef74029f922', N'X5412F', N'Health Insurance 1', N'<p>According to the law on health insurance: Health insurance is a form of compulsory insurance that is applied to those under the provisions of the Law on Health Insurance for health care, not for profit purposes by the State. implementation organization.<br />
According to the Law amending and supplementing a number of articles of the Law on Health Insurance 2014, the maximum monthly health insurance premium is equal to 6% of the monthly salary or the base salary ... depending on the subject. But the State supports from 30% -100% of health insurance premiums for some subjects such as people with meritorious services to the revolution, near poor households, students ...</p>
', N'health-insurance', 50000000, NULL, 100, 1, CAST(N'2021-01-10T17:09:33.0000000+07:00' AS DateTimeOffset), N'admin', CAST(N'2021-01-10T17:25:00.0582782+07:00' AS DateTimeOffset), N'admin')
INSERT [dbo].[Insurrance] ([Id], [VehicleId], [InsurranceCode], [Name], [Description], [MetaTitle], [Price], [TimeInsurrance], [Quantity], [IsDeleted], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (N'9998179d-74eb-4f52-9ad1-dda2f1d5663c', N'4ce0491b-17b0-49d9-b089-1ef74029f922', N'Health-Insurance-1548', N'Health Insurance 2021', N'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque viverra hendrerit rhoncus. Donec sem ex, tempus id nisi sit amet, viverra condimentum ipsum. Proin tempus dui in tellus tincidunt, vel laoreet eros molestie. Donec cursus finibus sapien faucibus auctor. Vivamus eget rhoncus augue. Nulla vitae pellentesque odio. Morbi mauris erat, fringilla quis nunc quis, gravida pretium orci. Pellentesque nec feugiat lectus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin turpis dui, ornare in molestie a, finibus fringilla leo. Sed a tempus nunc, eget euismod elit.</p>

<p>Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed ultricies, nibh in lobortis dapibus, nunc sapien gravida ante, at auctor urna lacus sed quam. Cras tortor sapien, consectetur in purus non, euismod ultrices libero. Suspendisse potenti. Cras faucibus convallis sapien nec rutrum. In interdum mauris eu nunc bibendum mattis. Mauris lobortis mi ac mi ornare dignissim. Sed bibendum leo lorem, at accumsan enim congue sed. Duis volutpat sit amet lacus in ultricies. Mauris ultrices luctus erat, in elementum lacus sodales quis. Ut eu bibendum nisl, eget malesuada lacus.</p>

<p>Quisque sodales laoreet velit. Morbi mattis eu felis a dapibus. Praesent viverra imperdiet elit, quis malesuada lacus bibendum nec. Curabitur et nisl nec tellus ultricies egestas. Sed sollicitudin, magna ac dictum rutrum, massa velit ornare felis, eu condimentum quam ipsum ac ipsum. Vivamus pharetra velit ut libero efficitur congue. Nulla leo dui, rhoncus a quam ac, mollis ornare erat. Nulla hendrerit, ex nec euismod sollicitudin, dolor justo maximus arcu, sit amet pretium eros augue nec felis. Aenean auctor libero eget nulla auctor, sagittis posuere ante imperdiet.</p>

<p>Mauris id mattis tellus. Cras vitae quam dictum, mattis urna a, dignissim tortor. Nulla facilisi. Fusce et eleifend tortor, nec eleifend lorem. Aenean vel diam dolor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec orci ligula, accumsan ut placerat a, convallis egestas libero. Nam vitae libero eleifend, rhoncus metus ut, blandit felis. Vivamus sit amet vestibulum turpis. Donec turpis ipsum, bibendum quis enim ut, molestie gravida lectus. Aenean mattis efficitur euismod. Vivamus rhoncus congue lectus, sed aliquet orci convallis eu. Vestibulum sit amet ipsum gravida, tempor tellus at, ultrices risus.</p>

<p>Cras lacinia imperdiet massa, viverra malesuada nunc egestas ut. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec eleifend malesuada tincidunt. Morbi quis nisi quis justo fermentum luctus non a lacus. Phasellus mattis tincidunt nunc ut vulputate. Donec ac nibh augue. Duis quis nibh massa. Praesent suscipit at arcu sit amet porta.</p>

<p>Generated 5 paragraphs, 419 words, 2805 bytes of&nbsp;<a href="https://www.lipsum.com/" title="Lorem Ipsum">Lorem Ipsum</a></p>
', N'Health-Insurance', 356000, NULL, 900, 1, CAST(N'2021-01-18T01:40:03.8176117+07:00' AS DateTimeOffset), N'admin', NULL, NULL)
INSERT [dbo].[Insurrance] ([Id], [VehicleId], [InsurranceCode], [Name], [Description], [MetaTitle], [Price], [TimeInsurrance], [Quantity], [IsDeleted], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (N'0ffa8d02-a160-4a2e-a07d-f59e563dfa1b', N'73e887e4-52fb-4724-a141-187ea8b55772', N'awe-34', N'Lorem Ipsum 4', N'<h2>რა არის Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;საბეჭდი და ტიპოგრაფიული ინდუსტრიის უშინაარსო ტექსტია. იგი სტანდარტად 1500-იანი წლებიდან იქცა, როდესაც უცნობმა მბეჭდავმა ამწყობ დაზგაზე წიგნის საცდელი ეგზემპლარი დაბეჭდა. მისი ტექსტი არამარტო 5 საუკუნის მანძილზე შემორჩა, არამედ მან დღემდე, ელექტრონული ტიპოგრაფიის დრომდეც უცვლელად მოაღწია. განსაკუთრებული პოპულარობა მას 1960-იან წლებში გამოსულმა Letraset-ის ცნობილმა ტრაფარეტებმა მოუტანა, უფრო მოგვიანებით კი &mdash; Aldus PageMaker-ის ტიპის საგამომცემლო პროგრამებმა, რომლებშიც Lorem Ipsum-ის სხვადასხვა ვერსიები იყო ჩაშენებული.</p>

<h2>რატომ ვიყენებთ მას?</h2>

<p>ცნობილი ფაქტია, რომ გვერდის წაკითხვად შიგთავსს შეუძლია მკითხველის ყურადღება მიიზიდოს და დიზაინის აღქმაში ხელი შეუშალოს. Lorem Ipsum-ის გამოყენებით ვღებულობთ იმაზე მეტ-ნაკლებად სწორი გადანაწილების ტექსტს, ვიდრე ერთიდაიგივე გამეორებადი სიტყვებია ხოლმე. შედეგად, ტექსტი ჩვეულებრივ ინგლისურს გავს, მისი წაითხვა კი შეუძლებელია. დღეს უამრავი პერსონალური საგამომცემლო პროგრამა და ვებგვერდი იყენებს Lorem Ipsum-ს, როგორც დროებით ტექსტს წყობის შესავსებად; Lorem Ipsum-ის მოძებნისას კი საძიებო სისტემები ბევრ დაუსრულებელ გვერდს გვიჩვენებენ. წლების მანძილზე ამ ტექსტის უამრავი ვერსია გამოჩნდა, ზოგი შემთხვევით დაშვებული შეცდომის გამო, ზოგი კი &mdash; განზრახ, ხუმრობით.</p>

<p>&nbsp;</p>

<h2>საიდან მოდის ეს ტექსტი?</h2>

<p>გავრცელებული მოსაზრებით, Lorem Ipsum შემთხვევითი ტექსტი სულაც არაა. მისი ფესვები ჯერკიდევ ჩვ. წ. აღ-მდე 45 წლის დროინდელი კლასიკური ლათინური ლიტერატურიდან მოდის. ვირჯინიის შტატში მდებარე ჰემპდენ-სიდნეის კოლეჯის პროფესორმა რიჩარდ მაკკლინტოკმა აიღო ერთ-ერთი ყველაზე იშვიათი ლათინური სიტყვა &quot;consectetur&quot; Lorem Ipsum-პასაჟიდან და გადაწყვიტა მოეძებნა იგი კლასიკურ ლიტერატურაში. ძიება შედეგიანი აღმოჩნდა &mdash; ტექსტი Lorem Ipsum გადმოწერილი ყოფილა ციცერონის &quot;de Finibus Bonorum et Malorum&quot;-ის 1.10.32 და 1.10.33 თავებიდან. ეს წიგნი ეთიკის თეორიის ტრაქტატია, რომელიც რენესანსის პერიოდში ძალიან იყო გავრცელებული. Lorem Ipsum-ის პირველი ხაზი, &quot;Lorem ipsum dolor sit amet...&quot; სწორედ ამ წიგნის 1.10.32 თავიდანაა.</p>

<p>მათთვის, ვისაც აინტერესებს, ქვევით მოყვანილია Lorem Ipsum-ის ორიგინალი ნაწყვეტი 1500-იანი წლებიდან. ასევე შეგიძლიათ ნახოთ 1.10.32 და 1.10.33 თავები ციცერონის &quot;de Finibus Bonorum et Malorum&quot;-დან, რომელსაც თან ერთვის 1914 წელს ჰ. რექჰამის შესრულებული ინგლისურენოვანი თარგმანი.</p>
', N'Lorem-Ipsum-4', 10000, 38, 85, 0, CAST(N'2021-03-28T16:26:41.0000000+07:00' AS DateTimeOffset), N'admin', CAST(N'2021-03-28T16:26:55.6124737+07:00' AS DateTimeOffset), N'admin')
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (1, N'Home', N'/', 1, NULL, N'_self', CAST(N'2019-05-27T16:17:45.0000000+07:00' AS DateTimeOffset), NULL, CAST(N'2021-01-10T23:26:55.3876956+07:00' AS DateTimeOffset), N'admin', 0)
INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (2, N'Introduce', N'/gioi-thieu', 2, NULL, N'_self', NULL, NULL, CAST(N'2021-01-10T23:27:08.0919353+07:00' AS DateTimeOffset), N'admin', 0)
INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (3, N'News', N'/tin-tuc', 3, NULL, N'_self', NULL, NULL, CAST(N'2021-01-10T23:27:20.4403887+07:00' AS DateTimeOffset), N'admin', 0)
INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (4, N'Insurrance', N'/tat-ca-san-pham', 4, NULL, N'_self', NULL, NULL, CAST(N'2021-01-10T23:27:34.8990192+07:00' AS DateTimeOffset), N'admin', 0)
INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (5, N'Contact', N'#', 5, NULL, N'_self', NULL, NULL, CAST(N'2021-01-10T23:27:46.7779302+07:00' AS DateTimeOffset), N'admin', 1)
INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (15, N'Contact information', N'#Contact', 1, 5, N'_self', NULL, NULL, CAST(N'2021-01-10T23:27:57.2190303+07:00' AS DateTimeOffset), N'admin', 1)
INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (16, N'Feedback', N'/gop-y', 2, 5, N'_self', NULL, NULL, CAST(N'2021-01-10T23:28:13.6768514+07:00' AS DateTimeOffset), N'admin', 1)
INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (18, N'Feedback from customers', N'/phan-hoi-y-kien-khach-hang', 3, 5, N'_self', NULL, NULL, CAST(N'2021-01-10T23:28:27.1752033+07:00' AS DateTimeOffset), N'admin', 1)
INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (20, N'Khuyến mãi', N'/loai-tin-tuc/khuyen-mai/a2b988e6-9053-4c9d-b6fb-5ade0e050d18', 1, 3, N'_self', CAST(N'2019-06-09T17:13:06.0990506+07:00' AS DateTimeOffset), N'admin', NULL, NULL, 1)
INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (21, N'Event', N'/loai-tin-tuc/su-kien/9d1fdd2c-e06d-402b-87de-f8746537bdbf', 2, 3, N'_self', CAST(N'2019-06-09T17:18:30.0000000+07:00' AS DateTimeOffset), N'admin', CAST(N'2021-01-18T00:53:36.7956369+07:00' AS DateTimeOffset), N'admin', 1)
INSERT [dbo].[Menu] ([Id], [MenuName], [Link], [DisplayOrder], [ParentId], [Target], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (22, N'Customer care', N'/loai-tin-tuc/cham-soc-khach-hang/c787ffc1-f333-484e-b176-c76d5c3d85a7', 3, 3, N'_self', CAST(N'2019-06-09T17:20:35.0000000+07:00' AS DateTimeOffset), N'admin', CAST(N'2021-01-18T00:53:57.4164310+07:00' AS DateTimeOffset), N'admin', 1)
SET IDENTITY_INSERT [dbo].[Menu] OFF
INSERT [dbo].[News] ([Id], [Name], [Summary], [MetaTitle], [Description], [UrlImage], [NewsCategoryId], [Warranty], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tag], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'f11b09ac-0959-4d99-a18e-1b4a3739f310', N'WHITE VALENTINE TRẮNG - ĐÁP TRẢ YÊU THƯƠNG - GIẢM GIÁ LÊN ĐẾN 15%', N'Dường như ngày Valentine Đỏ (14/2) ngọt ngào vẫn chưa đủ với những con tim đang yêu.Vì vậy, Valentine Trắng để tỏ tình cảm với người thương yêu mình.', N'white-valentine-trang-dap-tra-yeu-thuong-giam-gia-len-den-15', N'<p style="text-align:center"><strong>WHITE VALENTINE DAY - Đ&Aacute;P TRẢ Y&Ecirc;U THƯƠNG</strong></p>

<p style="text-align:center">___________________________</p>

<p>&nbsp;</p>

<p style="text-align:center"><img alt="" src="https://streetstyle.vn/images/companies/1/14.3%20wed%20%281%29.png" style="width:500px" /></p>

<p>&nbsp;</p>

<p>Dường như ng&agrave;y&nbsp;Valentine Đỏ (14/2)&nbsp;ngọt ng&agrave;o vẫn chưa đủ với những con tim đang y&ecirc;u.V&igrave; vậy,&nbsp;Valentine Trắng&nbsp;để tỏ t&igrave;nh cảm với người thương y&ecirc;u m&igrave;nh.<br />
<br />
Hiểu được điều đ&oacute;&nbsp;<strong>STREETSTYLE.VN</strong>&nbsp;mang đến chương tr&igrave;nh&nbsp;&quot;Đ&Aacute;P TRẢ Y&Ecirc;U THƯƠNG&quot;&nbsp;như sau:<br />
<br />
<strong>GIẢM 5%</strong>&nbsp;khi mua&nbsp;<strong>1&nbsp;Đ&Ocirc;I GI&Agrave;Y</strong><br />
<br />
<strong>GIẢM 10%</strong>&nbsp;khi mua&nbsp;<strong>2 Đ&Ocirc;I GI&Agrave;Y TRỞ L&Ecirc;N</strong>&nbsp;+&nbsp;<strong>FREESHIP.</strong><br />
<br />
<strong>LƯU &Yacute; :</strong>&nbsp;<strong>CỘNG DỒN TH&Ecirc;M % T&Iacute;CH LŨY CỦA TH&Agrave;NH VI&Ecirc;N</strong><br />
<br />
&Aacute;p dụng cho c&aacute;c bạn mua&nbsp;<strong>ONLINE</strong>&nbsp;c&aacute;c sản phẩm sau đ&acirc;y:</p>

<p><br />
<strong>VANS OLD SHOOL ALL WHITE ; FILA ALL WHITE v&agrave; STANMITH ALL WHITE.</strong><br />
<br />
<strong>THỜI GIAN DIỄN RA:&nbsp;13/03/2019 - 15/03/2019.</strong><br />
<br />
NHANH TAY ĐẶT H&Agrave;NG NGAY&nbsp;để&nbsp;NHẬN NGAY ƯU Đ&Atilde;I STREETSTYLE.VN&nbsp;v&agrave; đ&aacute;p trả lại t&igrave;nh y&ecirc;u của người y&ecirc;u m&igrave;nh nh&eacute; c&aacute;c bạn eyyyyy.</p>
', N'/Content/Data/files/14_3%20wed%20(1).png', N'a2b988e6-9053-4c9d-b6fb-5ade0e050d18', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-06-07T22:46:33.0000000+07:00' AS DateTimeOffset), N'admin', CAST(N'2019-06-07T22:49:31.9041970+07:00' AS DateTimeOffset), N'admin', 1)
INSERT [dbo].[News] ([Id], [Name], [Summary], [MetaTitle], [Description], [UrlImage], [NewsCategoryId], [Warranty], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tag], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'0dee53ce-3b1c-49be-a043-4257239c996f', N'Insurance premium revenue for the whole market in 2020 is estimated to increase by 17%.', N'Insurance premium revenue for the whole market in 2020 is estimated to increase by 17%.', N'A-c-t', N'<p>According to data from the General Statistics Office, by 2020, the insurance business will develop stably and safely in the context of complicated epidemics.</p>

<p>Insurance premium revenue in the fourth quarter of 2020 was estimated to increase by 16% over the same period last year, of which insurance premium revenue in life increased by 20%, non-life insurance by 7%; It is estimated that the whole year 2020 premium revenue of the whole insurance market will increase by 17% over the previous year, of which insurance premium revenue in the life sector will increase by 21%; non-life insurance increased by 7%.</p>

<p>By the end of November 2020, the market had 69 insurance businesses, including 18 life insurers, 31 non-life insurers, 2 reinsurance businesses and 18 environmental enterprises. insurance circles; total corporate assets reached 542.8 trillion dong, up 20% over the same period in 2019; insurance businesses investing back into the economy reached 449.4 trillion dong, up 22%.</p>
', N'/Content/Data/files/bao-hiem_165997_thumb.jpg', N'c787ffc1-f333-484e-b176-c76d5c3d85a7', NULL, N'y-u-i', NULL, NULL, NULL, NULL, CAST(N'2019-06-06T12:57:16.0000000+07:00' AS DateTimeOffset), N'admin', CAST(N'2021-01-18T01:07:14.4520965+07:00' AS DateTimeOffset), N'admin', 0)
INSERT [dbo].[News] ([Id], [Name], [Summary], [MetaTitle], [Description], [UrlImage], [NewsCategoryId], [Warranty], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tag], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'8d6c4773-7233-49d1-8902-524bc4bc6238', N'Low interest rates are the biggest challenge for the insurance industry in 2021', N'Low interest rates are the biggest challenge for the insurance industry in 2021', N'Lai-suat-thap', N'<p>SSI Research assessed that the low interest rate environment will make investment profits difficult and reduce the profits of insurance companies because most of the investment portfolio of insurance companies is in bank deposits and Government bonds.</p>

<p>Better fee revenue growth in 2021</p>

<p>SSI Research expects higher growth of original insurance premium revenue by 2021 for both the life and non-life insurance segments by 22% and 10-12% yoy, respectively. This estimate is based on 2 points of view.</p>

<p>The first is that the demand for life insurance products is decent and thanks to newly signed exclusive banca contracts, insurance companies can access a larger pool of potential customers. In the event that Covid-19 epidemic is controlled and there is no social gap, sales activities (meetings, customer conferences ...) will be able to recover to the level before Covid, promoting activities. sales are stronger.</p>

<p>Second, economic recovery promotes non-life insurance. SSI Research expects GDP growth to return to 6.5% by 2021 as economic activity recovers. Consequently, cargo, aviation, travel and credit security will be able to achieve growth before Covid.</p>

<p>The expansion of managed assets (AUM) will be the main driver of profit growth for insurance companies in 2021.</p>

<p>SSI Research does not expect earnings growth to be equivalent to premium revenue growth, as earnings-enhancing factors in 2020 are active equity markets and improved claims rates may not be repeated. 2021. The 2021 average interest rate is estimated to be 75-85 bps lower than the 2020 average, so growth in financial income will be entirely dependent on AUM expansion.</p>

<p>Some structural changes will continue in 2021</p>

<p>SSI Research estimates that online sales will increase. However, this channel is only suitable for certain segments (personal accident insurance, compulsory motorcycle insurance, travel insurance). In addition, insurance companies can develop a range of health insurance products with more options and to satisfy a wider range of customers.</p>

<p>Risks from low interest rate environment and rising reinsurance costs</p>

<p>A low interest rate environment will make investment returns difficult and reduce the profits of insurance companies as the majority of the insurance companies&#39; portfolios are in bank deposits and government bonds. In addition, if government bond yields fall further, the burden will be on technical provisions for life insurance - negatively affecting accounting returns.</p>

<p>Increasing reinsurance costs: In recent years, high losses by Vietnamese insurance companies, especially in the property insurance sector, have prompted international reinsurers to increase reinsurance prices.</p>

<p>SSI Research believes that this trend will continue in the medium term. An important consequence of this is that insurers may not be able to maintain treaty contracts and are forced to switch to facultative contracts, affecting their capacity to non-life insurance.</p>
', N'/Content/Data/files/ssi-du-bao-bao-hiem-2021_84866_thumb.png', N'9d1fdd2c-e06d-402b-87de-f8746537bdbf', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-06-07T22:44:24.0000000+07:00' AS DateTimeOffset), N'admin', CAST(N'2021-01-18T01:05:14.1766131+07:00' AS DateTimeOffset), N'admin', 0)
INSERT [dbo].[News] ([Id], [Name], [Summary], [MetaTitle], [Description], [UrlImage], [NewsCategoryId], [Warranty], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tag], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'bf7bbebb-a4e8-41fb-b1df-7a3492d72d57', N'Shop off lúc 19h ngày 15/12 cổ vũ đội tuyển Việt Nam', N'\ Shop Off Từ 19h Đêm Nay \  vì... đêm nay "Bão" lớn sẽ về  #19h30 tối nay, #No_Job, #No_Love, #No_problem, tất cả cùng hướng về đội tuyển Việt Nam cùng trận cuối cùng tại AFFcup2018', N'shop-off-luc-19h-ngay-15-12-co-vu-doi-tuyen-viet-nam', N'<p>\ Shop Off Từ 19h Đ&ecirc;m Nay \</p>

<p>v&igrave;... đ&ecirc;m nay &quot;B&atilde;o&quot; lớn sẽ về</p>

<p><a href="https://www.facebook.com/hashtag/19h30?source=feed_text&amp;epa=HASHTAG&amp;__xts__%5B0%5D=68.ARAYOHxm0WFgxLVlwNi-5p3Td44BN80n_ERRfAIJmJVdgm_dkZlSGel0k1WqM5Q5xs-DsPxGCzwoOmribhLbkyBpsLwMQkEmL3JCIAnZybt-gpjwwYgLVCwAoTKtg0pdz8ovqFVWQKXWIBf__Qj-ghCWLCXjd62PncKtLxLcbbGTmkElKPIoBWP3rwzq9_WCGkz5nWRPWeWmQvt6qKHQlt-TAKWVMfdCrgIs7HWWmR2xULsGP7Grq8qvUpru4hhDqjmm1gMOyrWew31t-WKSTbHpLqWk8tB7R0sAwm7Q3zmxezgGT9_r8beVIdzDPQM3zyBdI-5RIegzEzyK_WBYkX4CsmC-1P_SXdNb-Qkae-EwAzTPwTFXriC2VNWrgMkhL3UWkwDLMlw4hlItfYnIb1hxRHRWfPY5SDHaEU63qf7opmo&amp;__tn__=%2ANK-R">#19h30</a>&nbsp;tối nay,&nbsp;<a href="https://www.facebook.com/hashtag/no_job?source=feed_text&amp;epa=HASHTAG&amp;__xts__%5B0%5D=68.ARAYOHxm0WFgxLVlwNi-5p3Td44BN80n_ERRfAIJmJVdgm_dkZlSGel0k1WqM5Q5xs-DsPxGCzwoOmribhLbkyBpsLwMQkEmL3JCIAnZybt-gpjwwYgLVCwAoTKtg0pdz8ovqFVWQKXWIBf__Qj-ghCWLCXjd62PncKtLxLcbbGTmkElKPIoBWP3rwzq9_WCGkz5nWRPWeWmQvt6qKHQlt-TAKWVMfdCrgIs7HWWmR2xULsGP7Grq8qvUpru4hhDqjmm1gMOyrWew31t-WKSTbHpLqWk8tB7R0sAwm7Q3zmxezgGT9_r8beVIdzDPQM3zyBdI-5RIegzEzyK_WBYkX4CsmC-1P_SXdNb-Qkae-EwAzTPwTFXriC2VNWrgMkhL3UWkwDLMlw4hlItfYnIb1hxRHRWfPY5SDHaEU63qf7opmo&amp;__tn__=%2ANK-R">#No_Job</a>,&nbsp;<a href="https://www.facebook.com/hashtag/no_love?source=feed_text&amp;epa=HASHTAG&amp;__xts__%5B0%5D=68.ARAYOHxm0WFgxLVlwNi-5p3Td44BN80n_ERRfAIJmJVdgm_dkZlSGel0k1WqM5Q5xs-DsPxGCzwoOmribhLbkyBpsLwMQkEmL3JCIAnZybt-gpjwwYgLVCwAoTKtg0pdz8ovqFVWQKXWIBf__Qj-ghCWLCXjd62PncKtLxLcbbGTmkElKPIoBWP3rwzq9_WCGkz5nWRPWeWmQvt6qKHQlt-TAKWVMfdCrgIs7HWWmR2xULsGP7Grq8qvUpru4hhDqjmm1gMOyrWew31t-WKSTbHpLqWk8tB7R0sAwm7Q3zmxezgGT9_r8beVIdzDPQM3zyBdI-5RIegzEzyK_WBYkX4CsmC-1P_SXdNb-Qkae-EwAzTPwTFXriC2VNWrgMkhL3UWkwDLMlw4hlItfYnIb1hxRHRWfPY5SDHaEU63qf7opmo&amp;__tn__=%2ANK-R">#No_Love</a>,&nbsp;<a href="https://www.facebook.com/hashtag/no_problem?source=feed_text&amp;epa=HASHTAG&amp;__xts__%5B0%5D=68.ARAYOHxm0WFgxLVlwNi-5p3Td44BN80n_ERRfAIJmJVdgm_dkZlSGel0k1WqM5Q5xs-DsPxGCzwoOmribhLbkyBpsLwMQkEmL3JCIAnZybt-gpjwwYgLVCwAoTKtg0pdz8ovqFVWQKXWIBf__Qj-ghCWLCXjd62PncKtLxLcbbGTmkElKPIoBWP3rwzq9_WCGkz5nWRPWeWmQvt6qKHQlt-TAKWVMfdCrgIs7HWWmR2xULsGP7Grq8qvUpru4hhDqjmm1gMOyrWew31t-WKSTbHpLqWk8tB7R0sAwm7Q3zmxezgGT9_r8beVIdzDPQM3zyBdI-5RIegzEzyK_WBYkX4CsmC-1P_SXdNb-Qkae-EwAzTPwTFXriC2VNWrgMkhL3UWkwDLMlw4hlItfYnIb1hxRHRWfPY5SDHaEU63qf7opmo&amp;__tn__=%2ANK-R">#No_problem</a>, tất cả c&ugrave;ng hướng về đội tuyển Việt Nam c&ugrave;ng trận cuối c&ugrave;ng tại AFFcup2018</p>

<p>&nbsp;</p>

<p style="text-align:center"><img alt="" src="https://streetstyle.vn/images/companies/1/Vi%E1%BB%87t%20Nam%20v%C3%B4%20%C4%91%E1%BB%8Bch%20AFFcup%202018.jpg" style="width:500px" /></p>

<p>Nhớ m&atilde;i cảm gi&aacute;c đ&oacute; từ năm 2008&nbsp;<img alt="" src="https://static.xx.fbcdn.net/images/emoji.php/v9/tf3/1.5/16/2764.png" style="height:16px; width:16px" /></p>

<p>Ch&uacute;c Việt Nam đ&ecirc;m nay kh&ocirc;ng ngủ như 10 năm trước&nbsp;</p>
', N'/Content/Data/files/Vi%E1%BB%87t%20Nam%20v%C3%B4%20%C4%91%E1%BB%8Bch%20AFFcup%202018.jpg', N'9d1fdd2c-e06d-402b-87de-f8746537bdbf', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-06-07T22:48:05.0000000+07:00' AS DateTimeOffset), N'admin', CAST(N'2019-06-07T22:49:00.2609067+07:00' AS DateTimeOffset), N'admin', 1)
INSERT [dbo].[News] ([Id], [Name], [Summary], [MetaTitle], [Description], [UrlImage], [NewsCategoryId], [Warranty], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tag], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'5bfd24f1-e085-49ff-abbd-e6bf4887042f', N'TƯNG BỪNG CHÀO HÈ', N'Khi mua hàng tại StreetStyle.vn sẽ được giảm giá 10% giày và 15% cho quần áo.  Áp dụng cho cả ONLINE và OFFLINE.', N'tung-bung-chao-he-freestyle', N'<p><strong>StreetStyle.vn xin gửi đến c&aacute;c bạn chương tr&igrave;nh&nbsp;TƯNG BỪNG CH&Agrave;O H&Egrave;&nbsp;như sau:</strong></p>

<p><img alt="" src="https://streetstyle.vn/images/companies/1/ch%C3%A0o%20h%C3%A8.png" style="width:500px" /></p>

<p>Khi mua h&agrave;ng tại&nbsp;<strong>StreetStyle.vn</strong>&nbsp;sẽ được giảm gi&aacute; 10% gi&agrave;y v&agrave; 15% cho quần &aacute;o.</p>

<p>&Aacute;p dụng cho cả&nbsp;ONLINE&nbsp;v&agrave;&nbsp;OFFLINE.<br />
<br />
Chương tr&igrave;nh k&eacute;o d&agrave;i&nbsp;<strong>từ&nbsp;21/05/2019 đến hết 30/5/2019</strong><br />
<br />
C&aacute;c bạn xem ch&iacute;nh s&aacute;ch TH&Agrave;NH VI&Ecirc;N của shop tại đ&acirc;y nh&eacute;:&nbsp;<a href="https://streetstyle.vn/chuong-trinh-khuyen-mai/sinh-nhat-ban-duoc-giam-10-15.html?fbclid=IwAR0azgbRV5YdXbt8yCx2z0XRtoplK4cS-YPkJH3E8PO0DtiBC0Hx3Gof6xA">https://streetstyle.vn/chuong-trinh-khuyen-mai/sinh-nhat-ban-duoc-giam-10-15.html?fbclid=IwAR0azgbRV5YdXbt8yCx2z0XRtoplK4cS-YPkJH3E8PO0DtiBC0Hx3Gof6xA</a><br />
<br />
Chương tr&igrave;nh Freeship COD TO&Agrave;N QUỐC với đơn h&agrave;ng từ 500k. V&agrave; qu&agrave; tặng vớ StreetStyle, m&oacute;c kho&aacute; sneaker k&egrave;m gi&agrave;y từ 500k vẫn được &aacute;p dụng b&igrave;nh thường.<br />
<br />
Cảm ơn c&aacute;c bạn gần xa đ&atilde; lu&ocirc;n đồng h&agrave;nh v&agrave; ủng hộ&nbsp;<strong>StreetStyle.vn</strong>&nbsp;trong suốt thời gian qua.</p>
', N'/Content/Data/files/ch%C3%A0o%20h%C3%A8.png', N'a2b988e6-9053-4c9d-b6fb-5ade0e050d18', NULL, N'tung-bung-chao-he-freestyle', NULL, NULL, NULL, NULL, CAST(N'2019-06-07T22:41:28.0000000+07:00' AS DateTimeOffset), N'admin', CAST(N'2019-06-07T22:42:54.6196845+07:00' AS DateTimeOffset), N'admin', 1)
INSERT [dbo].[News] ([Id], [Name], [Summary], [MetaTitle], [Description], [UrlImage], [NewsCategoryId], [Warranty], [MetaKeywords], [MetaDescriptions], [TopHot], [ViewCount], [Tag], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'6e3a0fa5-b167-45e2-9039-fd4debea35e3', N'Tổng hợp mẹo bảo quản giày vào mùa mưa', N'Mùa mưa chắc hẳn là  kẻ thù lớn nhất của những đôi sneaker, nhất là tại Việt Nam khi mà thời tiết thay đổi thất thường lúc mưa lúc nắng không biết đâu mà lần. Và đặc biệt những cơn mưa dù là nhỏ đi nữa cũng đủ làm cho đôi giày của bạn vấy bẩn (nhất là những đôi giày trắng) và có mùi hôi khó chịu nếu không vệ sinh đúng cách và kịp thời.', N'tong-hop-meo-bao-quan-giay-vao-mua-mua', N'<p>M&ugrave;a mưa chắc hẳn l&agrave;&nbsp; kẻ th&ugrave; lớn nhất của những đ&ocirc;i sneaker, nhất l&agrave; tại Việt Nam khi m&agrave; thời tiết thay đổi thất thường l&uacute;c mưa l&uacute;c nắng kh&ocirc;ng biết đ&acirc;u m&agrave; lần. V&agrave; đặc biệt những cơn mưa d&ugrave; l&agrave; nhỏ đi nữa cũng đủ l&agrave;m cho đ&ocirc;i gi&agrave;y của bạn vấy bẩn (nhất l&agrave; những đ&ocirc;i gi&agrave;y trắng) v&agrave; c&oacute; m&ugrave;i h&ocirc;i kh&oacute; chịu nếu kh&ocirc;ng vệ sinh đ&uacute;ng c&aacute;ch v&agrave; kịp thời.</p>

<p>Kh&oacute; khăn l&agrave; thế nhưng những cơn mưa kh&ocirc;ng thể giết chết nềm ham th&iacute;ch với những đ&ocirc;i gi&agrave;y của ch&uacute;ng ta phải kh&ocirc;ng n&agrave;o? Nếu bạn vẫn muốn diện sneaker v&agrave;o m&ugrave;a mưa n&agrave;y th&igrave; h&atilde;y &aacute;p dụng ngay những mẹo sau của&nbsp;<strong><a href="https://www.facebook.com/StreetStyleStorevn/?ref=br_rs">StreetStyle.vn</a></strong>&nbsp;nh&eacute;.</p>

<p><strong>1. Hạn chế mang gi&agrave;y l&agrave;m bằng da lộn</strong></p>

<p style="text-align:center"><strong>&nbsp;<img alt="" src="https://streetstyle.vn/images/companies/1/rain-shoes-1519620455.jpg" style="width:600px" /></strong></p>

<p>Trong số c&aacute;c chất liệu sử dụng để l&agrave;m sneaker th&igrave; kẻ th&ugrave; lớn nhất của nước ch&iacute;nh l&agrave; da lộn. Khi tiếp x&uacute;c với nước, bề mặt da lộn rất dễ bị bị x&ugrave; l&ocirc;ng, kh&ocirc;ng th&igrave; cũng cứng v&agrave; bay m&agrave;u. &Ocirc;ng b&agrave; ta c&oacute; c&acirc;u &ldquo;ph&ograve;ng bệnh hơn chữa bệnh&rdquo;, thay v&igrave; phải đắng đo l&agrave;m sao để giữ cho gi&agrave;y da lộn sạch khi đi mưa th&igrave; ch&uacute;ng ta c&oacute; thể đơn giản l&agrave; kh&ocirc;ng mang ch&uacute;ng ra đường v&agrave;o m&ugrave;a n&agrave;y.</p>

<p><strong>2. N&ecirc;n chọn những đ&ocirc;i gi&agrave;y c&oacute; chất liệu Gore-Tex v&agrave; một số loại gi&agrave;y thiết kế chuy&ecirc;n dụng cho m&ugrave;a mưa</strong></p>

<p>Tr&aacute;i ngược với da lộn Gore-Tex l&agrave; một chất liệu đặc biệt với khả năng chống nước v&agrave; bền tuyệt đối, cho n&ecirc;n việc mang những đ&ocirc;i gi&agrave;y l&agrave;m bằng chất liệu n&agrave;y v&agrave;o những ng&agrave;y mưa sẽ kh&ocirc;ng phải l&agrave; vấn đề.</p>

<p>Tuy nhi&ecirc;n đừng lội nước qu&aacute; s&acirc;u v&igrave; gi&agrave;y kh&ocirc;ng thể chống nước khi nước lọt v&agrave;o cổ gi&agrave;y. V&agrave; tất nhi&ecirc;n nước kh&ocirc;ng v&agrave;o được th&igrave; cũng sẽ kh&ocirc;ng tho&aacute;t ra được, nếu để những đ&ocirc;i gi&agrave;y đ&oacute; v&ocirc; nước th&igrave; sẽ rất kh&oacute; chịu v&igrave; phải mang theo một đống nước tr&ecirc;n ch&acirc;n. Converse Rubber hay Vans trong bộ sưu tập All Weather MTE cũng l&agrave; một trong những lựa chọn hợp l&yacute; cho m&ugrave;a mưa ngập lụt n&agrave;y đấy.</p>

<p><strong>3. Sử dụng&nbsp;</strong><strong><a href="https://streetstyle.vn/xit-nano-protector-400ml-vi.html">chai xịt chống nước</a></strong><strong>:</strong></p>

<p style="text-align:center"><strong>&nbsp;<img alt="" src="https://streetstyle.vn/images/companies/1/IMG_1144.jpg" style="width:600px" /></strong></p>

<p>Tất nhi&ecirc;n kh&ocirc;ng phải đ&ocirc;i gi&agrave;y n&agrave;o cũng l&agrave;m bằng chất liệu chống nước v&agrave; cũng kh&ocirc;ng phải đ&ocirc;i gi&agrave;y chống nước n&agrave;o cũng l&agrave;m bạn y&ecirc;u th&iacute;ch v&agrave; sẵn s&agrave;n m&oacute;c hầu bao. Trong trường hợp gi&agrave;y của bạn kh&ocirc;ng c&oacute; khả năng chống nước th&igrave; việc sử dụng c&aacute;c loại xịt chống nước (phủ nano) l&agrave; việc cần l&agrave;m khi di chuyển dưới mưa. Một số sản phẩm nổi bật l&agrave; Repel của Jason Markk hay Crep Protect. Nguy&ecirc;n tắc hoạt động chung của c&aacute;c loại xịt n&agrave;y l&agrave; tạo ra một lớp m&agrave;ng nano bảo vệ cho lớp chất liệu b&ecirc;n dưới n&oacute;.</p>

<p>&nbsp;</p>

<p><strong>4. Lu&ocirc;n thủ sẵn D&eacute;p + t&uacute;i nilong:</strong></p>

<p style="text-align:center"><img alt="" src="https://streetstyle.vn/images/companies/1/d%C3%A9p.jpg" style="width:600px" /></p>

<p>D&ugrave; l&agrave; sản phẩm sịt chống nước của h&atilde;ng n&agrave;o đi nữa th&igrave; cũng c&oacute; một số khuyết điểm nhỏ. Chẳng hạn như kh&ocirc;ng thể chống nước ở phần cổ gi&agrave;y chẳng hạn. Trong trường hợp mưa qu&aacute; to, đi k&egrave;m với ngập lụt, h&atilde;y lu&ocirc;n thủ sẵn theo b&ecirc;n m&igrave;nh một đ&ocirc;i d&eacute;p nhẹ để thay ra khi cần v&agrave; d&ugrave;ng t&uacute;i nilong để bỏ gi&agrave;y v&agrave;o.</p>

<p><strong>5. Vệ sinh gi&agrave;y ngay sau khi đi mưa về</strong></p>

<p>Nếu như bạn đ&atilde; l&agrave;m mọi c&aacute;ch để bảo vệ đ&ocirc;i gi&agrave;y th&acirc;n y&ecirc;u của m&igrave;nh nhưng ch&uacute;ng vẫn bị bẩn th&igrave; điều bạn cần quan t&acirc;m tiếp theo đ&oacute; l&agrave; c&aacute;ch vệ sinh. Gi&agrave;y cần phải được v&ecirc; sinh ngay sau khi đi mưa về bởi v&igrave; nước mưa kh&aacute; bẩn, dễ d&agrave;ng g&acirc;y ẩm mốc cho đ&ocirc;i sneaker của bạn nếu để l&acirc;u. Đặc biệt l&agrave; c&aacute;c chất liệu primeknit hay flyknit rất thấm nước v&agrave; cực k&igrave; kị bị lội nước.</p>

<p>Nếu gi&agrave;y bạn sử dụng đế Boost hay bất cứ đế n&agrave;o kh&aacute;c m&agrave;u trắng, h&atilde;y nhanh ch&oacute;ng lau kh&ocirc; ch&uacute;ng v&igrave; gặp nước đế Boost rất dễ bị v&agrave;ng.</p>

<p>Sau khi vệ sinh xong h&atilde;y phơi gi&agrave;y nơi tho&aacute;ng m&aacute;t để gi&agrave;y mau kh&ocirc;, tuyệt đối kh&ocirc;ng phơi dưới nắng v&igrave; nắng sẽ l&agrave;m hư chất liệu đ&ocirc;i gi&agrave;y của bạn (thật ra th&igrave; m&ugrave;a mưa cũng chả mấy khi c&oacute; nắng).</p>

<p><strong>6. Bảo quản gi&agrave;y ở nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t</strong></p>

<p>Kh&ocirc;ng chỉ c&oacute; nước mưa m&agrave; những nơi tối, thiếu &aacute;nh s&aacute;ng hoặc ẩm ướt trong nh&agrave; cũng l&agrave; một trong những nguy&ecirc;n nh&acirc;n khiến đ&ocirc;i gi&agrave;y y&ecirc;u dấu của bạn mau ch&oacute;ng &ldquo;xuống cấp&rdquo;. Kh&ocirc;ng những thế, v&agrave;o những ng&agrave;y mưa sẽ c&oacute; nhiều nơi trong nh&agrave; bạn trở n&ecirc;n ẩm hơn, c&aacute;c bạn cần ch&uacute; &yacute; thật cẩn thận để lựa chọn nơi để gi&agrave;y v&agrave;o m&ugrave;a n&agrave;y. H&atilde;y tr&aacute;nh xa những chỗ bị ngập hoặc dột ra v&igrave; đ&oacute; l&agrave; c&aacute;ch nhanh nhất để ph&aacute; hỏng đ&ocirc;i gi&agrave;y của c&aacute;c bạn.</p>
', N'/Content/Data/files/rain-shoes-1519620455.jpg', N'c787ffc1-f333-484e-b176-c76d5c3d85a7', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-06-06T13:06:58.0000000+07:00' AS DateTimeOffset), N'admin', CAST(N'2019-06-07T21:37:21.6947954+07:00' AS DateTimeOffset), N'admin', 1)
INSERT [dbo].[NewsCategory] ([Id], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [MetaKeywords], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'a2b988e6-9053-4c9d-b6fb-5ade0e050d18', N'Highlights', N'High-lights', NULL, 1, N'High-lights', N'High-lights', CAST(N'2019-06-06T12:35:39.0000000+07:00' AS DateTimeOffset), N'admin', CAST(N'2021-01-18T01:01:40.9382736+07:00' AS DateTimeOffset), N'admin', 0)
INSERT [dbo].[NewsCategory] ([Id], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [MetaKeywords], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'c787ffc1-f333-484e-b176-c76d5c3d85a7', N'Customer care', N'cham-soc-khach-hang', NULL, 3, N'cham-soc-khach-hang', N'cham-soc-khach-hang', CAST(N'2019-06-06T12:36:29.0000000+07:00' AS DateTimeOffset), N'admin', CAST(N'2021-01-18T01:00:40.3050277+07:00' AS DateTimeOffset), N'admin', 0)
INSERT [dbo].[NewsCategory] ([Id], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [MetaKeywords], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'9d1fdd2c-e06d-402b-87de-f8746537bdbf', N'Event', N'su-kien', NULL, 2, N'su-kien', N'su-kien', CAST(N'2019-06-06T12:36:06.0000000+07:00' AS DateTimeOffset), N'admin', CAST(N'2021-01-18T01:00:49.1073186+07:00' AS DateTimeOffset), N'admin', 0)
INSERT [dbo].[Registration_Insurance] ([Id], [InsurranceId], [UserId], [FullName], [DateOfBirth], [Address], [Phone], [Email], [LicensePlate], [VehicleRate], [RangeOfVehicle], [RegistrationDate], [ExpirationDate], [TotalMoney], [CMND], [Status], [RegistrationInsuranceCode], [ModifiedBy], [ModifiedOn]) VALUES (N'b8437348-65a5-4925-816b-15b26d2dc6ed', N'd72cea5c-92b2-4f03-a4a5-a0aa1a6be59c', N'f51b6b74-6f9a-466e-8b7a-539bf0c5c6f1', N'Le quoc Cong ', CAST(N'2021-03-31' AS Date), N'đsf', N'869-968-9658', N'duachutthoinhe1234@gmail.com', N'856', 21, N'25', CAST(N'2021-03-31 15:51:17.000' AS DateTime), CAST(N'2022-03-31 15:51:17.000' AS DateTime), 1050000000, N'236252125', N'unconfimred', N'31/03/2021 3:51:17 CH2362521251050000000', N'test3', CAST(N'2021-03-31T15:51:18.9105042+07:00' AS DateTimeOffset))
INSERT [dbo].[Registration_Insurance] ([Id], [InsurranceId], [UserId], [FullName], [DateOfBirth], [Address], [Phone], [Email], [LicensePlate], [VehicleRate], [RangeOfVehicle], [RegistrationDate], [ExpirationDate], [TotalMoney], [CMND], [Status], [RegistrationInsuranceCode], [ModifiedBy], [ModifiedOn]) VALUES (N'0b2fdc80-5556-464a-8529-5738a5ea5984', N'd72cea5c-92b2-4f03-a4a5-a0aa1a6be59c', N'0ef711e7-7200-4214-b81d-e090ab3ca926', N'nguyen van a', CAST(N'2021-04-01' AS Date), N'123 abc', N'058-965-8554', N'winwin260299@gmail.com', N'81 P1 8457', 2, N'ÁDF', CAST(N'2021-04-01 14:32:22.000' AS DateTime), CAST(N'2022-04-01 14:32:22.000' AS DateTime), 100000000, N'123652148', N'unconfimred', N'4/1/2021 2:32:22 PM123652148100000000', N'test9', CAST(N'2021-04-01T14:36:36.3740296-07:00' AS DateTimeOffset))
INSERT [dbo].[Registration_Insurance] ([Id], [InsurranceId], [UserId], [FullName], [DateOfBirth], [Address], [Phone], [Email], [LicensePlate], [VehicleRate], [RangeOfVehicle], [RegistrationDate], [ExpirationDate], [TotalMoney], [CMND], [Status], [RegistrationInsuranceCode], [ModifiedBy], [ModifiedOn]) VALUES (N'9ba1c76d-fa89-4b82-8bb7-99e4bcc24d48', N'0ffa8d02-a160-4a2e-a07d-f59e563dfa1b', N'a0111ffc-dbf9-44ce-baea-25afd756590e', N'Le Quoc J', CAST(N'2021-03-31' AS Date), N'14 Jk', N'012-563-2563', N'duachutthoinhe123@gmail.com', N'456', 10, N'754', CAST(N'2021-03-31 14:20:16.000' AS DateTime), CAST(N'2024-05-31 14:20:16.000' AS DateTime), 100000, NULL, N'Confirmed', N'31/03/2021 2:20:16 CH523652142100000', N'test2', CAST(N'2021-03-31T14:20:20.0000000+07:00' AS DateTimeOffset))
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'ADD_USER', N'Thêm User')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'CREATE_CREDENTIAL', N'Thêm Credential')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'CREATE_ROLE', N'Thêm Role')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'CREATE_USER_GROUP', N'Thêm UserGroup')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'DELETE_CREDENTIAL', N'Xóa Credential')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'DELETE_ROLE', N'Xóa Role')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'DELETE_USER', N'Xóa User')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'DELETE_USER_GROUP', N'Xóa UserGroup')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'EDIT_USER', N'Cập nhật User')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'UPDATE_CREDENTIAL', N'Cập nhật Credential')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'UPDATE_ROLE', N'Cập nhật Role')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'UPDATE_USER_GROUP', N'Cập nhật UserGroup')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'VIEW_CREDENTIAL', N'Xem Credential')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'VIEW_LAYOUT', N'Xem giao diện')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'VIEW_ROLE', N'Xem Role')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'VIEW_USER', N'Xem User')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'VIEW_USER_GROUP', N'Xem UserGroup')
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([Id], [UrlImage], [DisplayOrder], [Link], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (1, N'/Content/Data/files/1.jpg', 1, NULL, NULL, NULL, N'admin', CAST(N'2021-03-31T16:14:52.8952343+07:00' AS DateTimeOffset), N'admin', 0)
INSERT [dbo].[Slide] ([Id], [UrlImage], [DisplayOrder], [Link], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (2, N'/Content/Data/files/1.jpg', 2, NULL, NULL, NULL, N'admin', CAST(N'2021-03-31T16:14:43.0849999+07:00' AS DateTimeOffset), N'admin', 0)
INSERT [dbo].[Slide] ([Id], [UrlImage], [DisplayOrder], [Link], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (3, N'/Content/Data/files/1.jpg', 3, NULL, NULL, NULL, N'admin', CAST(N'2021-03-31T16:14:36.5211482+07:00' AS DateTimeOffset), N'admin', 0)
SET IDENTITY_INSERT [dbo].[Slide] OFF
INSERT [dbo].[User] ([Id], [GroupId], [AvatarUrl], [UserName], [Password], [ConfirmPassword], [FirstName], [LastName], [ResetPasswordCode], [Email], [Address], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'b9c6d5c0-e616-40a0-9f04-202a371075b3', N'ADMIN', N'/Content/Data/files/banner2.jpg', N'admin', N'21232f297a57a5a743894a0e4a801fc3', N'21232f297a57a5a743894a0e4a801fc3', N'Davi', N'Store', NULL, N'nghia@donga.edu.vn', N'Đà Nẵng', CAST(N'2019-04-21T15:31:55.0000000+07:00' AS DateTimeOffset), NULL, CAST(N'2019-06-04T13:45:09.2794829+07:00' AS DateTimeOffset), N'admin', 0)
INSERT [dbo].[User] ([Id], [GroupId], [AvatarUrl], [UserName], [Password], [ConfirmPassword], [FirstName], [LastName], [ResetPasswordCode], [Email], [Address], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'a0111ffc-dbf9-44ce-baea-25afd756590e', N'MEMBER', NULL, N'test2', N'25f9e794323b453885f5181f1b624d0b', N'25f9e794323b453885f5181f1b624d0b', N'adf', N'edf', NULL, N'duachutthoinhe123@gmail.com', N'14 doan uan', CAST(N'2021-03-31T14:08:31.6466924+07:00' AS DateTimeOffset), NULL, NULL, NULL, 0)
INSERT [dbo].[User] ([Id], [GroupId], [AvatarUrl], [UserName], [Password], [ConfirmPassword], [FirstName], [LastName], [ResetPasswordCode], [Email], [Address], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'8c9d01c9-ecbd-40d1-b373-2a2a44673f08', N'MEMBER', N'/Content/Data/files/shoes-10.png', N'hung', N'202cb962ac59075b964b07152d234b70', N'202cb962ac59075b964b07152d234b70', N'Trần', N'Hùng', NULL, N'hung@donga.edu.vn', N'Đà Nẵng', CAST(N'2019-06-03T23:37:45.0000000+07:00' AS DateTimeOffset), NULL, CAST(N'2019-06-04T13:47:11.1203171+07:00' AS DateTimeOffset), N'admin', 0)
INSERT [dbo].[User] ([Id], [GroupId], [AvatarUrl], [UserName], [Password], [ConfirmPassword], [FirstName], [LastName], [ResetPasswordCode], [Email], [Address], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'f51b6b74-6f9a-466e-8b7a-539bf0c5c6f1', N'MEMBER', NULL, N'test3', N'25f9e794323b453885f5181f1b624d0b', N'25f9e794323b453885f5181f1b624d0b', N'ac', N'edf', NULL, N'duachutthoinhe1234@gmail.com', N'sdsd', CAST(N'2021-03-31T15:50:35.7623370+07:00' AS DateTimeOffset), NULL, NULL, NULL, 0)
INSERT [dbo].[User] ([Id], [GroupId], [AvatarUrl], [UserName], [Password], [ConfirmPassword], [FirstName], [LastName], [ResetPasswordCode], [Email], [Address], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'f6c9eba9-a724-4335-9165-7260f863a329', N'MEMBER', NULL, N'ngobakha', N'25f9e794323b453885f5181f1b624d0b', N'25f9e794323b453885f5181f1b624d0b', N'Ngo Ba', N'Kha', NULL, N'ngobakha@gmail.com', N'14 Ngo Ba', CAST(N'2021-01-16T13:07:12.1358750+07:00' AS DateTimeOffset), NULL, NULL, NULL, 0)
INSERT [dbo].[User] ([Id], [GroupId], [AvatarUrl], [UserName], [Password], [ConfirmPassword], [FirstName], [LastName], [ResetPasswordCode], [Email], [Address], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'34f97ad8-b22c-43ef-8e0a-9205115e3a9a', N'MEMBER', N'/Content/Data/files/te2.jpg', N'nghia', N'202cb962ac59075b964b07152d234b70', N'202cb962ac59075b964b07152d234b70', N'Thành', N'Đinh ', NULL, N'dt@gmail.com', N'399 Xô Viết Nghệ Tĩnh, Hải Châu, Đà Nẵng', CAST(N'2019-04-21T15:31:55.0000000+07:00' AS DateTimeOffset), NULL, CAST(N'2019-06-12T10:31:47.3301092+07:00' AS DateTimeOffset), N'nghia', 0)
INSERT [dbo].[User] ([Id], [GroupId], [AvatarUrl], [UserName], [Password], [ConfirmPassword], [FirstName], [LastName], [ResetPasswordCode], [Email], [Address], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'fa456540-5053-42f9-9338-b044cf4c4378', N'MEMBER', NULL, N'test1', N'25f9e794323b453885f5181f1b624d0b', N'25f9e794323b453885f5181f1b624d0b', N'abc', N'dfg', NULL, N'asd@gmail.com', N'14 doan cong', CAST(N'2021-03-30T21:36:09.3795980+07:00' AS DateTimeOffset), NULL, NULL, NULL, 0)
INSERT [dbo].[User] ([Id], [GroupId], [AvatarUrl], [UserName], [Password], [ConfirmPassword], [FirstName], [LastName], [ResetPasswordCode], [Email], [Address], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'1c20141b-73a6-4c73-baea-d74b60b2b391', N'MOD', N'/Content/Data/files/te2.jpg', N'modifier1', N'202cb962ac59075b964b07152d234b70', N'202cb962ac59075b964b07152d234b70', N'Lê Văn', N'Bảo', NULL, N'qu@donga.edu.vn', N'Gia Lai', CAST(N'2019-06-13T14:26:05.3075907+07:00' AS DateTimeOffset), N'admin', NULL, NULL, 0)
INSERT [dbo].[User] ([Id], [GroupId], [AvatarUrl], [UserName], [Password], [ConfirmPassword], [FirstName], [LastName], [ResetPasswordCode], [Email], [Address], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'0ef711e7-7200-4214-b81d-e090ab3ca926', N'MEMBER', NULL, N'test9', N'25f9e794323b453885f5181f1b624d0b', N'25f9e794323b453885f5181f1b624d0b', N'win', N'nguyen', NULL, N'winwin260299@gmail.com', N'123 abc', CAST(N'2021-04-01T14:29:41.9205552-07:00' AS DateTimeOffset), NULL, NULL, NULL, 0)
INSERT [dbo].[UserGroup] ([Id], [Name]) VALUES (N'ADMIN', N'Quản trị')
INSERT [dbo].[UserGroup] ([Id], [Name]) VALUES (N'MEMBER', N'Thành viên')
INSERT [dbo].[UserGroup] ([Id], [Name]) VALUES (N'MOD', N'Moderitor')
INSERT [dbo].[Vehicle] ([Id], [VehicleTypeId], [Name], [VehicleModel], [VehicleVersion], [VehicleBodyNumber], [ImageVehicle], [VehicleEngineNumber], [MetaTitle], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'9ec4c651-1670-4c6b-8e70-001aa20d3684', NULL, N'Real estate insurance', N'Real estate insurance Real estate', NULL, NULL, NULL, NULL, N'Real-estate-insurance', CAST(N'2021-01-18T01:20:45.8206379+07:00' AS DateTimeOffset), N'admin', NULL, NULL, 1)
INSERT [dbo].[Vehicle] ([Id], [VehicleTypeId], [Name], [VehicleModel], [VehicleVersion], [VehicleBodyNumber], [ImageVehicle], [VehicleEngineNumber], [MetaTitle], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'73e887e4-52fb-4724-a141-187ea8b55772', N'8fdf0373-027f-4f9f-b1d1-91d5981cedee', N'Kia Morning', N'Lorem Ipsum', N'Lorem Ipsum', N'Lorem Ipsum', N'/Content/Data/files/1.jpg', N'Lorem Ipsum', N'Kia-Morning', CAST(N'2021-03-28T16:13:35.8535011+07:00' AS DateTimeOffset), N'admin', NULL, NULL, 0)
INSERT [dbo].[Vehicle] ([Id], [VehicleTypeId], [Name], [VehicleModel], [VehicleVersion], [VehicleBodyNumber], [ImageVehicle], [VehicleEngineNumber], [MetaTitle], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'd00cb1fb-3ee1-4105-bbee-1e8a93842176', NULL, N'Motorcycle insurance', N'Motorcycle insurance Motorcycle insurance', NULL, NULL, NULL, NULL, N'Motorcycle-insurance', CAST(N'2021-01-18T01:20:01.4117416+07:00' AS DateTimeOffset), N'admin', NULL, NULL, 1)
INSERT [dbo].[Vehicle] ([Id], [VehicleTypeId], [Name], [VehicleModel], [VehicleVersion], [VehicleBodyNumber], [ImageVehicle], [VehicleEngineNumber], [MetaTitle], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'4ce0491b-17b0-49d9-b089-1ef74029f922', NULL, N'Health Insurance', N'Health Insurance Health Insurance Health Insurance', NULL, NULL, NULL, NULL, N'health-insurance', CAST(N'2021-01-10T16:49:27.2855259+07:00' AS DateTimeOffset), N'admin', NULL, NULL, 1)
INSERT [dbo].[Vehicle] ([Id], [VehicleTypeId], [Name], [VehicleModel], [VehicleVersion], [VehicleBodyNumber], [ImageVehicle], [VehicleEngineNumber], [MetaTitle], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'd6ec71c7-dbaf-48dd-adcc-5aa7bb05f44a', N'a3b5bd52-e7fd-440d-9ea1-91877e34d179', N'Chevrolet Cruze', N'Lorem Ipsum', N'Lorem Ipsum', N'Lorem Ipsum', N'/Content/Data/files/3.jpg', N'Lorem Ipsum', N'Chevrolet-Cruze', CAST(N'2021-03-28T16:14:35.0000000+07:00' AS DateTimeOffset), N'admin', CAST(N'2021-03-28T16:17:23.7987652+07:00' AS DateTimeOffset), N'admin', 0)
INSERT [dbo].[Vehicle] ([Id], [VehicleTypeId], [Name], [VehicleModel], [VehicleVersion], [VehicleBodyNumber], [ImageVehicle], [VehicleEngineNumber], [MetaTitle], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'9ea08b4b-13b1-431f-a85b-7b3fbbc9724a', N'10a7aa9e-0e05-40d2-86b8-76ee9c8bd2e4', N'Ford Fiesta', N'Lorem Ipsum', N'Lorem Ipsum', N'Lorem Ipsum', N'/Content/Data/files/12.jpg', N'Lorem Ipsum', N'Ford-Fiesta', CAST(N'2021-03-28T16:14:03.0000000+07:00' AS DateTimeOffset), N'admin', CAST(N'2021-03-28T16:17:36.4165342+07:00' AS DateTimeOffset), N'admin', 0)
INSERT [dbo].[Vehicle] ([Id], [VehicleTypeId], [Name], [VehicleModel], [VehicleVersion], [VehicleBodyNumber], [ImageVehicle], [VehicleEngineNumber], [MetaTitle], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'f6610b11-d715-4e29-b6de-9d69117d4b4b', N'b776ed16-4adb-44d8-9386-3f776df412ba', N'Mercedes C', N'Lorem Ipsum', N'Lorem Ipsum', N'Lorem Ipsum', N'/Content/Data/files/5.jpg', N'Lorem Ipsum', N'Mercedes-C', CAST(N'2021-03-28T16:15:43.0000000+07:00' AS DateTimeOffset), N'admin', CAST(N'2021-03-28T16:16:59.3555050+07:00' AS DateTimeOffset), N'admin', 0)
INSERT [dbo].[Vehicle] ([Id], [VehicleTypeId], [Name], [VehicleModel], [VehicleVersion], [VehicleBodyNumber], [ImageVehicle], [VehicleEngineNumber], [MetaTitle], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'bc6878e9-5529-4261-b145-ba2fc5d7a185', NULL, N'Life insurance', N'Life insurance Life insurance ', NULL, NULL, NULL, NULL, N'Life-insurance', CAST(N'2021-01-18T01:21:24.0000000+07:00' AS DateTimeOffset), N'admin', CAST(N'2021-01-18T01:21:49.6713717+07:00' AS DateTimeOffset), N'admin', 1)
INSERT [dbo].[Vehicle] ([Id], [VehicleTypeId], [Name], [VehicleModel], [VehicleVersion], [VehicleBodyNumber], [ImageVehicle], [VehicleEngineNumber], [MetaTitle], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'dca27e2e-635d-4bc2-97a2-c712506a2564', N'9192256f-8cf9-4446-bc60-4d435e355d3a', N'Audi A6', N'Lorem Ipsum', N'Lorem Ipsum', N'Lorem Ipsum', N'/Content/Data/files/6.jpg', N'Lorem Ipsum', N'Audi-A6', CAST(N'2021-03-28T16:16:21.7544236+07:00' AS DateTimeOffset), N'admin', NULL, NULL, 0)
INSERT [dbo].[Vehicle] ([Id], [VehicleTypeId], [Name], [VehicleModel], [VehicleVersion], [VehicleBodyNumber], [ImageVehicle], [VehicleEngineNumber], [MetaTitle], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'5325487d-bc58-43db-adb0-cbe84de393f2', N'83bf1913-5057-4547-b4bb-133efa9408a7', N'Marza 6 ', N'Lorem Ipsum', N'Lorem Ipsum', N'Lorem Ipsum', N'/Content/Data/files/4.jpg', N'Lorem Ipsum', N'Marza-6 ', CAST(N'2021-03-28T16:15:14.0000000+07:00' AS DateTimeOffset), N'admin', CAST(N'2021-03-28T16:17:09.7405231+07:00' AS DateTimeOffset), N'admin', 0)
INSERT [dbo].[VehicleType] ([Id], [Name], [MetaTitle], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'83bf1913-5057-4547-b4bb-133efa9408a7', N'Large cars', N'large-cars', N'dung tích động cơ từ 2 – 3,5', CAST(N'2021-03-28T16:06:40.9875801+07:00' AS DateTimeOffset), N'admin', NULL, NULL, 0)
INSERT [dbo].[VehicleType] ([Id], [Name], [MetaTitle], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'b776ed16-4adb-44d8-9386-3f776df412ba', N'Executive cars', N'executive-cars', N'phân khúc xe hạng sang', CAST(N'2021-03-28T16:07:09.0858483+07:00' AS DateTimeOffset), N'admin', NULL, NULL, 0)
INSERT [dbo].[VehicleType] ([Id], [Name], [MetaTitle], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'9192256f-8cf9-4446-bc60-4d435e355d3a', N'Full size luxury cars', N'full-size-luxury-cars', N'phân khúc E', CAST(N'2021-03-28T16:07:38.3277582+07:00' AS DateTimeOffset), N'admin', NULL, NULL, 0)
INSERT [dbo].[VehicleType] ([Id], [Name], [MetaTitle], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'10a7aa9e-0e05-40d2-86b8-76ee9c8bd2e4', N'Small cars', N'small-cars', N'Các dòng xe hạng B được trang bị động cơ 1,4 – 1,6', CAST(N'2021-03-28T16:05:49.8360547+07:00' AS DateTimeOffset), N'admin', NULL, NULL, 0)
INSERT [dbo].[VehicleType] ([Id], [Name], [MetaTitle], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'a3b5bd52-e7fd-440d-9ea1-91877e34d179', N'Medium cars', N'medium-cars', N'xe được trang bị động cơ từ 1,4 – 2,2', CAST(N'2021-03-28T16:06:15.5850686+07:00' AS DateTimeOffset), N'admin', NULL, NULL, 0)
INSERT [dbo].[VehicleType] ([Id], [Name], [MetaTitle], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'8fdf0373-027f-4f9f-b1d1-91d5981cedee', N'Mini cars', N'mini-car', N'Phân khúc A bao gồm các dòng xe mini', CAST(N'2021-03-28T16:05:00.0000000+07:00' AS DateTimeOffset), N'admin', CAST(N'2021-03-28T16:05:13.0043573+07:00' AS DateTimeOffset), N'admin', 0)
INSERT [dbo].[VehicleType] ([Id], [Name], [MetaTitle], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [IsDeleted]) VALUES (N'8abe7bc3-3fb5-492c-83f2-be55204faeba', N'Sports coupes', N'sports-coupes', N'các dòng xe coupes thể thao, grand tourer', CAST(N'2021-03-28T16:08:04.5471211+07:00' AS DateTimeOffset), N'admin', NULL, NULL, 0)
ALTER TABLE [dbo].[ClaimInsurance]  WITH CHECK ADD  CONSTRAINT [FK_ClaimInsurance_Registration_Insurance] FOREIGN KEY([Registration_InsuranceId])
REFERENCES [dbo].[Registration_Insurance] ([Id])
GO
ALTER TABLE [dbo].[ClaimInsurance] CHECK CONSTRAINT [FK_ClaimInsurance_Registration_Insurance]
GO
ALTER TABLE [dbo].[ClaimInsurance]  WITH CHECK ADD  CONSTRAINT [FK_ClaimInsurance_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ClaimInsurance] CHECK CONSTRAINT [FK_ClaimInsurance_User]
GO
ALTER TABLE [dbo].[Insurrance]  WITH CHECK ADD  CONSTRAINT [FK_Insurrance_Vehicle] FOREIGN KEY([VehicleId])
REFERENCES [dbo].[Vehicle] ([Id])
GO
ALTER TABLE [dbo].[Insurrance] CHECK CONSTRAINT [FK_Insurrance_Vehicle]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK__Content__Categor__412EB0B6] FOREIGN KEY([NewsCategoryId])
REFERENCES [dbo].[NewsCategory] ([Id])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK__Content__Categor__412EB0B6]
GO
ALTER TABLE [dbo].[Registration_Insurance]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Insurance_Insurrance1] FOREIGN KEY([InsurranceId])
REFERENCES [dbo].[Insurrance] ([Id])
GO
ALTER TABLE [dbo].[Registration_Insurance] CHECK CONSTRAINT [FK_Registration_Insurance_Insurrance1]
GO
ALTER TABLE [dbo].[Registration_Insurance]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Insurance_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Registration_Insurance] CHECK CONSTRAINT [FK_Registration_Insurance_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserGroup] FOREIGN KEY([GroupId])
REFERENCES [dbo].[UserGroup] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserGroup]
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_VehicleType] FOREIGN KEY([VehicleTypeId])
REFERENCES [dbo].[VehicleType] ([Id])
GO
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [FK_Vehicle_VehicleType]
GO
USE [master]
GO
ALTER DATABASE [InsurraceDB] SET  READ_WRITE 
GO
