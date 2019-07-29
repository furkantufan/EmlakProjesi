USE [master]
GO
/****** Object:  Database [EMLAK]    Script Date: 18.07.2019 15:13:58 ******/
CREATE DATABASE [EMLAK]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EMLAK', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\EMLAK.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EMLAK_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\EMLAK_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EMLAK] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EMLAK].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EMLAK] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EMLAK] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EMLAK] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EMLAK] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EMLAK] SET ARITHABORT OFF 
GO
ALTER DATABASE [EMLAK] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EMLAK] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EMLAK] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EMLAK] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EMLAK] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EMLAK] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EMLAK] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EMLAK] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EMLAK] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EMLAK] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EMLAK] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EMLAK] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EMLAK] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EMLAK] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EMLAK] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EMLAK] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EMLAK] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EMLAK] SET RECOVERY FULL 
GO
ALTER DATABASE [EMLAK] SET  MULTI_USER 
GO
ALTER DATABASE [EMLAK] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EMLAK] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EMLAK] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EMLAK] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EMLAK] SET DELAYED_DURABILITY = DISABLED 
GO
USE [EMLAK]
GO
/****** Object:  Table [dbo].[ADRES]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADRES](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IL_ID] [int] NOT NULL,
	[ILCE_ID] [int] NOT NULL,
	[MAHALLE] [nvarchar](50) NOT NULL,
	[DETAY] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_ADRES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ALT_KATEGORI]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALT_KATEGORI](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ADI] [nvarchar](150) NULL,
 CONSTRAINT [PK_ALT_KATEGORI] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BIREYSEL_UYE]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BIREYSEL_UYE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AD] [nvarchar](50) NULL,
	[SOYAD] [nvarchar](50) NULL,
	[CINSIYET] [nvarchar](10) NULL,
	[TEL_NO] [nvarchar](15) NULL,
	[EMAIL] [nvarchar](50) NULL,
	[ADRES] [nvarchar](150) NULL,
	[IL_ID] [int] NULL,
	[ILCE_ID] [int] NULL,
 CONSTRAINT [PK_BIREYSEL_UYE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CEPHE]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CEPHE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ADI] [nvarchar](50) NULL,
 CONSTRAINT [PK_CEPHE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DIS_OZELLIK]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIS_OZELLIK](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ADI] [nvarchar](50) NULL,
 CONSTRAINT [PK_DIS_OZELLIK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DURUM]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DURUM](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AD] [nvarchar](100) NULL,
 CONSTRAINT [PK_DURUM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IC_OZELLIK]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IC_OZELLIK](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ADI] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_IC_OZELLIK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IL]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IL](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KODU] [char](2) NOT NULL,
	[ADI] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_IL] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ILAN]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ILAN](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UYE_ID] [int] NOT NULL,
	[ADRES_ID] [int] NOT NULL,
	[CEPHE_ID] [int] NULL,
	[KATEGORI_ID] [int] NOT NULL,
	[ALT_KATEGORI_ID] [int] NULL,
	[KONUT_TIP_ID] [int] NULL,
	[ISINMA_TIP_ID] [int] NULL,
	[BASLIK] [nvarchar](150) NOT NULL,
	[YAYIN_SURESI] [datetime] NULL,
	[FIYAT] [int] NULL,
	[BINA_YASI] [int] NULL,
	[ODA_SAYISI] [int] NULL,
	[SALON_SAYISI] [int] NULL,
	[BANYO_SAYISI] [int] NULL,
	[M2] [int] NULL,
	[KREDIYE_UYGUNLUK] [nvarchar](20) NULL,
	[ESYALI] [nvarchar](10) NULL,
	[ACIKLAMA] [nvarchar](200) NULL,
	[KOORDINAT_X] [nvarchar](50) NULL,
	[KOORDINAT_Y] [nvarchar](50) NULL,
	[DURUM_ID] [int] NULL,
 CONSTRAINT [PK_ILAN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ILAN_DIS_OZELLIK]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ILAN_DIS_OZELLIK](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DIS_OZELLIK_ID] [int] NULL,
	[ILAN_ID] [int] NULL,
 CONSTRAINT [PK_ILAN_DIS_OZELLIK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ILAN_IC_OZELLIK]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ILAN_IC_OZELLIK](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IC_OZELLIK_ID] [int] NULL,
	[ILAN_ID] [int] NULL,
 CONSTRAINT [PK_ILAN_IC_OZELLIK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ILAN_KONUM_OZELLIK]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ILAN_KONUM_OZELLIK](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KONUM_OZELLIK_ID] [int] NULL,
	[ILAN_ID] [int] NULL,
 CONSTRAINT [PK_ILAN_KONUM_OZELLIK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ILCE]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ILCE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KODU] [int] NOT NULL,
	[ADI] [nvarchar](100) NOT NULL,
	[IL_ID] [int] NOT NULL,
 CONSTRAINT [PK_ILCE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ISINMA_TIP]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ISINMA_TIP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TIPI] [nvarchar](100) NULL,
 CONSTRAINT [PK_ISINMA_TIP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KATEGORI]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KATEGORI](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ADI] [nvarchar](50) NULL,
 CONSTRAINT [PK_KATEGORI] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KONUM_OZELLIK]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KONUM_OZELLIK](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ADI] [nvarchar](50) NULL,
 CONSTRAINT [PK_KONUM_OZELLIK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KONUT_TIP]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KONUT_TIP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TIPI] [nvarchar](100) NULL,
 CONSTRAINT [PK_KONUT_TIP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KULLANICI]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KULLANICI](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UYE_ID] [int] NOT NULL,
	[YETKI_ID] [int] NOT NULL,
	[KULLANICI_ADI] [nvarchar](150) NOT NULL,
	[SIFRE] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_KULLANICI] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KURUMSAL_TUR]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KURUMSAL_TUR](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AD] [nvarchar](100) NULL,
 CONSTRAINT [PK_KURUMSAL_TUR] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KURUMSAL_UYE]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KURUMSAL_UYE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KURUMSAL_TUR_ID] [int] NULL,
	[RESMI_AD] [nvarchar](100) NULL,
	[KISA_AD] [nvarchar](100) NULL,
	[YETKILI_AD] [nvarchar](100) NULL,
	[YETKILI_SOYAD] [nvarchar](100) NULL,
	[DOGUM_TARIHI] [datetime] NULL,
	[TEL_NO] [nvarchar](15) NULL,
	[EMAIL] [nvarchar](50) NULL,
	[IL_ID] [int] NULL,
	[ILCE_ID] [int] NULL,
	[ADRES] [nvarchar](150) NULL,
 CONSTRAINT [PK_KURUMSAL_UYE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MAHALLE]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MAHALLE](
	[ID] [int] NOT NULL,
	[ADI] [nvarchar](200) NULL,
 CONSTRAINT [PK_MAHALLE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RESIM]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RESIM](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ILAN_ID] [int] NOT NULL,
	[AD] [nvarchar](50) NOT NULL,
	[LINK] [nvarchar](max) NULL,
 CONSTRAINT [PK_RESIM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SATIS]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SATIS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SATILAN_ILAN_ID] [int] NULL,
	[SATIN_ALAN_ID] [int] NULL,
	[SATIS_GERCEKLESTIREN_ID] [int] NULL,
 CONSTRAINT [PK_SATIS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TAKIP]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAKIP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UYE_ID] [int] NULL,
	[IL_ID] [int] NOT NULL,
	[ILCE_ID] [int] NOT NULL,
	[DETAY] [nvarchar](200) NULL,
	[KOORDINAT_X] [nvarchar](50) NULL,
	[KOORDINAT_Y] [nvarchar](50) NULL,
	[AKTIF] [bit] NULL CONSTRAINT [DF_TAKIP_AKTIF]  DEFAULT ((1)),
 CONSTRAINT [PK_TAKIP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TALEP]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TALEP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ILAN_ID] [int] NULL,
	[ILAN_SAHIP_ID] [int] NULL,
	[TALEP_EDEN_ID] [int] NULL,
	[TALEP_DURUM_ID] [int] NULL,
 CONSTRAINT [PK_TALEP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TALEP_DURUM]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TALEP_DURUM](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AD] [nvarchar](150) NULL,
 CONSTRAINT [PK_TALEP_DURUM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UYE]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UYE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UYE_ID] [int] NOT NULL,
	[UYE_TURU] [nvarchar](50) NOT NULL,
	[UYE_DURUMU] [bit] NOT NULL,
 CONSTRAINT [PK_UYE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YETKI]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YETKI](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ADI] [nvarchar](50) NULL,
	[ACIKLAMA] [nvarchar](150) NULL,
 CONSTRAINT [PK_YETKI] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[ADRES]  WITH CHECK ADD  CONSTRAINT [FK_ADRES_IL] FOREIGN KEY([IL_ID])
REFERENCES [dbo].[IL] ([ID])
GO
ALTER TABLE [dbo].[ADRES] CHECK CONSTRAINT [FK_ADRES_IL]
GO
ALTER TABLE [dbo].[ADRES]  WITH CHECK ADD  CONSTRAINT [FK_ADRES_ILCE] FOREIGN KEY([ILCE_ID])
REFERENCES [dbo].[ILCE] ([ID])
GO
ALTER TABLE [dbo].[ADRES] CHECK CONSTRAINT [FK_ADRES_ILCE]
GO
ALTER TABLE [dbo].[ILAN]  WITH CHECK ADD  CONSTRAINT [FK_ILAN_ADRES] FOREIGN KEY([ADRES_ID])
REFERENCES [dbo].[ADRES] ([ID])
GO
ALTER TABLE [dbo].[ILAN] CHECK CONSTRAINT [FK_ILAN_ADRES]
GO
ALTER TABLE [dbo].[ILAN]  WITH CHECK ADD  CONSTRAINT [FK_ILAN_ALT_KATEGORI] FOREIGN KEY([ALT_KATEGORI_ID])
REFERENCES [dbo].[ALT_KATEGORI] ([ID])
GO
ALTER TABLE [dbo].[ILAN] CHECK CONSTRAINT [FK_ILAN_ALT_KATEGORI]
GO
ALTER TABLE [dbo].[ILAN]  WITH CHECK ADD  CONSTRAINT [FK_ILAN_CEPHE] FOREIGN KEY([CEPHE_ID])
REFERENCES [dbo].[CEPHE] ([ID])
GO
ALTER TABLE [dbo].[ILAN] CHECK CONSTRAINT [FK_ILAN_CEPHE]
GO
ALTER TABLE [dbo].[ILAN]  WITH CHECK ADD  CONSTRAINT [FK_ILAN_DURUM] FOREIGN KEY([DURUM_ID])
REFERENCES [dbo].[DURUM] ([ID])
GO
ALTER TABLE [dbo].[ILAN] CHECK CONSTRAINT [FK_ILAN_DURUM]
GO
ALTER TABLE [dbo].[ILAN]  WITH CHECK ADD  CONSTRAINT [FK_ILAN_ISINMA_TIP] FOREIGN KEY([ISINMA_TIP_ID])
REFERENCES [dbo].[ISINMA_TIP] ([ID])
GO
ALTER TABLE [dbo].[ILAN] CHECK CONSTRAINT [FK_ILAN_ISINMA_TIP]
GO
ALTER TABLE [dbo].[ILAN]  WITH CHECK ADD  CONSTRAINT [FK_ILAN_KATEGORI] FOREIGN KEY([KATEGORI_ID])
REFERENCES [dbo].[KATEGORI] ([ID])
GO
ALTER TABLE [dbo].[ILAN] CHECK CONSTRAINT [FK_ILAN_KATEGORI]
GO
ALTER TABLE [dbo].[ILAN]  WITH CHECK ADD  CONSTRAINT [FK_ILAN_KONUT_TIP] FOREIGN KEY([KONUT_TIP_ID])
REFERENCES [dbo].[KONUT_TIP] ([ID])
GO
ALTER TABLE [dbo].[ILAN] CHECK CONSTRAINT [FK_ILAN_KONUT_TIP]
GO
ALTER TABLE [dbo].[ILAN]  WITH CHECK ADD  CONSTRAINT [FK_ILAN_UYE] FOREIGN KEY([UYE_ID])
REFERENCES [dbo].[UYE] ([ID])
GO
ALTER TABLE [dbo].[ILAN] CHECK CONSTRAINT [FK_ILAN_UYE]
GO
ALTER TABLE [dbo].[ILAN_DIS_OZELLIK]  WITH CHECK ADD  CONSTRAINT [FK_ILAN_DIS_OZELLIK_DIS_OZELLIK] FOREIGN KEY([DIS_OZELLIK_ID])
REFERENCES [dbo].[DIS_OZELLIK] ([ID])
GO
ALTER TABLE [dbo].[ILAN_DIS_OZELLIK] CHECK CONSTRAINT [FK_ILAN_DIS_OZELLIK_DIS_OZELLIK]
GO
ALTER TABLE [dbo].[ILAN_DIS_OZELLIK]  WITH CHECK ADD  CONSTRAINT [FK_ILAN_DIS_OZELLIK_ILAN] FOREIGN KEY([ILAN_ID])
REFERENCES [dbo].[ILAN] ([ID])
GO
ALTER TABLE [dbo].[ILAN_DIS_OZELLIK] CHECK CONSTRAINT [FK_ILAN_DIS_OZELLIK_ILAN]
GO
ALTER TABLE [dbo].[ILAN_IC_OZELLIK]  WITH CHECK ADD  CONSTRAINT [FK_ILAN_IC_OZELLIK_IC_OZELLIK] FOREIGN KEY([IC_OZELLIK_ID])
REFERENCES [dbo].[IC_OZELLIK] ([ID])
GO
ALTER TABLE [dbo].[ILAN_IC_OZELLIK] CHECK CONSTRAINT [FK_ILAN_IC_OZELLIK_IC_OZELLIK]
GO
ALTER TABLE [dbo].[ILAN_IC_OZELLIK]  WITH CHECK ADD  CONSTRAINT [FK_ILAN_IC_OZELLIK_ILAN] FOREIGN KEY([ILAN_ID])
REFERENCES [dbo].[ILAN] ([ID])
GO
ALTER TABLE [dbo].[ILAN_IC_OZELLIK] CHECK CONSTRAINT [FK_ILAN_IC_OZELLIK_ILAN]
GO
ALTER TABLE [dbo].[ILAN_KONUM_OZELLIK]  WITH CHECK ADD  CONSTRAINT [FK_ILAN_KONUM_OZELLIK_ILAN] FOREIGN KEY([ILAN_ID])
REFERENCES [dbo].[ILAN] ([ID])
GO
ALTER TABLE [dbo].[ILAN_KONUM_OZELLIK] CHECK CONSTRAINT [FK_ILAN_KONUM_OZELLIK_ILAN]
GO
ALTER TABLE [dbo].[ILAN_KONUM_OZELLIK]  WITH CHECK ADD  CONSTRAINT [FK_ILAN_KONUM_OZELLIK_KONUM_OZELLIK] FOREIGN KEY([KONUM_OZELLIK_ID])
REFERENCES [dbo].[KONUM_OZELLIK] ([ID])
GO
ALTER TABLE [dbo].[ILAN_KONUM_OZELLIK] CHECK CONSTRAINT [FK_ILAN_KONUM_OZELLIK_KONUM_OZELLIK]
GO
ALTER TABLE [dbo].[ILCE]  WITH CHECK ADD  CONSTRAINT [FK_ILCE_IL] FOREIGN KEY([IL_ID])
REFERENCES [dbo].[IL] ([ID])
GO
ALTER TABLE [dbo].[ILCE] CHECK CONSTRAINT [FK_ILCE_IL]
GO
ALTER TABLE [dbo].[KULLANICI]  WITH CHECK ADD  CONSTRAINT [FK_KULLANICI_UYE] FOREIGN KEY([UYE_ID])
REFERENCES [dbo].[UYE] ([ID])
GO
ALTER TABLE [dbo].[KULLANICI] CHECK CONSTRAINT [FK_KULLANICI_UYE]
GO
ALTER TABLE [dbo].[KULLANICI]  WITH CHECK ADD  CONSTRAINT [FK_KULLANICI_YETKI] FOREIGN KEY([YETKI_ID])
REFERENCES [dbo].[YETKI] ([ID])
GO
ALTER TABLE [dbo].[KULLANICI] CHECK CONSTRAINT [FK_KULLANICI_YETKI]
GO
ALTER TABLE [dbo].[KURUMSAL_UYE]  WITH CHECK ADD  CONSTRAINT [FK_KURUMSAL_UYE_KURUMSAL_TUR] FOREIGN KEY([KURUMSAL_TUR_ID])
REFERENCES [dbo].[KURUMSAL_TUR] ([ID])
GO
ALTER TABLE [dbo].[KURUMSAL_UYE] CHECK CONSTRAINT [FK_KURUMSAL_UYE_KURUMSAL_TUR]
GO
ALTER TABLE [dbo].[RESIM]  WITH CHECK ADD  CONSTRAINT [FK_RESIM_ILAN] FOREIGN KEY([ILAN_ID])
REFERENCES [dbo].[ILAN] ([ID])
GO
ALTER TABLE [dbo].[RESIM] CHECK CONSTRAINT [FK_RESIM_ILAN]
GO
ALTER TABLE [dbo].[SATIS]  WITH CHECK ADD  CONSTRAINT [FK_SATIS_ILAN] FOREIGN KEY([SATILAN_ILAN_ID])
REFERENCES [dbo].[ILAN] ([ID])
GO
ALTER TABLE [dbo].[SATIS] CHECK CONSTRAINT [FK_SATIS_ILAN]
GO
ALTER TABLE [dbo].[SATIS]  WITH CHECK ADD  CONSTRAINT [FK_SATIS_UYE] FOREIGN KEY([SATIN_ALAN_ID])
REFERENCES [dbo].[UYE] ([ID])
GO
ALTER TABLE [dbo].[SATIS] CHECK CONSTRAINT [FK_SATIS_UYE]
GO
ALTER TABLE [dbo].[SATIS]  WITH CHECK ADD  CONSTRAINT [FK_SATIS_UYE_GERCEKLESTIREN] FOREIGN KEY([SATIS_GERCEKLESTIREN_ID])
REFERENCES [dbo].[UYE] ([ID])
GO
ALTER TABLE [dbo].[SATIS] CHECK CONSTRAINT [FK_SATIS_UYE_GERCEKLESTIREN]
GO
ALTER TABLE [dbo].[TAKIP]  WITH CHECK ADD  CONSTRAINT [FK_TAKIP_IL] FOREIGN KEY([IL_ID])
REFERENCES [dbo].[IL] ([ID])
GO
ALTER TABLE [dbo].[TAKIP] CHECK CONSTRAINT [FK_TAKIP_IL]
GO
ALTER TABLE [dbo].[TAKIP]  WITH CHECK ADD  CONSTRAINT [FK_TAKIP_ILCE] FOREIGN KEY([ILCE_ID])
REFERENCES [dbo].[ILCE] ([ID])
GO
ALTER TABLE [dbo].[TAKIP] CHECK CONSTRAINT [FK_TAKIP_ILCE]
GO
ALTER TABLE [dbo].[TALEP]  WITH CHECK ADD  CONSTRAINT [FK_TALEP_TALEP_DURUM] FOREIGN KEY([TALEP_DURUM_ID])
REFERENCES [dbo].[TALEP_DURUM] ([ID])
GO
ALTER TABLE [dbo].[TALEP] CHECK CONSTRAINT [FK_TALEP_TALEP_DURUM]
GO
ALTER TABLE [dbo].[TALEP]  WITH CHECK ADD  CONSTRAINT [FK_TALEP_UYE] FOREIGN KEY([TALEP_EDEN_ID])
REFERENCES [dbo].[UYE] ([ID])
GO
ALTER TABLE [dbo].[TALEP] CHECK CONSTRAINT [FK_TALEP_UYE]
GO
ALTER TABLE [dbo].[TALEP]  WITH CHECK ADD  CONSTRAINT [FK_TALEP_UYE1] FOREIGN KEY([ILAN_SAHIP_ID])
REFERENCES [dbo].[UYE] ([ID])
GO
ALTER TABLE [dbo].[TALEP] CHECK CONSTRAINT [FK_TALEP_UYE1]
GO
ALTER TABLE [dbo].[UYE]  WITH CHECK ADD  CONSTRAINT [FK_UYE_BIREYSEL_UYE] FOREIGN KEY([UYE_ID])
REFERENCES [dbo].[BIREYSEL_UYE] ([ID])
GO
ALTER TABLE [dbo].[UYE] CHECK CONSTRAINT [FK_UYE_BIREYSEL_UYE]
GO
/****** Object:  StoredProcedure [dbo].[ESLESEN_TALEPLER]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ESLESEN_TALEPLER] --8
@UYE_ID int
AS

CREATE TABLE #ESLESEN_ILANLAR
(
	ID INT,
	BASLIK NVARCHAR(50),
	KATEGORI NVARCHAR(50),
	IL NVARCHAR(50),
	ILCE NVARCHAR(50),
	KOORDINAT_X NVARCHAR(50),
	KOORDINAT_Y NVARCHAR(50)
)

DECLARE @SAYAC INT;
SET @SAYAC=0;
DECLARE @MAX INT;
SET @MAX=(SELECT COUNT(*) FROM TAKIP WHERE UYE_ID=@UYE_ID)
WHILE(@SAYAC<=@MAX)
BEGIN
	SET @SAYAC=@SAYAC+1	
	IF EXISTS (SELECT *FROM TAKIP WHERE ID=@SAYAC AND AKTIF=1)
	BEGIN
		DECLARE @IL_ID INT=(SELECT top 1 IL_ID FROM TAKIP WHERE ID=@SAYAC)
		DECLARE @ILCE_ID INT=(SELECT top 1  ILCE_ID FROM TAKIP WHERE ID=@SAYAC)
		DECLARE @DETAY NVARCHAR(150)=(SELECT top 1  DETAY FROM TAKIP WHERE ID=@SAYAC)
		DECLARE @KOORDINAT_X NVARCHAR(50)=(SELECT top 1  KOORDINAT_X FROM TAKIP WHERE ID=@SAYAC)
		DECLARE @KOORDINAT_Y NVARCHAR(50)=(SELECT top 1  KOORDINAT_Y FROM TAKIP WHERE ID=@SAYAC)
		INSERT INTO #ESLESEN_ILANLAR 
		SELECT top 1 ILAN.ID,BASLIK,KATEGORI.ADI,IL.ADI,ILCE.ADI,@KOORDINAT_X,@KOORDINAT_Y 
		FROM ILAN,ADRES,KATEGORI,IL,ILCE 
		WHERE (ADRES.IL_ID=@IL_ID AND ADRES.ILCE_ID=@ILCE_ID AND ILAN.KATEGORI_ID=KATEGORI.ID AND ILAN.ADRES_ID=ADRES.ID) 
		AND (BASLIK LIKE '%'+@DETAY+'%' OR ACIKLAMA LIKE '%'+@DETAY+'%')-- OR (ADRES.IL_ID LIKE @IL_ID)
	END
END
SELECT * FROM #ESLESEN_ILANLAR

GO
/****** Object:  StoredProcedure [dbo].[ILAN_TALEP]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ILAN_TALEP] --8,1,1,'Esentepe','Melikgazi',1,1,1,1,'TEST İLAN','2018-05-25',100,7,3,1,1,165,'UYGUN','EVET','AÇIKLAMA','38.5','32.4'
@UYE_ID int,
@IL_ID int,
@ILCE_ID int,
@MAHALLE NVARCHAR(50),
@DETAY NVARCHAR(150)='',
@CEPHE_ID int=null,
@KATEGORI_ID int,
@KONUT_TIP_ID int=null,
@ISINMA_TIP_ID int=null,
@BASLIK NVARCHAR(150),
@YAYIN_SURESI NVARCHAR(50),
@FIYAT int,
@BINA_YASI int=null,
@ODA_SAYISI int=null,
@SALON_SAYISI int=null,
@BANYO_SAYISI int null,
@M2 int=null,
@KREDIYE_UYGUNLUK NVARCHAR(20)='BİLİNMİYOR',
@ESYALI NVARCHAR(10)='',
@ACIKLAMA NVARCHAR(200)='',
@KOORDINAT_X NVARCHAR(50)='',
@KOORDINAT_Y NVARCHAR(50)='',
@RESIM NVARCHAR(150)='Default_Emlak.png',
@DURUM_ID int=1,
@RESULT NVARCHAR(50)=''
AS
BEGIN
	--İlan Adresinin Kaydedilmesi
	INSERT INTO ADRES (IL_ID,ILCE_ID,MAHALLE,DETAY) VALUES (@IL_ID,@ILCE_ID,@MAHALLE,@DETAY)

	--İlan Talebinin Kaydedilmesi
	INSERT INTO ILAN(UYE_ID,ADRES_ID,CEPHE_ID,KATEGORI_ID,KONUT_TIP_ID,ISINMA_TIP_ID,BASLIK,YAYIN_SURESI,FIYAT,BINA_YASI,ODA_SAYISI,
	SALON_SAYISI,M2,KREDIYE_UYGUNLUK,ESYALI,ACIKLAMA,KOORDINAT_X,KOORDINAT_Y,DURUM_ID)
	VALUES(@UYE_ID,(SELECT MAX(ID) FROM ADRES),@CEPHE_ID,@KATEGORI_ID,@KONUT_TIP_ID,@ISINMA_TIP_ID,@BASLIK,@YAYIN_SURESI,@FIYAT,
	@BINA_YASI,@ODA_SAYISI,@SALON_SAYISI,@M2,@KREDIYE_UYGUNLUK,@ESYALI,@ACIKLAMA,@KOORDINAT_X,@KOORDINAT_Y,@DURUM_ID)

	--İlana ait Resmin Kaydedilmesi
	INSERT INTO RESIM (ILAN_ID,AD,LINK) VALUES ((SELECT MAX(ID) FROM ILAN),@RESIM,'/Resources/Images/'+@RESIM)

	SET @RESULT='KAYIT BAŞARILI'
	SELECT @RESULT as RESULT
END

GO
/****** Object:  StoredProcedure [dbo].[KULLANICI_KONTROL]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[KULLANICI_KONTROL]
@KULLANICI_ADI NVARCHAR(50),
@SIFRE NVARCHAR(50)
AS
BEGIN
SELECT*FROM KULLANICI WHERE KULLANICI_ADI=@KULLANICI_ADI AND SIFRE=@SIFRE
END

GO
/****** Object:  StoredProcedure [dbo].[TAKIP_KAYIT]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TAKIP_KAYIT]
@UYE_ID int,
@IL_ID int,
@ILCE_ID int,
@DETAY nvarchar(200),
@KOORDINAT_X nvarchar(50),
@KOORDINAT_Y nvarchar(50)
AS
INSERT INTO [EMLAK].[dbo].[TAKIP] (UYE_ID,[IL_ID],[ILCE_ID],[DETAY],[KOORDINAT_X],[KOORDINAT_Y]) VALUES(@UYE_ID,@IL_ID,@ILCE_ID,@DETAY,@KOORDINAT_X,@KOORDINAT_Y)

GO
/****** Object:  StoredProcedure [dbo].[UYE_EKLE]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UYE_EKLE] --'Gökhan','Azizoğlu','ERKEK','555','Email','Kayseri',1,1,'azizoglu','123'
@AD NVARCHAR(50),
@SOYAD NVARCHAR(50),
@CINSIYET NVARCHAR(50),
@TEL_NO NVARCHAR(50),
@EMAIL NVARCHAR(50),
@ADRES NVARCHAR(150),
@IL_ID int,
@ILCE_ID int,
@KULLANICI_ADI NVARCHAR(50),
@SIFRE NVARCHAR(50),
@RESULT NVARCHAR(50)=''
AS
BEGIN
	--KULLANICI VAR MI
	IF NOT EXISTS (SELECT * FROM KULLANICI WHERE KULLANICI_ADI=@KULLANICI_ADI)
	BEGIN
		IF NOT EXISTS (SELECT * FROM BIREYSEL_UYE WHERE AD=@AD AND SOYAD=@SOYAD)
		BEGIN
			--BİREYSEL ÜYE OLUŞTURULUR
			INSERT INTO BIREYSEL_UYE (AD,SOYAD,CINSIYET,TEL_NO,EMAIL,ADRES,IL_ID,ILCE_ID)
			VALUES(@AD,@SOYAD,@CINSIYET,@TEL_NO,@EMAIL,@ADRES,@IL_ID,@ILCE_ID)

			--ÜYE TÜRÜ İLE BİRLİKTE KAYDEDİLİR
			INSERT INTO UYE (UYE_ID,UYE_TURU,UYE_DURUMU) VALUES ((SELECT MAX(ID) FROM BIREYSEL_UYE),'BİREYSEL ÜYE',1)

			--KULLANICI OLUŞTURULUR
			INSERT INTO KULLANICI (UYE_ID,YETKI_ID,KULLANICI_ADI,SIFRE) VALUES ((SELECT MAX(ID) FROM UYE),1,@KULLANICI_ADI,@SIFRE)

			SET @RESULT='KAYIT BAŞARILI'
			SELECT @RESULT AS RESULT
		END
		ELSE
		BEGIN
			SET @RESULT='BİREYSEL ÜYE MEVCTU'
			SELECT @RESULT AS RESULT
		END		
	END
	ELSE
	BEGIN
		SET @RESULT='KULLANICI MEVCUT'
		SELECT @RESULT AS RESULT
	END
	
END

GO
/****** Object:  StoredProcedure [dbo].[UYE_GUNCELLE]    Script Date: 18.07.2019 15:13:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UYE_GUNCELLE] --'Gökhan','Azizoğlu','ERKEK','555','Email','Kayseri',1,1,'azizoglu','123'
@UYE_ID INT,
@AD NVARCHAR(50),
@SOYAD NVARCHAR(50),
@CINSIYET NVARCHAR(50),
@TEL_NO NVARCHAR(50),
@EMAIL NVARCHAR(50),
@ADRES NVARCHAR(150),
@IL_ID int,
@ILCE_ID int,
@KULLANICI_ADI NVARCHAR(50),
@SIFRE NVARCHAR(50),
@RESULT NVARCHAR(50)=''
AS
BEGIN
	--BİREYSEL ÜYE OLUŞTURULUR
			UPDATE BIREYSEL_UYE SET AD=@AD,SOYAD=@SOYAD,CINSIYET=@CINSIYET,TEL_NO=@TEL_NO,EMAIL=@EMAIL,
			ADRES=@ADRES,IL_ID=@IL_ID,ILCE_ID=@ILCE_ID WHERE ID=@UYE_ID
			SET @RESULT='KAYIT BAŞARILI'
			SELECT @RESULT AS RESULT
	
END

GO
USE [master]
GO
ALTER DATABASE [EMLAK] SET  READ_WRITE 
GO
