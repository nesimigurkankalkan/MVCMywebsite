USE [master]
GO
/****** Object:  Database [mysite]    Script Date: 9.09.2021 11:20:44 ******/
CREATE DATABASE [mysite]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mysite', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\mysite.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'mysite_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\mysite_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [mysite] SET QUERY_STORE = OFF
GO
USE [mysite]
GO
/****** Object:  Table [dbo].[anasayfaSlider]    Script Date: 9.09.2021 11:20:45 ******/
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
/****** Object:  Table [dbo].[benkimim]    Script Date: 9.09.2021 11:20:45 ******/
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
/****** Object:  Table [dbo].[BlogYazilari]    Script Date: 9.09.2021 11:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogYazilari](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Baslik] [nvarchar](50) NULL,
	[Yazi] [nvarchar](max) NULL,
 CONSTRAINT [PK_BlogYazilari] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[egitim]    Script Date: 9.09.2021 11:20:45 ******/
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
/****** Object:  Table [dbo].[hizmetler]    Script Date: 9.09.2021 11:20:45 ******/
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
/****** Object:  Table [dbo].[iletisim]    Script Date: 9.09.2021 11:20:45 ******/
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
/****** Object:  Table [dbo].[kisisel]    Script Date: 9.09.2021 11:20:45 ******/
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
/****** Object:  Table [dbo].[KULLANICILAR]    Script Date: 9.09.2021 11:20:45 ******/
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
/****** Object:  Table [dbo].[KullaniciTurleri]    Script Date: 9.09.2021 11:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KullaniciTurleri](
	[KullaniciTuruID] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciTuruAdi] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tecrube]    Script Date: 9.09.2021 11:20:45 ******/
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
/****** Object:  Table [dbo].[yetenekler]    Script Date: 9.09.2021 11:20:45 ******/
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

INSERT [dbo].[anasayfaSlider] ([ID], [SliderBaslik], [SliderAciklama], [SliderImage], [UserID], [SliderOlusturmaTarihi], [SliderGuncellemeTarihi], [SliderSirasi], [Active]) VALUES (7, N'Gürkan Nesimi Kalkan', NULL, N'slider/img_bg_1.jpg', NULL, CAST(N'2019-04-09T11:34:36.800' AS DateTime), CAST(N'2019-04-09T13:09:50.703' AS DateTime), 1, 1)
INSERT [dbo].[anasayfaSlider] ([ID], [SliderBaslik], [SliderAciklama], [SliderImage], [UserID], [SliderOlusturmaTarihi], [SliderGuncellemeTarihi], [SliderSirasi], [Active]) VALUES (8, N'Yazılım Geliştiricisi', NULL, N'slider/img-5.jpg', NULL, CAST(N'2019-04-09T11:35:09.620' AS DateTime), CAST(N'2019-04-09T13:11:20.910' AS DateTime), 2, 1)
SET IDENTITY_INSERT [dbo].[anasayfaSlider] OFF
SET IDENTITY_INSERT [dbo].[benkimim] ON 

INSERT [dbo].[benkimim] ([id], [baslik], [uzunyazi]) VALUES (1, N'ÖN YAZI', N'Bilişim Sistemleri ve Teknolojileri konusunda akademik ve profesyonel &ccedil;alışmalar y&uuml;r&uuml;t&uuml;yorum. &Ouml;zellikle Yazılım Uzmanlığı alanında s&uuml;rekli kendimi geliştirmekte, konu ilgili eğitimimi devam ettirmekteyim. Ayrıca kurs ve seminerlere katılarak eğitimimi desteklemekteyim. Yazılım Uzmanlığı alanında s&uuml;rekli yayınları ve kitapları takip etmekteyim.. Bilgisayar ve &ccedil;eşitli teknoloji &uuml;r&uuml;nleri hakkında bilgi ve tecr&uuml;be sahibiyim. Bu konuyla ilgili alanda g&ouml;rd&uuml;ğ&uuml;m eğitimler ve iş tecr&uuml;belerim doğrultusunda sorunların &uuml;stesinden gelebilecek d&uuml;zeydeyim. Orta Duzey olarak Php, C#, Ado.Net, SQL, Mysql, Javascript ve Jquery gibi bazı k&uuml;t&uuml;phaneleri, HTML, XML, CSS, Asp.Net Mvc bilmekteyim.Buna ek olarak NoSql yapısına sahip MongoDB, JSon ve NodeJs &uuml;zerinde de kendimi geliştirmekteyim.')
SET IDENTITY_INSERT [dbo].[benkimim] OFF
SET IDENTITY_INSERT [dbo].[BlogYazilari] ON 

