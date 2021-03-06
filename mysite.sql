USE [master]
GO
/****** Object:  Database [mysite]    Script Date: 11.04.2019 23:23:12 ******/
CREATE DATABASE [mysite]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mysite', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\mysite.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'mysite_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\mysite_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [mysite] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mysite].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mysite] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mysite] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mysite] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mysite] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mysite] SET ARITHABORT OFF 
GO
ALTER DATABASE [mysite] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mysite] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mysite] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mysite] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mysite] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mysite] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mysite] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mysite] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mysite] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mysite] SET  DISABLE_BROKER 
GO
ALTER DATABASE [mysite] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mysite] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mysite] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mysite] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mysite] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mysite] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mysite] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mysite] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [mysite] SET  MULTI_USER 
GO
ALTER DATABASE [mysite] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mysite] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mysite] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mysite] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [mysite] SET DELAYED_DURABILITY = DISABLED 
GO
USE [mysite]
GO
/****** Object:  Table [dbo].[anasayfaSlider]    Script Date: 11.04.2019 23:23:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[anasayfaSlider](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SliderBaslik] [nvarchar](250) NULL,
	[SliderAciklama] [nvarchar](500) NULL,
	[SliderImage] [nvarchar](50) NULL,
	[UserID] [int] NULL,
	[SliderOlusturmaTarihi] [datetime] NULL,
	[SliderGuncellemeTarihi] [datetime] NULL,
	[SliderSirasi] [tinyint] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Slider] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[benkimim]    Script Date: 11.04.2019 23:23:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[benkimim](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[baslik] [text] NULL,
	[uzunyazi] [text] NULL,
 CONSTRAINT [PK_benkimim] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[egitim]    Script Date: 11.04.2019 23:23:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[egitim](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[baslik] [text] NULL,
	[uzunyazi] [text] NULL,
 CONSTRAINT [PK_egitim] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hizmetler]    Script Date: 11.04.2019 23:23:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hizmetler](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[baslik] [text] NULL,
	[uzunyazi] [text] NULL,
 CONSTRAINT [PK_hizmetler] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[iletisim]    Script Date: 11.04.2019 23:23:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iletisim](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [text] NULL,
	[email] [text] NULL,
	[topic] [text] NULL,
	[message] [text] NULL,
	[pcname] [text] NULL,
	[lanip] [text] NULL,
	[wanip] [text] NULL,
	[macadress] [text] NULL,
 CONSTRAINT [PK_iletisim] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[kisisel]    Script Date: 11.04.2019 23:23:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kisisel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [text] NULL,
	[il] [text] NULL,
	[ilce] [text] NULL,
	[telefon] [text] NULL,
 CONSTRAINT [PK_kisisel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KULLANICILAR]    Script Date: 11.04.2019 23:23:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KULLANICILAR](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KULLANICIADI] [nvarchar](50) NULL,
	[SIFRE] [nvarchar](50) NULL,
	[EMAIL] [nvarchar](50) NULL,
	[TARIH] [date] NULL,
	[KTURU_ID] [int] NULL,
 CONSTRAINT [PK_KULLANICILAR] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KullaniciTurleri]    Script Date: 11.04.2019 23:23:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KullaniciTurleri](
	[KullaniciTuruID] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciTuruAdi] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tecrube]    Script Date: 11.04.2019 23:23:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tecrube](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[baslik] [text] NULL,
	[tarih] [text] NULL,
	[uzunyazi] [text] NULL,
 CONSTRAINT [PK_tecrube] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[yetenekler]    Script Date: 11.04.2019 23:23:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yetenekler](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[baslik] [text] NULL,
	[deger] [text] NULL,
 CONSTRAINT [PK_yetenekler] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[anasayfaSlider] ON 

INSERT [dbo].[anasayfaSlider] ([ID], [SliderBaslik], [SliderAciklama], [SliderImage], [UserID], [SliderOlusturmaTarihi], [SliderGuncellemeTarihi], [SliderSirasi], [Active]) VALUES (7, N'Gürkan Nesimi Kalkan', NULL, N'slider/img_bg_1.jpg', NULL, CAST(N'2019-04-09 11:34:36.800' AS DateTime), CAST(N'2019-04-09 13:09:50.703' AS DateTime), 1, 1)
INSERT [dbo].[anasayfaSlider] ([ID], [SliderBaslik], [SliderAciklama], [SliderImage], [UserID], [SliderOlusturmaTarihi], [SliderGuncellemeTarihi], [SliderSirasi], [Active]) VALUES (8, N'Yazılım Geliştiricisi', NULL, N'slider/img-5.jpg', NULL, CAST(N'2019-04-09 11:35:09.620' AS DateTime), CAST(N'2019-04-09 13:11:20.910' AS DateTime), 2, 1)
SET IDENTITY_INSERT [dbo].[anasayfaSlider] OFF
SET IDENTITY_INSERT [dbo].[benkimim] ON 

INSERT [dbo].[benkimim] ([id], [baslik], [uzunyazi]) VALUES (1, N'ÖN YAZI', N'Bilişim Sistemleri ve Teknolojileri konusunda akademik ve profesyonel &ccedil;alışmalar y&uuml;r&uuml;t&uuml;yorum. &Ouml;zellikle Yazılım Uzmanlığı alanında s&uuml;rekli kendimi geliştirmekte, konu ilgili eğitimimi devam ettirmekteyim. Ayrıca kurs ve seminerlere katılarak eğitimimi desteklemekteyim. Yazılım Uzmanlığı alanında s&uuml;rekli yayınları ve kitapları takip etmekteyim.. Bilgisayar ve &ccedil;eşitli teknoloji &uuml;r&uuml;nleri hakkında bilgi ve tecr&uuml;be sahibiyim. Bu konuyla ilgili alanda g&ouml;rd&uuml;ğ&uuml;m eğitimler ve iş tecr&uuml;belerim doğrultusunda sorunların &uuml;stesinden gelebilecek d&uuml;zeydeyim. Orta Duzey olarak Php, C#, Ado.Net, SQL, Mysql, Javascript ve Jquery gibi bazı k&uuml;t&uuml;phaneleri, HTML, XML, CSS, Asp.Net Mvc bilmekteyim.Buna ek olarak NoSql yapısına sahip MongoDB, JSon ve NodeJs &uuml;zerinde de kendimi geliştirmekteyim.')
SET IDENTITY_INSERT [dbo].[benkimim] OFF
SET IDENTITY_INSERT [dbo].[egitim] ON 

INSERT [dbo].[egitim] ([id], [baslik], [uzunyazi]) VALUES (1, N'Beykent Üniversitesi', N'Yönetim Bilişim Sistemleri İngilizce Hazırlık bölümünü bitirerek bu bölümde okumaya hak kazandım. Ve 2019 yılında buradaki eğitim öğretimimi tamamlayarak başarıyla mezun oldum')
INSERT [dbo].[egitim] ([id], [baslik], [uzunyazi]) VALUES (2, N'Nişantaşı Üniversitesi', N'Nişantaşı &Uuml;niversitesi&#39;&#39;nden mezun olduktan sonra b&ouml;l&uuml;m değişikliği yaparak Beykent &Uuml;niversitesi Y&ouml;netim Bilişim Sistemleri&#39;&#39;ne devam etmekteyim.')
SET IDENTITY_INSERT [dbo].[egitim] OFF
SET IDENTITY_INSERT [dbo].[hizmetler] ON 

INSERT [dbo].[hizmetler] ([id], [baslik], [uzunyazi]) VALUES (1, N'UYGULAMA', N'Bir &ccedil;ok programlama dilini kullanabilmekteyim. Masa&uuml;st&uuml; uygulamaları geliştirebilmekteyim.')
INSERT [dbo].[hizmetler] ([id], [baslik], [uzunyazi]) VALUES (2, N'VERITABANI', N'MsSQL ve MySQL hakim, NoSQL veritabanları hakkında bilgi sahibiyim.')
INSERT [dbo].[hizmetler] ([id], [baslik], [uzunyazi]) VALUES (3, N'WEB SİTESİ', N'Asp.Net MVC ve Php üzerinde geliştirme yapabilmekteyim. ')
SET IDENTITY_INSERT [dbo].[hizmetler] OFF
SET IDENTITY_INSERT [dbo].[iletisim] ON 

INSERT [dbo].[iletisim] ([id], [name], [email], [topic], [message], [pcname], [lanip], [wanip], [macadress]) VALUES (1, N'NesimiGurkanKalkan', N'mail', N'Konu', N'Mesaj', N'MSI', N'10.1.22.40', N'88.255.100.146
', N'30:9C:23:15:7A:D4')
INSERT [dbo].[iletisim] ([id], [name], [email], [topic], [message], [pcname], [lanip], [wanip], [macadress]) VALUES (15, N'Ben Hakan', N'askldkalsd@akjskdja.com', N'hakan', N'ajsdhajshdjasd', N'MSI', N'192.168.1.20', N'151.250.6.32
', N'9C:B6:D0:1F:50:0F')
SET IDENTITY_INSERT [dbo].[iletisim] OFF
SET IDENTITY_INSERT [dbo].[kisisel] ON 

INSERT [dbo].[kisisel] ([id], [email], [il], [ilce], [telefon]) VALUES (1, N'nesimigurkankalkan@gmail.com', N'ISTANBUL', N'Tarabya', NULL)
SET IDENTITY_INSERT [dbo].[kisisel] OFF
SET IDENTITY_INSERT [dbo].[KULLANICILAR] ON 

INSERT [dbo].[KULLANICILAR] ([ID], [KULLANICIADI], [SIFRE], [EMAIL], [TARIH], [KTURU_ID]) VALUES (1, N'gurkan', N'12349494', N'nesimigurkankalkan@gmail.com', CAST(N'2018-11-27' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[KULLANICILAR] OFF
SET IDENTITY_INSERT [dbo].[KullaniciTurleri] ON 

INSERT [dbo].[KullaniciTurleri] ([KullaniciTuruID], [KullaniciTuruAdi]) VALUES (1, N'Admin')
INSERT [dbo].[KullaniciTurleri] ([KullaniciTuruID], [KullaniciTuruAdi]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[KullaniciTurleri] OFF
SET IDENTITY_INSERT [dbo].[tecrube] ON 

INSERT [dbo].[tecrube] ([id], [baslik], [tarih], [uzunyazi]) VALUES (1, N'Yazılım Elemanı - Infusion Bilişim ve Danışmanlık
										Limited Şirketi', N'2017-2018', N'Burada çalıştığım süre boyunca benden mevcut sitemizin labaratuar sitesini yapmam istendi. Buradaki amaç
										müşterilerimiz yapılmakta olan işlerinin hangi aşamada olduğu takip edebilmeleri ve görebilmeleri içindi.
										Bende Sublime Text adlı IDE''yi kullanarak Php ,Javascript, HTML ve Mysql veritabanını kullanarak projeyi tamamladım.
										Sadece internet sitesini değil, Admin Panelini ve veritabanını da kendim yazdım.')
INSERT [dbo].[tecrube] ([id], [baslik], [tarih], [uzunyazi]) VALUES (2, N'Yazılım Elemanı - Romsis Business Solutions', N'2017-2018', N'Burada çalıştığım süre içerisinde ADO.NET kullanarak bir kaç masaüstü projesi yaptım. Bunlardan bazıları; SQL ile öğrenci ekleme, silme , güncelleme ve not ortalamasını hesaplayan bir uygulama, mail gönderme uygulaması, MS-SQL
										veritabanını kullanarak fatura uygulaması ve son olarak yine SQL ile müşteri iş akış projesi yapmış bulunmaktayım.')
SET IDENTITY_INSERT [dbo].[tecrube] OFF
SET IDENTITY_INSERT [dbo].[yetenekler] ON 

INSERT [dbo].[yetenekler] ([id], [baslik], [deger]) VALUES (1, N'C#', N'80')
INSERT [dbo].[yetenekler] ([id], [baslik], [deger]) VALUES (2, N'OOP', N'60')
INSERT [dbo].[yetenekler] ([id], [baslik], [deger]) VALUES (3, N'Php', N'60')
INSERT [dbo].[yetenekler] ([id], [baslik], [deger]) VALUES (11, N'Html', N'100')
INSERT [dbo].[yetenekler] ([id], [baslik], [deger]) VALUES (12, N'Css', N'80')
INSERT [dbo].[yetenekler] ([id], [baslik], [deger]) VALUES (13, N'JavaScript', N'70')
SET IDENTITY_INSERT [dbo].[yetenekler] OFF
USE [master]
GO
ALTER DATABASE [mysite] SET  READ_WRITE 
GO