INSERT [dbo].[BlogYazilari] ([Id], [Baslik], [Yazi]) VALUES (1, N'Console Write Kullanımı', N'<p>Yeni bir satıra geçmeden ekrana bir çıktı üretir.</p>
    <p>Bu komut içerisinde değişkenleri de barındırabildiği gibi yapılan işlemlerin sonuçlarını ekranda gösterebilmektedir.</p>
    <br />
    <pre style="--line-num: 0; font-family: monospace;">
        <span>static void Main(string[] args)</span>
        <span>{</span>
        <span>  Console.Write("Hello World");</span>
        <span>}</span>
    </pre>')
INSERT [dbo].[BlogYazilari] ([Id], [Baslik], [Yazi]) VALUES (2, N'Console WriteLine Kullanımı', N'<p>Yeni bir satıra geçerek ekrana bir çıktı üretir.</p>
    <p>Bu komut içerisinde değişkenleri de barındırabildiği gibi yapılan işlemlerin sonuçlarını ekranda gösterebilmektedir.</p>
    <br />
    <pre style="--line-num: 0; font-family: monospace;">
    <span>static void Main(string[] args)</span>
    <span>{</span>
    <span>  Console.WriteLine("Hello World");</span>
    <span>}</span>
    </pre>')
INSERT [dbo].[BlogYazilari] ([Id], [Baslik], [Yazi]) VALUES (3, N'Console Read Kullanımı', N'<p>Kullanıcıdan int türünde veri okuması yapar.</p>
    <p>Ardından okumuş olduğu verilerin ASCII tablosundaki karşılıklarını geri döndürür.</p>
    <br />
    <pre style="--line-num: 0; font-family: monospace;">
    <span>static void Main(string[] args)</span>
    <span>{</span>
    <span>  int x = Console.Read();</span>
    <span>  Console.WriteLine(x);</span>
    <span>  Console.ReadKey();</span>
    <span>}</span>
    </pre>')
INSERT [dbo].[BlogYazilari] ([Id], [Baslik], [Yazi]) VALUES (4, N'Console ReadLine Kullanımı', N'<p>Kullanıcıdan string türünde veri okuması yapar.</p>
    <p>Ardından okumuş olduğu verinin kendisini ekranda geri döndürür.</p>
    <br />
    <pre style="--line-num: 0; font-family: monospace;">
    <span>static void Main(string[] args)</span>
    <span>{</span>
    <span>  string x = Console.ReadLine();</span>
    <span>  Console.WriteLine(x);</span>
    <span>  Console.ReadKey();</span>
    <span>}</span>
    </pre>')
INSERT [dbo].[BlogYazilari] ([Id], [Baslik], [Yazi]) VALUES (5, N'Console ReadKey Kullanımı', N'<p>Kullanıcı bir tuşa basana kadar konsol ekranında bekletir.</p>
    <p>Konsola bir işlem yaptırttığımız esnada konsolun hemen kapanmaması için tercih edilir.</p>
    <br />
    <pre style="--line-num: 0; font-family: monospace;">
    <span>static void Main(string[] args)</span>
    <span>{</span>
    <span>  Console.ReadKey();</span>
    <span>}</span>
    </pre>')
INSERT [dbo].[BlogYazilari] ([Id], [Baslik], [Yazi]) VALUES (6, N'Excel Export From DataTable', N'<p>WebForm olarak oluşturduğunuz sayfanızda Excel oluşturup bu dosyayı tarayıcıdan yüklemek isterseniz aşağıdaki kod işinize yarayacaktır.</p>
    <p>İki adet using eklenmesi gerekmekte biri Data Table için diğeri Excel''i oluşturabilmek için</p>
    <p>System.Data</p>
    <p>ClosedXML.Excel;</p>
    <br />
    <pre style="--line-num: 0; font-family: monospace;">
        <span>protected void ExportExcel(object sender, EventArgs e)</span>
        <span>{</span>
        <span>  DataTable table = new DataTable();</span>
        <span>  </span>
        <span>  DataColumn coladsoyad = new DataColumn("Ad Soyad", typeof(String));</span>
        <span>  table.Columns.Add(coladsoyad);</span>
        <span>  DataColumn coltcno = new DataColumn("TC Numarası", typeof(String));</span>
        <span>  table.Columns.Add(coltcno);</span>
        <span>  </span>
        <span>  DataRow rows = table.NewRow();</span>
        <span>  rows[0] = "Gürkan Kalkan"</span>
        <span>  rows[1] = "12345678912"</span>
        <span>  </span>
        <span>  using (XLWorkbook wb = new XLWorkbook())</span>
        <span>  {</span>
        <span>      var ws = wb.Worksheets.Add(table, "worksheet");</span>
        <span>      HttpContext.Current.Response.Clear();</span>
        <span>      HttpContext.Current.Response.Buffer = true;</span>
        <span>      HttpContext.Current.Response.Charset = "";</span>
        <span>      HttpContext.Current.Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";</span>
        <span>      HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=" + "DokumanAdi" + ".xlsx");</span>
        <span>      using (MemoryStream MyMemoryStream = new MemoryStream())</span>
        <span>      {</span>
        <span>          wb.SaveAs(MyMemoryStream);</span>
        <span>          HttpContext.Current.Response.Flush();</span>
        <span>          HttpContext.Current.Response.End();</span>
        <span>      }</span>
        <span>  }</span>
        <span>}</span>
    </pre>')
INSERT [dbo].[BlogYazilari] ([Id], [Baslik], [Yazi]) VALUES (7, N'Xml Export From DataTable', N'<p>WebForm olarak oluşturduğunuz sayfanızda Xml oluşturup bu dosyayı tarayıcıdan yüklemek isterseniz aşağıdaki kod işinize yarayacaktır.</p>
    <p>İki adet using eklenmesi gerekmekte biri Data Table için diğeri Xml''i oluşturabilmek için</p>
    <p>System.Data</p>
    <p>System.Xml</p>
    <br />
    <pre style="--line-num: 0; font-family: monospace;">
        <span>protected void ExportXml(object sender, EventArgs e)</span>
        <span>{</span>

        <span>  using (MemoryStream stream = new MemoryStream())</span>
        <span>  {   </span>
        <span>      DataTable table = new DataTable();</span>
        <span>      </span>
        <span>      DataColumn coladsoyad = new DataColumn("Ad Soyad", typeof(String));</span>
        <span>      table.Columns.Add(coladsoyad);</span>
        <span>      DataColumn coltcno = new DataColumn("TC Numarası", typeof(String));</span>
        <span>      table.Columns.Add(coltcno);</span>
        <span>      </span>
        <span>      DataRow rows = table.NewRow();</span>
        <span>      rows[0] = "Gürkan Kalkan"</span>
        <span>      rows[1] = "12345678912"</span>
        <span>      </span>
        <span>      XmlTextWriter xmlWriter = new XmlTextWriter(stream, System.Text.Encoding.UTF8);</span>
        <span>      xmlWriter.WriteStartDocument();</span>
        <span>      xmlWriter.WriteStartElement("Element1");</span>
        <span>      </span>
        <span>      for (int i = 0; i < table.Rows.Count; i++)</span>
        <span>      {</span>
        <span>          xmlWriter.WriteStartElement("kisi");</span>
        <span>          xmlWriter.WriteElementString("adsoyad", table.Rows[i][0]);</span>
        <span>          xmlWriter.WriteElementString("tcno", table.Rows[i][1]);</span>
        <span>          xmlWriter.WriteEndElement();</span>
        <span>      }</span>
        <span>      xmlWriter.WriteEndElement();</span>
        <span>      xmlWriter.WriteEndDocument();</span>
        <span>      xmlWriter.Flush();</span>
        <span>      byte[] byteArray = stream.ToArray();</span>
        <span>      Response.Clear();</span>
        <span>      Response.AddHeader("content-disposition", "attachment;filename=XMLFile.xml");</span>
        <span>      Response.AppendHeader("Content-Lenght", byteArray.Length.ToString());</span>
        <span>      Response.ContentType = "application/octet-stream";</span>
        <span>      Response.BinaryWrite(byteArray);</span>
        <span>      xmlWriter.Close();</span>
        <span>      Response.End();</span>
        <span>  }</span>
    </pre>')
SET IDENTITY_INSERT [dbo].[BlogYazilari] OFF
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
INSERT [dbo].[iletisim] ([id], [name], [email], [topic], [message], [pcname], [lanip], [wanip], [macadress]) VALUES (16, N'bbbbb', N'bbbbbb@sdsdfsdf', N'sssdd', N'sdfsdfsfdsdfdsf', N'MSI', N'192.168.1.20', N'151.250.6.174
', N'9C:B6:D0:1F:50:0F')
INSERT [dbo].[iletisim] ([id], [name], [email], [topic], [message], [pcname], [lanip], [wanip], [macadress]) VALUES (17, N'Deneme1', N'deneme1@mail.com', N'asdaskdl', N'asdasdad', N'GURKANKALKANPC', N'192.168.56.1', N'88.249.122.66
', N'18:60:24:71:4F:50')
INSERT [dbo].[iletisim] ([id], [name], [email], [topic], [message], [pcname], [lanip], [wanip], [macadress]) VALUES (18, N'Deneme2', N'deneme2@mail.com', N'allaslasdk', N'asldasdasdasdk', N'GURKANKALKANPC', N'192.168.56.1', N'::1', N'18:60:24:71:4F:50')
INSERT [dbo].[iletisim] ([id], [name], [email], [topic], [message], [pcname], [lanip], [wanip], [macadress]) VALUES (19, N'Deneme3', N'deneme3@gmail.com', N'asdasdldalsdlş', N'lasldasşdlasşldasşd', N'GURKANKALKANPC', N'::1', N'88.249.122.66
', N'18:60:24:71:4F:50')
INSERT [dbo].[iletisim] ([id], [name], [email], [topic], [message], [pcname], [lanip], [wanip], [macadress]) VALUES (20, N'Whoami', N'Drwho', N'asdasd@mail.com', N'askldaskdklasdkasldkasldk', N'GURKANKALKANPC', N'::1', N'88.249.122.66
', N'18:60:24:71:4F:50')
INSERT [dbo].[iletisim] ([id], [name], [email], [topic], [message], [pcname], [lanip], [wanip], [macadress]) VALUES (21, N'adadadada', N'adadadad@mail.com', N'asdasda', N'asdasd', N'GURKANKALKANPC', N'192.168.56.1', N'::1', N'18:60:24:71:4F:50')
INSERT [dbo].[iletisim] ([id], [name], [email], [topic], [message], [pcname], [lanip], [wanip], [macadress]) VALUES (22, N'Register', N'register@reister@gmail.com', N'RegistertRY', N'tRYreSİTER', N'GURKANKALKANPC', N'::1', N'::1', N'18:60:24:71:4F:50')
INSERT [dbo].[iletisim] ([id], [name], [email], [topic], [message], [pcname], [lanip], [wanip], [macadress]) VALUES (23, N'Register', N'register@reister@gmail.com', N'RegistertRY', N'tRYreSİTER', N'GURKANKALKANPC', N'::1', N'::1', N'18:60:24:71:4F:50')
SET IDENTITY_INSERT [dbo].[iletisim] OFF
SET IDENTITY_INSERT [dbo].[kisisel] ON 

INSERT [dbo].[kisisel] ([id], [email], [il], [ilce], [telefon]) VALUES (1, N'nesimigurkankalkan@gmail.com', N'ISTANBUL', N'Tarabya', NULL)
SET IDENTITY_INSERT [dbo].[kisisel] OFF
SET IDENTITY_INSERT [dbo].[KULLANICILAR] ON 

INSERT [dbo].[KULLANICILAR] ([ID], [KULLANICIADI], [SIFRE], [EMAIL], [TARIH], [KTURU_ID]) VALUES (1, N'gurkan', N'12349494', N'nesimigurkankalkan@gmail.com', CAST(N'2018-11-27' AS Date), 1)
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
/****** Object:  StoredProcedure [dbo].[tab1_BILGILERIGETIR]    Script Date: 9.09.2021 11:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tab1_BILGILERIGETIR]

as
begin
select SliderBaslik,SliderAciklama,SliderImage,UserID,SliderOlusturmaTarihi,SliderGuncellemeTarihi,SliderSirasi,Active from anasayfaSlider

end
GO
/****** Object:  StoredProcedure [dbo].[tab2_BILGILERIGETIR]    Script Date: 9.09.2021 11:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tab2_BILGILERIGETIR]

as
begin
select baslik,uzunyazi from benkimim

end
GO
/****** Object:  StoredProcedure [dbo].[tab3_BILGILERIGETIR]    Script Date: 9.09.2021 11:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[tab3_BILGILERIGETIR]

as
begin

select baslik,uzunyazi from egitim

end
GO
/****** Object:  StoredProcedure [dbo].[tab4_BILGILERIGETIR]    Script Date: 9.09.2021 11:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tab4_BILGILERIGETIR]

as
begin
select baslik,uzunyazi from hizmetler

end
GO
/****** Object:  StoredProcedure [dbo].[tab5_BILGILERIGETIR]    Script Date: 9.09.2021 11:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tab5_BILGILERIGETIR]

as
begin
select name,email,topic,message,pcname,lanip,wanip,macadress from iletisim

end
GO
/****** Object:  StoredProcedure [dbo].[tab6_BILGILERIGETIR]    Script Date: 9.09.2021 11:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tab6_BILGILERIGETIR]

as
begin
select email,il,ilce,telefon from kisisel

end
GO
/****** Object:  StoredProcedure [dbo].[tab7_BILGILERIGETIR]    Script Date: 9.09.2021 11:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tab7_BILGILERIGETIR]

as
begin
select KULLANICIADI,EMAIL,TARIH,KTURU_ID from KULLANICILAR

end
GO
/****** Object:  StoredProcedure [dbo].[tab8_BILGILERIGETIR]    Script Date: 9.09.2021 11:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tab8_BILGILERIGETIR]

as
begin
select baslik,tarih,uzunyazi from tecrube

end
GO
/****** Object:  StoredProcedure [dbo].[tab9_BILGILERIGETIR]    Script Date: 9.09.2021 11:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tab9_BILGILERIGETIR]

as
begin
select baslik,deger from yetenekler

end
GO
USE [master]
GO
ALTER DATABASE [mysite] SET  READ_WRITE 
GO
