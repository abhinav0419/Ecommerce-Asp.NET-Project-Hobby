IF DB_ID('Halloween') IS NOT NULL
	DROP DATABASE Halloween
	
CREATE DATABASE Halloween
GO

USE [Halloween]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/1/2013 4:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [varchar](10) NOT NULL,
	[ShortName] [varchar](15) NOT NULL,
	[LongName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 7/1/2013 4:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Email] [varchar](25) NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[Address] [varchar](40) NOT NULL,
	[City] [varchar](30) NOT NULL,
	[State] [char](2) NOT NULL,
	[ZipCode] [varchar](9) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InvoiceData]    Script Date: 7/1/2013 4:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceData](
	[SalesTax] [money] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 7/1/2013 4:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[InvoiceNumber] [int] IDENTITY(1000,1) NOT NULL,
	[CustEmail] [varchar](25) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Subtotal] [money] NOT NULL,
	[ShipMethod] [varchar](50) NOT NULL,
	[Shipping] [money] NOT NULL,
	[SalesTax] [money] NOT NULL,
	[Total] [money] NOT NULL,
	[CreditCardType] [varchar](10) NOT NULL,
	[CardNumber] [varchar](20) NOT NULL,
	[ExpirationMonth] [smallint] NOT NULL,
	[ExpirationYear] [smallint] NOT NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[InvoiceNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LineItems]    Script Date: 7/1/2013 4:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LineItems](
	[InvoiceNumber] [int] NOT NULL,
	[ProductID] [char](10) NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Extension]  AS ([UnitPrice]*[Quantity]) PERSISTED,
 CONSTRAINT [PK_LineItems] PRIMARY KEY CLUSTERED 
(
	[InvoiceNumber] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/1/2013 4:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [char](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ShortDescription] [varchar](200) NOT NULL,
	[LongDescription] [varchar](2000) NOT NULL,
	[CategoryID] [varchar](10) NOT NULL,
	[ImageFile] [varchar](30) NULL,
	[UnitPrice] [money] NOT NULL,
	[OnHand] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[States]    Script Date: 7/1/2013 4:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[States](
	[StateCode] [char](2) NOT NULL,
	[StateName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED 
(
	[StateCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Categories] ([CategoryID], [ShortName], [LongName]) VALUES (N'costumes', N'Costumes', N'Costumes')
INSERT [dbo].[Categories] ([CategoryID], [ShortName], [LongName]) VALUES (N'fx', N'FX', N'Special Effects')
INSERT [dbo].[Categories] ([CategoryID], [ShortName], [LongName]) VALUES (N'masks', N'Masks', N'Masks')
INSERT [dbo].[Categories] ([CategoryID], [ShortName], [LongName]) VALUES (N'props', N'Props', N'Props')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'A8@webemaxmjKd.com', N'Molunguri', N'A', N'1108 Johanna Bay Drive', N'Birmingham', N'AL', N'35216', N'(705) 555-5237')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'AAntosca@netYduo.com', N'Antosca', N'Andrew', N'485 Duane Terrace', N'Ann Arbor', N'MI', N'48108    ', N'(804) 555-6924')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Abdul70@matminvV.edu', N'Antony', N'Abdul', N'1109 Powderhorn Drive', N'Fayetteville', N'NC', N'28314    ', N'(409) 555-8093 ext 5')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Ajith@xgMaster.edu', N'Johnson', N'Ajith', N'2200 Old Germantown Road', N'Mcgregor', N'CA', N'55555    ', N'(600) 555-4927')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Alan@NsiYYGE.net', N'Rose', N'Alan', N'P.O. Box 8553', N'St. Petersburg', N'FL', N'33704    ', N'(608) 555-6361')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Albert@masterxmlrad.com', N'Browning', N'Albert', N'1  E. Telecom Parkway', N'Duluth', N'GA', N'30097    ', N'(303) 555-0436')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'ALitterson@mastermaster.c', N'Litterson', N'Anthony', N'901 S. National Ave.', N'Phila.', N'PA', N'19105    ', N'(401) 555-3158')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Andra91@webtechdotca.edu', N'Lee', N'Andra', N'8831 Park Central Drive', N'Beacon', N'NY', N'12508    ', N'(600) 555-6834')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Andrea c.@sWGrUDweb.com', N'Latheef', N'Andrea c.', N'17 Potter Road', N'Jacksonville', N'FL', N'32256    ', N'(805) 555-6847')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'AnSantos@QKdxdPocare.com', N'Santos', N'Anita', N'1640 Barrington Lane', N'Barrington', N'IL', N'60448    ', N'(406) 555-5539')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Anthony0@orTcradeSLiV.edu', N'Gujja', N'Anthony', N'4747 Mclane Parkway', N'Irving', N'TX', N'75038    ', N'(909) 555-2640')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'ASmith@linuxeAe.com', N'Smith', N'Arthur', N'P.O. Box 190886', N'Laurelton', N'NY', N'11413    ', N'(708) 555-6436')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Bala@EQlminXaiXEl.gov', N'Warner', N'Bala', N'Po Box 335', N'West Hartford', N'CT', N'06119    ', N'(707) 555-8720')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Barbara0@matartscare.com', N'White', N'Barbara', N'3400 Richmond Parkway #3423', N'Bristol', N'CT', N'06010    ', N'(502) 555-6947')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'BHenry@webnetduo.com', N'Henry', N'Benjamin', N'9203 Ivanhoe Road', N'Phoenix', N'AZ', N'85016    ', N'(601) 555-9203')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Bill@techcaresHUD.gov', N'Gallaspy', N'Bill', N'2794 Blarefield Driev', N'New York', N'NY', N'10041    ', N'(401) 555-2587')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'BJackson@xmlwildwild.com', N'Jackson', N'Bill', N'25-3 Latham Villiage Lane', N'Parma', N'OH', N'44134    ', N'(502) 555-6546')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'BJerome@dotmin.com', N'Jerome', N'Beverly', N'3206 Greenhollow Dr', N'Metuchen', N'NJ', N'08840    ', N'(807) 555-0036')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Brent00@assoccompmas.com', N'Wainscott', N'Brent', N'1129 Treeside Ln', N'Mahwah', N'NJ', N'07430    ', N'(805) 555-7085')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'BrThelagathoti@matzN.gov', N'Thelagathoti', N'Brad', N'2010 Glass Rd. Ne Apt 210', N'Dallas', N'TX', N'75211    ', N'(902) 555-1742')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'BSchlusselberg@radZUradmi', N'Schlusselberg', N'Brandon', N'303 South Second St.', N'Collinsville', N'IL', N'62234', N'(902) 555-3532')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Cary@webxmlmaster.edu', N'Rocca', N'Cary', N'8619 W. Summerdale  1', N'Oakland', N'CA', N'94612    ', N'(905) 555-2438')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'CaWheeler@matcareweb.edu', N'Wheeler', N'Caroline', N'185 Whiting Lane', N'Madison', N'WI', N'53704    ', N'(808) 555-6245')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'ChLoyal@VVassocLm.com', N'Loyal', N'Chang', N'R.R. 1  Box 132', N'Jacksonville', N'FL', N'32207', N'(501) 555-3840')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Chris53@kgsiwebartsd.edu', N'Mccann', N'Chris', N'Po Box 9041', N'Omaha', N'NE', N'68127    ', N'(702) 555-5148')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Christopher05@minwildobZF', N'Lumpkin', N'Christopher', N'100 Church Street', N'Columbus', N'GA', N'31901    ', N'(405) 555-8066')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'CKohli@ZQartsdot.com', N'Kohli', N'Carl', N'51 Mercedes Way', N'Hollister', N'CA', N'95023    ', N'(504) 555-9215')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'CMavraedis@dTwildKhCkli.e', N'Mavraedis', N'Charles', N'1-205 Lamoine Village', N'Cypress', N'TX', N'77429    ', N'(209) 555-9717 ext 5')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'CMyl@HqKHxNUW.net', N'Myl', N'Carolyn', N'4343 Warm Springs Rd Apt 1019', N'Butler', N'PA', N'16002    ', N'(300) 555-4411')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Craig4@fzassocLIjN.net', N'Reinarz', N'Craig', N'1339 Contra Costa Drive', N'Bernville', N'PA', N'19506    ', N'(502) 555-3000')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Dan@CMQkartscare.edu', N'Collier', N'Dan', N'7212 Dalewood Dr.', N'Duluth', N'GA', N'30097    ', N'(408) 555-4943')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Darald@DDiHYzrmaste.net', N'Curless', N'Darald', N'P.O. Box 866642', N'West Hills', N'CA', N'91304    ', N'(709) 555-9657')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'DArmalie@ShwildOHrad.com', N'Armalie', N'Dennis', N'50 East 21St Street', N'Salinas', N'CA', N'93907    ', N'(902) 555-7164')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'DBoan@wildfassocbi.edu', N'Boan', N'Dinesh', N'11582 Rusk Cove', N'Charlotte', N'NC', N'28270    ', N'(701) 555-0686')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Dhananjay01@caremat.com', N'Garcia', N'Dhananjay', N'9211 Garland', N'Columbus', N'OH', N'43216    ', N'(904) 555-0812')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Dianna33@dotausGassoc.com', N'Palanukumarasamy', N'Dianna', N'1521 W Wolfram', N'Columbia', N'SC', N'29223    ', N'(406) 555-4328')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Don@artstechfec.com', N'Sui', N'Don', N'6607 Brodis Lane  335', N'Parsippany', N'NJ', N'07054    ', N'(805) 555-9628')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Donald@XGyassocmaxm.com', N'Dardac', N'Donald', N'4232 Judah', N'Irving', N'TX', N'75038    ', N'(507) 555-8313')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Doug85@fsanHVtweb.gov', N'Drake', N'Doug', N'846 President St', N'Linden', N'NJ', N'07036    ', N'(704) 555-2277')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'EGreen@prognet.com', N'Green', N'Eduardo', N'1240 E. Diehl Road', N'Columbia', N'SC', N'29209    ', N'(204) 555-7233 ex 20')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Ellis@FfNQnetmaste.net', N'Binner', N'Ellis', N'6855 Woodland Ave', N'New Milford', N'CT', N'06776    ', N'(508) 555-7817')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'ErIvy@fZlwild.com', N'Ivy', N'Erika', N'10433 Sunnybrook Circle', N'Baltimore', N'MD', N'21207    ', N'(805) 555-3152')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'ESun@Ucare.com', N'Sun', N'Edgar', N'39 Howell Place', N'Parsippany', N'NJ', N'07054    ', N'(307) 555-2106')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'FgHidalgo@webprog.net', N'Hidalgo', N'Fgsdg', N'405 Fayette Pike', N'Austin', N'TX', N'78704    ', N'(207) 555-3177')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Frank@mastermaxmax.edu', N'Wieneke', N'Frank', N'2111 Bancroft Way', N'Birmingham', N'AL', N'35226    ', N'(700) 555-6831')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'GeStein@faOJdDbionet.com', N'Stein', N'George', N'95 Carleton St', N'New Milford', N'NJ', N'07646    ', N'(401) 555-6036')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Giridhar@webWgEIxml.com', N'Hodgkins', N'Giridhar', N'814 East Ivy Street', N'Nyc', N'NY', N'11032', N'(401) 555-6932')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'GKrani@JJcare.edu', N'Krani', N'George', N'2014 S 102Nd Street, 210 C', N'Maynard', N'MA', N'01754    ', N'(401) 555-0935')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Greg3@duowildmin.edu', N'Donahoe', N'Greg', N'P. O. Box 2600', N'St. Paul', N'MN', N'55101    ', N'(506) 555-5713')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Greiner3@bymmatweb.com', N'Briggs', N'Greiner', N'10011 Strathfield Ln', N'Vestavia', N'AL', N'35216    ', N'(706) 555-7498')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Harper1@rVtechcaredo.com', N'Kerr', N'Harper', N'Po Box 2337', N'St Albans', N'VT', N'05478    ', N'(909) 555-3686')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Heriberto0@WvEcEyminart.c', N'Larson', N'Heriberto', N'7623 Matera St #103', N'Alpine', N'AL', N'35014    ', N'(307) 555-7927')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'HNuckols@czrccuhduo.net', N'Nuckols', N'Heather', N'150 Hayes St', N'Elgin', N'IL', N'60120    ', N'(601) 555-9605')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'IlBommana@radassoc.net', N'Bommana', N'Ilya', N'1310 Brook St #2A', N'San Rafael', N'CA', N'94903    ', N'(801) 555-4078')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Jamie55@bamomaxmaxbi.com', N'Shepherd', N'Jamie', N'1341 East Thacker Street', N'Highlands Ranch', N'CO', N'80126    ', N'(404) 555-3802')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'JaTorr@minmasterGqa.gov', N'Torr', N'James', N'465 Buckland Hills Dr. Apt 311', N'Dublin', N'NY', N'90210    ', N'(602) 555-0991')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Jayagangadhara@Rprminnetp', N'Corbett', N'Jayagangadhara', N'13050 Dahlia Circle,  122', N'Sherwood', N'AK', N'72120    ', N'(606) 555-3619')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Jeff5@radJ.net', N'Travis', N'Jeff', N'3111 Monument Drive', N'Milwaukee', N'WI', N'53218    ', N'(703) 555-9233')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Jerry l.@progwildbioY.com', N'Arutla', N'Jerry l.', N'209 Ne 6Th', N'Ontario', N'CA', N'91762    ', N'(807) 555-3151')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'JiKieffer@duonethcN.edu', N'Kieffer', N'Jing peng', N'1492 Highland Lakes Trail', N'Ringgold', N'GA', N'30736    ', N'(604) 555-7102')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'JLee@jKCmaxbamo.net', N'Lee', N'Jeff', N'32 Gatehouse Lane', N'Roseville', N'CA', N'95829    ', N'(407) 555-3271')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'JoDaniels@linuxwildxml.ne', N'Daniels', N'John', N'1417 Deer Spring Court', N'Fairfax', N'VA', N'22031    ', N'(306) 555-5945')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'JoDiop@netcaremaste.edu', N'Diop', N'John', N'6318 Towncrest Court', N'South Pasadena', N'CA', N'91030    ', N'(708) 555-3166')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'John@netEw.edu', N'Blake', N'John', N'388 Sicamore', N'Fresno', N'CA', N'93704    ', N'(500) 555-2394')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'John@YOlinux.gov', N'Rampel', N'John', N'123-12 Gcp', N'Waco', N'TX', N'76710    ', N'(503) 555-0869')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'John81@mastermatweb.edu', N'Shanmugasundaram', N'John', N'6890 Deer Court', N'Glen Ellyn', N'IL', N'60137    ', N'(704) 555-5193')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Joseph4@jIHaprog.com', N'Nolan', N'Joseph', N'13 N San Marcos Rd', N'Camillus', N'NY', N'13031    ', N'(506) 555-2298')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Joseph70@netTcnMo.com', N'Boswell', N'Joseph', N'3131 E. Holcombe Blvd', N'Shelton', N'CT', N'06484    ', N'(601) 555-9365')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Karen0@techZwJzmast.net', N'Hamilton', N'Karen', N'18 Marvin Dr., Apt#B-5', N'Cincinnati', N'OH', N'45263    ', N'(506) 555-4499')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Ken15@EhHartso.net', N'Herrera', N'Ken', N'8231 Princeton Sq Blvd', N'Bridgeton', N'MO', N'63044', N'(600) 555-9024')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Kevin67@netmaxxmlpro.com', N'Hoffman', N'Kevin', N'5375 Mariners Cove Drive', N'Everett', N'MA', N'02149    ', N'(406) 555-2630')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'KHowell@bioO.gov', N'Howell', N'Kim', N'4010 Bob Wallace Ave Apt 3', N'Renton', N'WA', N'98056    ', N'(406) 555-6343')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'KMatte@assoclinuxzT.edu', N'Matte', N'Kris', N'1225 Nw Cooke Ave', N'Austin', N'TX', N'78148    ', N'(802) 555-7814')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Kristina49@matbioxmlwil.e', N'Larsen', N'Kristina', N'3325 S Douglas Av', N'San Francisco', N'CA', N'94122    ', N'(600) 555-1876')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'KVang@webVQpV.gov', N'Vang', N'Karl', N'327 Franklin Street', N'Edina', N'MN', N'55435    ', N'(409) 555-2172')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Larry37@qDGYtech.com', N'Dennis', N'Larry', N'900 Mickley Rd', N'Lafayette', N'LA', N'70506    ', N'(604) 555-4731')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Lawrence@FTkstcomplin.gov', N'Smith', N'Lawrence', N'2883 Sicamore Street', N'Fresno', N'CA', N'93711    ', N'(203) 555-6642')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'LeErpenbach@yDjxmlqfBxmi.', N'Erpenbach', N'Lee', N'901 Mission Street', N'Grants Pass', N'OR', N'97526    ', N'(800) 555-1628')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Liuy6@linuxduon.com', N'Slabicki', N'Liuy', N'1979 Marcus Ave', N'Westwood', N'NJ', N'07675    ', N'(308) 555-2900')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Lucy66@compwebKvLca.gov', N'Trasente', N'Lucy', N'51783 Se 7Th Street', N'Westerville', N'OH', N'43081    ', N'(602) 555-8853')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'M1@Atbioy.net', N'Roush', N'M', N'5111 Ambergate Ln', N'Chapin', N'SC', N'29036    ', N'(407) 555-8665')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Marie@careminprogA.com', N'Toocee', N'Marie', N'4500 Baymeadows Rd', N'Concord', N'CA', N'94519    ', N'(704) 555-8322')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Mark@artsartscomp.net', N'Bassett', N'Mark', N'12750 Fair Lakes Circle', N'Farmington', N'CT', N'06032    ', N'(403) 555-7371 x3196')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Mark@caredot.com', N'Czarnik', N'Mark', N'480 Valley Rd., A15', N'Mankato', N'MN', N'56001    ', N'(902) 555-1017')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Max28@dottechnet.gov', N'Schuh', N'Max', N'730 Opening Hill Rd', N'Lauderhill', N'FL', N'33313    ', N'(400) 555-6807')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'MCadle@progwildtech.edu', N'Cadle', N'Michael', N'572 Brook Street', N'Van Wert', N'OH', N'45891    ', N'(606) 555-5024 ext 8')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Michael@zmasterftRW.com', N'Condron', N'Michael', N'866 Butternut Dr.', N'Salinas', N'CA', N'93901    ', N'(903) 555-1090')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Mike@assocbamo.gov', N'Akkiraju', N'Mike', N'3811 N. Bell', N'Hazlet', N'NJ', N'07730    ', N'(908) 555-1452 x02')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'MMontenegro@Ebamo.edu', N'Montenegro', N'M.e', N'722 N. Broadway', N'Oakland', N'CA', N'94612    ', N'(901) 555-6080 x03')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Mohamed@maxmatmaster.com', N'Mogesa', N'Mohamed', N'9939, Fredericksburg Rd, Apt', N'Overland Park', N'KS', N'66212    ', N'(802) 555-1606-26')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Myron6@assocDCxU.gov', N'Jachimski', N'Myron', N'8000 Utopia', N'Glendale', N'AZ', N'85302    ', N'(808) 555-5676')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'N7@fassoc.net', N'Jii', N'N', N'1678 Plateau Dr', N'Dracut', N'MA', N'01826    ', N'(800) 555-1643')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Nelson9@crrdotHO.net', N'Jeffcoat', N'Nelson', N'5244 West 139Th Street', N'Portland', N'TX', N'78374    ', N'(408) 555-6768')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'NuLawrence@webrad.net', N'Lawrence', N'Nunzio', N'87 Cannon Ridge Drive', N'Woodside', N'NY', N'11377    ', N'(501) 555-6103')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'NYciano@aiaGvOfmax.gov', N'Yciano', N'Nicolette', N'1295 State Street', N'Gettysburg', N'PA', N'17325    ', N'(402) 555-2462')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Patrick04@mdBwSxmlmast.ne', N'Patthana', N'Patrick', N'124 Austin Building', N'Peoria', N'IL', N'61614    ', N'(407) 555-3635')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'PBivans@CcFradjWcomp.com', N'Bivans', N'Paul', N'17B Pauline Street', N'Columbus', N'GA', N'31909    ', N'(701) 555-5826')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'PHarris@VFcQMyFGICTL.net', N'Harris', N'Peter', N'3001 S. Congress', N'Indianapolis', N'IN', N'46237    ', N'(302) 555-0992')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Phil1@maxxmlcK.com', N'Brown', N'Phil', N'860 Summerville Rd', N'Sioux Falls', N'SD', N'57103    ', N'(403) 555-4916')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'R4@radmatC.net', N'Berry', N'R', N'513 Little Ave.', N'Paw Paw', N'MI', N'49079    ', N'(902) 555-8749')
GO
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Radhakrishna9@matcomp.net', N'King', N'Radhakrishna', N'901 S. Central Expressway', N'Charleston', N'SC', N'29407    ', N'(308) 555-3501')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Rajeev6@TLmduo.edu', N'Barrios', N'Rajeev', N'471 Regan Ln', N'Northborough', N'MA', N'01532    ', N'(902) 555-1329')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Ranji@radbamomaste.gov', N'Gross', N'Ranji', N'26 Mist Hill Drive', N'Madison', N'SD', N'57042    ', N'(309) 555-0767')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Ray@minpLXbyOmas.com', N'Ibach', N'Ray', N'43155 Wayne Stevens Rd', N'Pompton Plains', N'NJ', N'07444    ', N'(207) 555-1469')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Rhonda85@masterminduo.net', N'Chavan', N'Rhonda', N'518 Commanche Tr.', N'Greensboro', N'NC', N'27410    ', N'(503) 555-3011')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Richard9@assocxml.com', N'Bommareddy', N'Richard', N'4415 Canoga Ave', N'New York', N'NY', N'10016', N'(407) 555-1239')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'RoBenedicto@Qbio.com', N'Benedicto', N'Robert', N'4140 Alpha Road', N'Columbia', N'SC', N'29223    ', N'(508) 555-5720')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Robert04@webgMaVsraRx.com', N'Hassan', N'Robert', N'1221 Idaho St', N'Altoona', N'PA', N'16602    ', N'(902) 555-1411-7025')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Rodney43@JpEizuGm.edu', N'Baines', N'Rodney', N'502 N. Jefferson St', N'Itasca', N'IL', N'60143    ', N'(205) 555-8967 x396')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'RoGuzman@progweX.edu', N'Guzman', N'Robert', N'194 Crofton Drive', N'Evans', N'GA', N'30809    ', N'(608) 555-1877')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'RoMorgan@IMMQrRn.net', N'Morgan', N'Robert', N'48289 Fremont Blvd', N'Carrollton', N'TX', N'75006    ', N'(907) 555-0670')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'RTallada@cHKDassoca.gov', N'Tallada', N'Raghu', N'128 Greenbriar Dr', N'Madison Heights', N'MI', N'48976    ', N'(803) 555-2789')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'RWolfe@xmlwebmatp.edu', N'Wolfe', N'Randy', N'3799 Route 46 East', N'Columbus', N'GA', N'31904    ', N'(301) 555-2159')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Sam91@OSZqIKrNxmlE.gov', N'Carroll', N'Sam', N'9379 N Street', N'Long Beach', N'CA', N'90806    ', N'(407) 555-2086')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'SaWheatley@techcompprog.g', N'Wheatley', N'Sathyanarayana', N'2226 Spring Dusk Lane', N'Bloomingdale', N'NJ', N'07403    ', N'(805) 555-6416')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Scott85@ByDcV.net', N'Johnson', N'Scott', N'14 Horseshoe Lane', N'Carver', N'MA', N'02330    ', N'(201) 555-6527')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Shane4@biobamo.gov', N'Lowery', N'Shane', N'1127 Herbert J.', N'Philadelphia', N'PA', N'19153    ', N'(600) 555-8753')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'SHughes@ALlinuxduo.com', N'Hughes', N'Steve', N'21555 Oxnard Street', N'Fenton', N'MO', N'63026    ', N'(307) 555-6911 x7788')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Siddharth@progiF.gov', N'Mcdonnell', N'Siddharth', N'2616 Beeman', N'New Market', N'MD', N'21774    ', N'(504) 555-4218')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'SkAlexander@SnAVhPCD.com', N'Alexander', N'Skip', N'15 Gettysburg Square  187', N'West Hartford', N'CT', N'06107    ', N'(803) 555-5817')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Srikanth@XyRbduocare.gov', N'Brown', N'Srikanth', N'1155 Warburton Ave', N'Richmond', N'CA', N'94806    ', N'(309) 555-4108')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'StBeemer@weblinuxRxvU.gov', N'Beemer', N'Steve', N'1234 Main St', N'Watertown', N'CT', N'06795    ', N'(908) 555-8926')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Stuart1@minnet.com', N'Liao', N'Stuart', N'4070 Fisher Road', N'Charlotte', N'NC', N'28215    ', N'(708) 555-3218')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Sumanta33@matMFYbioGOE.ne', N'Robersone', N'Sumanta', N'206 Mc Lain Rd.', N'Atlanta', N'GA', N'30313    ', N'(904) 555-2979 x0024')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'TeLin@Oxrad.net', N'Lin', N'Terri', N'280 Briarcliff Rd', N'Springfield', N'IL', N'62702    ', N'(203) 555-5954')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Teresa1@matprog.gov', N'Murray', N'Teresa', N'1200 Corporate Systems Center', N'St. Louis', N'MO', N'63103    ', N'(903) 555-9363')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Timothy4@assocbio.com', N'Sellers', N'Timothy', N'13700 Sutton Park Dr N -- #322', N'Dallas', N'TX', N'75287    ', N'(207) 555-8274')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'ToBrown@linuxbioxmll.gov', N'Brown', N'Toni', N'6050 Crawfordville Rd', N'Houston', N'TX', N'77042    ', N'(309) 555-8960')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Tom6@duocarexmlxm.gov', N'Hull', N'Tom', N'301 W. Bay St.', N'Natick', N'MA', N'01760    ', N'(400) 555-3243')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Uma92@iFUJDDScfA.gov', N'Ahmed', N'Uma', N'110 Jay Dr.', N'Polk City', N'IA', N'50226    ', N'(808) 555-3272')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'VClegg@biolNE.com', N'Clegg', N'Viola', N'3635 Vista', N'Mansfield', N'MO', N'65704    ', N'(407) 555-9690')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Vito5@webEcomp.com', N'Broadhurst', N'Vito', N'300 30Th Ave. N. Apt. 4C', N'Fennimore', N'WI', N'53809    ', N'(305) 555-7255')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Walter00@webY.net', N'Cheboli', N'Walter', N'4260 Nw 32 Street', N'Mankato', N'MN', N'56002    ', N'(504) 555-3285 ext 7')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Waylon@nofmax.gov', N'Johnson', N'Waylon', N'440 Richmond Park East', N'Hamden', N'CT', N'06517', N'(605) 555-2477')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'William@linuxeBwebli.com', N'Krishnamurthy', N'William', N'1110 Ne 12Th St', N'Cranbury', N'NJ', N'08512    ', N'(403) 555-5756 ext 4')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Yolanda@ycminbamo.gov', N'Cullity', N'Yolanda', N'312 S. Combs', N'Norwood', N'MA', N'02062    ', N'(209) 555-9506')
INSERT [dbo].[Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (N'Zheng@bamonetmaste.net', N'Tonner', N'Zheng', N'57 N Plaza Blvd', N'Atlanta', N'GA', N'30339', N'(305) 555-6619')
INSERT [dbo].[InvoiceData] ([SalesTax]) VALUES (0.0750)
SET IDENTITY_INSERT [dbo].[Invoices] ON 

INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1000, N'Albert@masterxmlrad.com', CAST(0x0000A1B200000000 AS DateTime), 119.9700, N'UPS', 4.2500, 9.0000, 133.2200, N'VISA', N'1111-2222-3333-4444', 7, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1001, N'CMavraedis@dTwildKhCkli.e', CAST(0x0000A1B200000000 AS DateTime), 119.9100, N'UPS', 7.7500, 8.9900, 136.6500, N'VISA', N'1111-2222-3333-4444', 1, 2018)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1002, N'Christopher05@minwildobZF', CAST(0x0000A1B200000000 AS DateTime), 39.9900, N'UPS', 4.2500, 3.0000, 47.2400, N'VISA', N'1111-2222-3333-4444', 12, 2019)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1003, N'Greiner3@bymmatweb.com', CAST(0x0000A1B200000000 AS DateTime), 39.9900, N'UPS', 4.2500, 3.0000, 47.2400, N'VISA', N'1111-2222-3333-4444', 7, 2018)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1004, N'ErIvy@fZlwild.com', CAST(0x0000A1B200000000 AS DateTime), 129.8400, N'UPS', 6.0000, 9.7400, 145.5800, N'VISA', N'1111-2222-3333-4444', 4, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1005, N'Uma92@iFUJDDScfA.gov', CAST(0x0000A1B200000000 AS DateTime), 229.9600, N'UPS', 9.5000, 17.2500, 256.7100, N'VISA', N'1111-2222-3333-4444', 8, 2019)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1006, N'A8@webemaxmjKd.com', CAST(0x0000A1B200000000 AS DateTime), 59.9700, N'UPS', 4.2500, 4.5000, 68.7200, N'VISA', N'1111-2222-3333-4444', 1, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1007, N'Abdul70@matminvV.edu', CAST(0x0000A1B200000000 AS DateTime), 29.9900, N'UPS', 4.2500, 2.2500, 36.4900, N'VISA', N'1111-2222-3333-4444', 10, 2013)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1008, N'William@linuxeBwebli.com', CAST(0x0000A1B200000000 AS DateTime), 39.9900, N'UPS', 4.2500, 3.0000, 47.2400, N'VISA', N'1111-2222-3333-4444', 12, 2019)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1009, N'Shane4@biobamo.gov', CAST(0x0000A1B200000000 AS DateTime), 89.9700, N'UPS', 4.2500, 6.7500, 100.9700, N'VISA', N'1111-2222-3333-4444', 2, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1010, N'Brent00@assoccompmas.com', CAST(0x0000A1B200000000 AS DateTime), 69.9800, N'UPS', 4.2500, 5.2500, 79.4800, N'VISA', N'1111-2222-3333-4444', 4, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1011, N'Srikanth@XyRbduocare.gov', CAST(0x0000A1B200000000 AS DateTime), 179.9300, N'UPS', 9.5000, 13.4900, 202.9200, N'VISA', N'1111-2222-3333-4444', 1, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1012, N'DBoan@wildfassocbi.edu', CAST(0x0000A1B200000000 AS DateTime), 159.9500, N'UPS', 6.0000, 12.0000, 177.9500, N'VISA', N'1111-2222-3333-4444', 2, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1013, N'Teresa1@matprog.gov', CAST(0x0000A1B200000000 AS DateTime), 199.9700, N'UPS', 6.0000, 15.0000, 220.9700, N'VISA', N'1111-2222-3333-4444', 11, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1014, N'Robert04@webgMaVsraRx.com', CAST(0x0000A1B200000000 AS DateTime), 39.9600, N'UPS', 4.2500, 3.0000, 47.2100, N'VISA', N'1111-2222-3333-4444', 5, 2014)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1015, N'KMatte@assoclinuxzT.edu', CAST(0x0000A1B200000000 AS DateTime), 79.9900, N'UPS', 4.2500, 6.0000, 90.2400, N'VISA', N'1111-2222-3333-4444', 1, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1016, N'Dianna33@dotausGassoc.com', CAST(0x0000A1B300000000 AS DateTime), 79.9800, N'UPS', 4.2500, 6.0000, 90.2300, N'VISA', N'1111-2222-3333-4444', 8, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1017, N'John@YOlinux.gov', CAST(0x0000A1B300000000 AS DateTime), 14.9500, N'UPS', 4.2500, 1.1200, 20.3200, N'VISA', N'1111-2222-3333-4444', 7, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1018, N'StBeemer@weblinuxRxvU.gov', CAST(0x0000A1B300000000 AS DateTime), 74.9700, N'UPS', 7.7500, 5.6200, 88.3400, N'VISA', N'1111-2222-3333-4444', 10, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1019, N'Patrick04@mdBwSxmlmast.ne', CAST(0x0000A1B300000000 AS DateTime), 204.9600, N'UPS', 6.0000, 15.3700, 226.3300, N'VISA', N'1111-2222-3333-4444', 1, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1020, N'EGreen@prognet.com', CAST(0x0000A1B300000000 AS DateTime), 209.9700, N'UPS', 4.2500, 15.7500, 229.9700, N'VISA', N'1111-2222-3333-4444', 9, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1021, N'Mark@artsartscomp.net', CAST(0x0000A1B300000000 AS DateTime), 19.9900, N'UPS', 4.2500, 1.5000, 25.7400, N'VISA', N'1111-2222-3333-4444', 12, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1022, N'RTallada@cHKDassoca.gov', CAST(0x0000A1B300000000 AS DateTime), 29.9900, N'UPS', 4.2500, 2.2500, 36.4900, N'VISA', N'1111-2222-3333-4444', 6, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1023, N'NYciano@aiaGvOfmax.gov', CAST(0x0000A1B300000000 AS DateTime), 239.9400, N'UPS', 9.5000, 18.0000, 267.4400, N'VISA', N'1111-2222-3333-4444', 8, 2014)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1024, N'Joseph4@jIHaprog.com', CAST(0x0000A1B300000000 AS DateTime), 14.9500, N'UPS', 4.2500, 1.1200, 20.3200, N'VISA', N'1111-2222-3333-4444', 12, 2013)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1025, N'Jayagangadhara@Rprminnetp', CAST(0x0000A1B300000000 AS DateTime), 29.9900, N'UPS', 4.2500, 2.2500, 36.4900, N'VISA', N'1111-2222-3333-4444', 3, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1026, N'IlBommana@radassoc.net', CAST(0x0000A1B300000000 AS DateTime), 309.9500, N'UPS', 7.7500, 23.2500, 340.9500, N'VISA', N'1111-2222-3333-4444', 6, 2014)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1027, N'Craig4@fzassocLIjN.net', CAST(0x0000A1B300000000 AS DateTime), 329.9000, N'UPS', 9.5000, 24.7400, 364.1400, N'VISA', N'1111-2222-3333-4444', 8, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1028, N'Greiner3@bymmatweb.com', CAST(0x0000A1B400000000 AS DateTime), 519.8000, N'UPS', 9.5000, 38.9800, 568.2800, N'VISA', N'1111-2222-3333-4444', 5, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1029, N'Jamie55@bamomaxmaxbi.com', CAST(0x0000A1B400000000 AS DateTime), 249.9600, N'UPS', 6.0000, 18.7500, 274.7100, N'VISA', N'1111-2222-3333-4444', 6, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1030, N'Timothy4@assocbio.com', CAST(0x0000A1B400000000 AS DateTime), 179.9600, N'UPS', 6.0000, 13.5000, 199.4600, N'VISA', N'1111-2222-3333-4444', 7, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1031, N'Scott85@ByDcV.net', CAST(0x0000A1B400000000 AS DateTime), 39.9900, N'UPS', 4.2500, 3.0000, 47.2400, N'VISA', N'1111-2222-3333-4444', 11, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1032, N'JoDaniels@linuxwildxml.ne', CAST(0x0000A1B400000000 AS DateTime), 169.9600, N'UPS', 6.0000, 12.7500, 188.7100, N'VISA', N'1111-2222-3333-4444', 7, 2014)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1033, N'MCadle@progwildtech.edu', CAST(0x0000A1B500000000 AS DateTime), 14.9500, N'UPS', 4.2500, 1.1200, 20.3200, N'VISA', N'1111-2222-3333-4444', 8, 2018)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1034, N'JiKieffer@duonethcN.edu', CAST(0x0000A1B500000000 AS DateTime), 14.9500, N'UPS', 4.2500, 1.1200, 20.3200, N'VISA', N'1111-2222-3333-4444', 12, 2013)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1035, N'SkAlexander@SnAVhPCD.com', CAST(0x0000A1B500000000 AS DateTime), 69.9900, N'UPS', 4.2500, 5.2500, 79.4900, N'VISA', N'1111-2222-3333-4444', 6, 2013)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1036, N'HNuckols@czrccuhduo.net', CAST(0x0000A1B500000000 AS DateTime), 94.9600, N'UPS', 6.0000, 7.1200, 108.0800, N'VISA', N'1111-2222-3333-4444', 9, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1037, N'Dianna33@dotausGassoc.com', CAST(0x0000A1B500000000 AS DateTime), 94.9600, N'UPS', 7.7500, 7.1200, 109.8300, N'VISA', N'1111-2222-3333-4444', 5, 2019)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1038, N'AnSantos@QKdxdPocare.com', CAST(0x0000A1B500000000 AS DateTime), 64.9700, N'UPS', 7.7500, 4.8700, 77.5900, N'VISA', N'1111-2222-3333-4444', 4, 2019)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1039, N'N7@fassoc.net', CAST(0x0000A1B500000000 AS DateTime), 64.9800, N'UPS', 6.0000, 4.8700, 75.8500, N'VISA', N'1111-2222-3333-4444', 12, 2013)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1040, N'Andrea c.@sWGrUDweb.com', CAST(0x0000A1B500000000 AS DateTime), 354.9500, N'UPS', 6.0000, 26.6200, 387.5700, N'VISA', N'1111-2222-3333-4444', 6, 2019)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1041, N'PBivans@CcFradjWcomp.com', CAST(0x0000A1B500000000 AS DateTime), 339.9600, N'UPS', 6.0000, 25.5000, 371.4600, N'VISA', N'1111-2222-3333-4444', 5, 2014)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1042, N'Karen0@techZwJzmast.net', CAST(0x0000A1B500000000 AS DateTime), 14.9900, N'UPS', 4.2500, 1.1200, 20.3600, N'VISA', N'1111-2222-3333-4444', 11, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1043, N'CaWheeler@matcareweb.edu', CAST(0x0000A1B500000000 AS DateTime), 69.9900, N'UPS', 4.2500, 5.2500, 79.4900, N'VISA', N'1111-2222-3333-4444', 10, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1044, N'RoGuzman@progweX.edu', CAST(0x0000A1B500000000 AS DateTime), 179.9700, N'UPS', 4.2500, 13.5000, 197.7200, N'VISA', N'1111-2222-3333-4444', 4, 2018)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1045, N'Liuy6@linuxduon.com', CAST(0x0000A1B500000000 AS DateTime), 221.8300, N'UPS', 9.5000, 16.6400, 247.9700, N'VISA', N'1111-2222-3333-4444', 10, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1046, N'BrThelagathoti@matzN.gov', CAST(0x0000A1B500000000 AS DateTime), 69.9900, N'UPS', 4.2500, 5.2500, 79.4900, N'VISA', N'1111-2222-3333-4444', 9, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1047, N'GKrani@JJcare.edu', CAST(0x0000A1B500000000 AS DateTime), 79.9800, N'UPS', 4.2500, 6.0000, 90.2300, N'VISA', N'1111-2222-3333-4444', 7, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1048, N'Sumanta33@matMFYbioGOE.ne', CAST(0x0000A1B500000000 AS DateTime), 13.9900, N'UPS', 4.2500, 1.0500, 19.2900, N'VISA', N'1111-2222-3333-4444', 11, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1049, N'Jerry l.@progwildbioY.com', CAST(0x0000A1B500000000 AS DateTime), 29.9900, N'UPS', 4.2500, 2.2500, 36.4900, N'VISA', N'1111-2222-3333-4444', 4, 2018)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1050, N'Richard9@assocxml.com', CAST(0x0000A1B600000000 AS DateTime), 353.9400, N'UPS', 7.7500, 26.5500, 388.2400, N'VISA', N'1111-2222-3333-4444', 5, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1051, N'Frank@mastermaxmax.edu', CAST(0x0000A1B600000000 AS DateTime), 59.9700, N'UPS', 4.2500, 4.5000, 68.7200, N'VISA', N'1111-2222-3333-4444', 4, 2014)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1052, N'SHughes@ALlinuxduo.com', CAST(0x0000A1B600000000 AS DateTime), 134.9500, N'UPS', 7.7500, 10.1200, 152.8200, N'VISA', N'1111-2222-3333-4444', 11, 2014)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1053, N'Ajith@xgMaster.edu', CAST(0x0000A1B600000000 AS DateTime), 14.9500, N'UPS', 4.2500, 1.1200, 20.3200, N'VISA', N'1111-2222-3333-4444', 5, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1054, N'SaWheatley@techcompprog.g', CAST(0x0000A1B600000000 AS DateTime), 39.9900, N'UPS', 4.2500, 3.0000, 47.2400, N'VISA', N'1111-2222-3333-4444', 8, 2019)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1055, N'BJackson@xmlwildwild.com', CAST(0x0000A1B600000000 AS DateTime), 57.9500, N'UPS', 6.0000, 4.3500, 68.3000, N'VISA', N'1111-2222-3333-4444', 12, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1056, N'Ranji@radbamomaste.gov', CAST(0x0000A1B600000000 AS DateTime), 69.9700, N'UPS', 7.7500, 5.2500, 82.9700, N'VISA', N'1111-2222-3333-4444', 1, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1057, N'Siddharth@progiF.gov', CAST(0x0000A1B600000000 AS DateTime), 173.9400, N'UPS', 7.7500, 13.0500, 194.7400, N'VISA', N'1111-2222-3333-4444', 10, 2013)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1058, N'Bill@techcaresHUD.gov', CAST(0x0000A1B600000000 AS DateTime), 104.9300, N'UPS', 7.7500, 7.8700, 120.5500, N'VISA', N'1111-2222-3333-4444', 6, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1059, N'TeLin@Oxrad.net', CAST(0x0000A1B600000000 AS DateTime), 29.9800, N'UPS', 4.2500, 2.2500, 36.4800, N'VISA', N'1111-2222-3333-4444', 8, 2013)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1060, N'Lawrence@FTkstcomplin.gov', CAST(0x0000A1B600000000 AS DateTime), 19.9900, N'UPS', 4.2500, 1.5000, 25.7400, N'VISA', N'1111-2222-3333-4444', 3, 2019)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1061, N'Vito5@webEcomp.com', CAST(0x0000A1B600000000 AS DateTime), 129.9300, N'UPS', 7.7500, 9.7400, 147.4200, N'VISA', N'1111-2222-3333-4444', 4, 2018)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1062, N'PHarris@VFcQMyFGICTL.net', CAST(0x0000A1B600000000 AS DateTime), 339.9300, N'UPS', 7.7500, 25.4900, 373.1700, N'VISA', N'1111-2222-3333-4444', 3, 2019)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1063, N'Tom6@duocarexmlxm.gov', CAST(0x0000A1B600000000 AS DateTime), 59.9800, N'UPS', 4.2500, 4.5000, 68.7300, N'VISA', N'1111-2222-3333-4444', 10, 2018)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1064, N'BSchlusselberg@radZUradmi', CAST(0x0000A1B600000000 AS DateTime), 34.9900, N'UPS', 4.2500, 2.6200, 41.8600, N'VISA', N'1111-2222-3333-4444', 10, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1065, N'Jeff5@radJ.net', CAST(0x0000A1B600000000 AS DateTime), 109.9600, N'UPS', 6.0000, 8.2500, 124.2100, N'VISA', N'1111-2222-3333-4444', 7, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1066, N'Yolanda@ycminbamo.gov', CAST(0x0000A1B600000000 AS DateTime), 529.9200, N'UPS', 9.5000, 39.7400, 579.1600, N'VISA', N'1111-2222-3333-4444', 3, 2019)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1067, N'Joseph70@netTcnMo.com', CAST(0x0000A1B600000000 AS DateTime), 59.9800, N'UPS', 6.0000, 4.5000, 70.4800, N'VISA', N'1111-2222-3333-4444', 1, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1068, N'JLee@jKCmaxbamo.net', CAST(0x0000A1B600000000 AS DateTime), 14.9500, N'UPS', 4.2500, 1.1200, 20.3200, N'VISA', N'1111-2222-3333-4444', 7, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1069, N'BJerome@dotmin.com', CAST(0x0000A1B600000000 AS DateTime), 249.9400, N'UPS', 7.7500, 18.7500, 276.4400, N'VISA', N'1111-2222-3333-4444', 5, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1070, N'KVang@webVQpV.gov', CAST(0x0000A1B600000000 AS DateTime), 33.9800, N'UPS', 6.0000, 2.5500, 42.5300, N'VISA', N'1111-2222-3333-4444', 7, 2014)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1071, N'LeErpenbach@yDjxmlqfBxmi.', CAST(0x0000A1B700000000 AS DateTime), 159.9600, N'UPS', 4.2500, 12.0000, 176.2100, N'VISA', N'1111-2222-3333-4444', 4, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1072, N'Kristina49@matbioxmlwil.e', CAST(0x0000A1B700000000 AS DateTime), 64.8300, N'UPS', 6.0000, 4.8600, 75.6900, N'VISA', N'1111-2222-3333-4444', 10, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1073, N'Barbara0@matartscare.com', CAST(0x0000A1B700000000 AS DateTime), 24.9900, N'UPS', 4.2500, 1.8700, 31.1100, N'VISA', N'1111-2222-3333-4444', 2, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1074, N'VClegg@biolNE.com', CAST(0x0000A1B700000000 AS DateTime), 159.9600, N'UPS', 4.2500, 12.0000, 176.2100, N'VISA', N'1111-2222-3333-4444', 9, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1075, N'RWolfe@xmlwebmatp.edu', CAST(0x0000A1B700000000 AS DateTime), 64.9800, N'UPS', 6.0000, 4.8700, 75.8500, N'VISA', N'1111-2222-3333-4444', 8, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1076, N'Mike@assocbamo.gov', CAST(0x0000A1B700000000 AS DateTime), 229.9600, N'UPS', 6.0000, 17.2500, 253.2100, N'VISA', N'1111-2222-3333-4444', 2, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1077, N'John@netEw.edu', CAST(0x0000A1B700000000 AS DateTime), 239.9400, N'UPS', 6.0000, 18.0000, 263.9400, N'VISA', N'1111-2222-3333-4444', 1, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1078, N'ESun@Ucare.com', CAST(0x0000A1B700000000 AS DateTime), 19.9900, N'UPS', 4.2500, 1.5000, 25.7400, N'VISA', N'1111-2222-3333-4444', 10, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1079, N'KHowell@bioO.gov', CAST(0x0000A1B700000000 AS DateTime), 144.9300, N'UPS', 7.7500, 10.8700, 163.5500, N'VISA', N'1111-2222-3333-4444', 1, 2014)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1080, N'FgHidalgo@webprog.net', CAST(0x0000A1B700000000 AS DateTime), 135.9500, N'UPS', 6.0000, 10.2000, 152.1500, N'VISA', N'1111-2222-3333-4444', 6, 2014)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1081, N'Stuart1@minnet.com', CAST(0x0000A1B700000000 AS DateTime), 39.9900, N'UPS', 4.2500, 3.0000, 47.2400, N'VISA', N'1111-2222-3333-4444', 8, 2019)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1082, N'RoBenedicto@Qbio.com', CAST(0x0000A1B700000000 AS DateTime), 149.9600, N'UPS', 7.7500, 11.2500, 168.9600, N'VISA', N'1111-2222-3333-4444', 4, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1083, N'Donald@XGyassocmaxm.com', CAST(0x0000A1B700000000 AS DateTime), 24.9900, N'UPS', 4.2500, 1.8700, 31.1100, N'VISA', N'1111-2222-3333-4444', 9, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1084, N'Walter00@webY.net', CAST(0x0000A1B700000000 AS DateTime), 329.9400, N'UPS', 6.0000, 24.7500, 360.6900, N'VISA', N'1111-2222-3333-4444', 7, 2018)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1085, N'Ray@minpLXbyOmas.com', CAST(0x0000A1B700000000 AS DateTime), 249.9300, N'UPS', 7.7500, 18.7400, 276.4200, N'VISA', N'1111-2222-3333-4444', 9, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1086, N'CMyl@HqKHxNUW.net', CAST(0x0000A1B700000000 AS DateTime), 39.9900, N'UPS', 4.2500, 3.0000, 47.2400, N'VISA', N'1111-2222-3333-4444', 3, 2014)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1087, N'Waylon@nofmax.gov', CAST(0x0000A1B700000000 AS DateTime), 164.8200, N'UPS', 6.0000, 12.3600, 183.1800, N'VISA', N'1111-2222-3333-4444', 4, 2018)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1088, N'LeErpenbach@yDjxmlqfBxmi.', CAST(0x0000A1B800000000 AS DateTime), 169.9700, N'UPS', 6.0000, 12.7500, 188.7200, N'VISA', N'1111-2222-3333-4444', 3, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1089, N'Richard9@assocxml.com', CAST(0x0000A1B800000000 AS DateTime), 109.8900, N'UPS', 6.0000, 8.2400, 124.1300, N'VISA', N'1111-2222-3333-4444', 9, 2013)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1090, N'Marie@careminprogA.com', CAST(0x0000A1B800000000 AS DateTime), 209.9500, N'UPS', 7.7500, 15.7500, 233.4500, N'VISA', N'1111-2222-3333-4444', 6, 2019)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1091, N'JaTorr@minmasterGqa.gov', CAST(0x0000A1B800000000 AS DateTime), 89.9700, N'UPS', 4.2500, 6.7500, 100.9700, N'VISA', N'1111-2222-3333-4444', 11, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1092, N'Rajeev6@TLmduo.edu', CAST(0x0000A1B800000000 AS DateTime), 189.9500, N'UPS', 7.7500, 14.2500, 211.9500, N'VISA', N'1111-2222-3333-4444', 5, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1093, N'Anthony0@orTcradeSLiV.edu', CAST(0x0000A1B800000000 AS DateTime), 209.9400, N'UPS', 6.0000, 15.7500, 231.6900, N'VISA', N'1111-2222-3333-4444', 12, 2014)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1094, N'Mark@caredot.com', CAST(0x0000A1B800000000 AS DateTime), 79.9900, N'UPS', 4.2500, 6.0000, 90.2400, N'VISA', N'1111-2222-3333-4444', 3, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1095, N'RoMorgan@IMMQrRn.net', CAST(0x0000A1B800000000 AS DateTime), 19.9900, N'UPS', 4.2500, 1.5000, 25.7400, N'VISA', N'1111-2222-3333-4444', 8, 2013)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1096, N'AAntosca@netYduo.com', CAST(0x0000A1B800000000 AS DateTime), 133.8800, N'UPS', 9.5000, 10.0400, 153.4200, N'VISA', N'1111-2222-3333-4444', 10, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1097, N'DArmalie@ShwildOHrad.com', CAST(0x0000A1B800000000 AS DateTime), 159.9700, N'UPS', 6.0000, 12.0000, 177.9700, N'VISA', N'1111-2222-3333-4444', 10, 2018)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1098, N'Rodney43@JpEizuGm.edu', CAST(0x0000A1B800000000 AS DateTime), 119.9600, N'UPS', 4.2500, 9.0000, 133.2100, N'VISA', N'1111-2222-3333-4444', 7, 2014)
GO
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1099, N'CKohli@ZQartsdot.com', CAST(0x0000A1B800000000 AS DateTime), 19.9900, N'UPS', 4.2500, 1.5000, 25.7400, N'VISA', N'1111-2222-3333-4444', 7, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1100, N'M1@Atbioy.net', CAST(0x0000A1B800000000 AS DateTime), 34.9900, N'UPS', 4.2500, 2.6200, 41.8600, N'VISA', N'1111-2222-3333-4444', 2, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1101, N'R4@radmatC.net', CAST(0x0000A1B800000000 AS DateTime), 154.9500, N'UPS', 7.7500, 11.6200, 174.3200, N'VISA', N'1111-2222-3333-4444', 2, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1102, N'Lucy66@compwebKvLca.gov', CAST(0x0000A1B800000000 AS DateTime), 59.9700, N'UPS', 4.2500, 4.5000, 68.7200, N'VISA', N'1111-2222-3333-4444', 11, 2013)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1103, N'Rhonda85@masterminduo.net', CAST(0x0000A1B800000000 AS DateTime), 41.9700, N'UPS', 4.2500, 3.1500, 49.3700, N'VISA', N'1111-2222-3333-4444', 10, 2014)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1104, N'Nelson9@crrdotHO.net', CAST(0x0000A1B800000000 AS DateTime), 29.9700, N'UPS', 4.2500, 2.2500, 36.4700, N'VISA', N'1111-2222-3333-4444', 5, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1105, N'Kevin67@netmaxxmlpro.com', CAST(0x0000A1B800000000 AS DateTime), 84.9600, N'UPS', 6.0000, 6.3700, 97.3300, N'VISA', N'1111-2222-3333-4444', 7, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1106, N'ASmith@linuxeAe.com', CAST(0x0000A1B900000000 AS DateTime), 29.9900, N'UPS', 4.2500, 2.2500, 36.4900, N'VISA', N'1111-2222-3333-4444', 4, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1107, N'Zheng@bamonetmaste.net', CAST(0x0000A1B900000000 AS DateTime), 39.9900, N'UPS', 4.2500, 3.0000, 47.2400, N'VISA', N'1111-2222-3333-4444', 3, 2014)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1108, N'MCadle@progwildtech.edu', CAST(0x0000A1B900000000 AS DateTime), 94.9800, N'UPS', 6.0000, 7.1200, 108.1000, N'VISA', N'1111-2222-3333-4444', 9, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1109, N'ToBrown@linuxbioxmll.gov', CAST(0x0000A1B900000000 AS DateTime), 119.8500, N'UPS', 4.2500, 8.9900, 133.0900, N'VISA', N'1111-2222-3333-4444', 5, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1110, N'JoDiop@netcaremaste.edu', CAST(0x0000A1B900000000 AS DateTime), 9.9900, N'UPS', 4.2500, 0.7500, 14.9900, N'VISA', N'1111-2222-3333-4444', 7, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1111, N'Don@artstechfec.com', CAST(0x0000A1B900000000 AS DateTime), 29.9700, N'UPS', 4.2500, 2.2500, 36.4700, N'VISA', N'1111-2222-3333-4444', 8, 2019)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1112, N'Ellis@FfNQnetmaste.net', CAST(0x0000A1B900000000 AS DateTime), 119.9300, N'UPS', 6.0000, 8.9900, 134.9200, N'VISA', N'1111-2222-3333-4444', 2, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1113, N'John81@mastermatweb.edu', CAST(0x0000A1B900000000 AS DateTime), 79.9900, N'UPS', 4.2500, 6.0000, 90.2400, N'VISA', N'1111-2222-3333-4444', 5, 2018)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1114, N'PHarris@VFcQMyFGICTL.net', CAST(0x0000A1BA00000000 AS DateTime), 413.9500, N'UPS', 7.7500, 31.0500, 452.7500, N'VISA', N'1111-2222-3333-4444', 11, 2014)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1115, N'Dan@CMQkartscare.edu', CAST(0x0000A1BA00000000 AS DateTime), 159.9800, N'UPS', 4.2500, 12.0000, 176.2300, N'VISA', N'1111-2222-3333-4444', 8, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1116, N'MMontenegro@Ebamo.edu', CAST(0x0000A1BA00000000 AS DateTime), 59.9900, N'UPS', 4.2500, 4.5000, 68.7400, N'VISA', N'1111-2222-3333-4444', 11, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1117, N'Max28@dottechnet.gov', CAST(0x0000A1BA00000000 AS DateTime), 99.9900, N'UPS', 4.2500, 7.5000, 111.7400, N'VISA', N'1111-2222-3333-4444', 5, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1118, N'Heriberto0@WvEcEyminart.c', CAST(0x0000A1BA00000000 AS DateTime), 219.9300, N'UPS', 6.0000, 16.4900, 242.4200, N'VISA', N'1111-2222-3333-4444', 8, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1119, N'Myron6@assocDCxU.gov', CAST(0x0000A1BA00000000 AS DateTime), 29.9900, N'UPS', 4.2500, 2.2500, 36.4900, N'VISA', N'1111-2222-3333-4444', 4, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1120, N'Giridhar@webWgEIxml.com', CAST(0x0000A1BA00000000 AS DateTime), 139.9800, N'UPS', 4.2500, 10.5000, 154.7300, N'VISA', N'1111-2222-3333-4444', 8, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1121, N'Ken15@EhHartso.net', CAST(0x0000A1BA00000000 AS DateTime), 44.8500, N'UPS', 4.2500, 3.3600, 52.4600, N'VISA', N'1111-2222-3333-4444', 12, 2019)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1122, N'Doug85@fsanHVtweb.gov', CAST(0x0000A1BA00000000 AS DateTime), 79.9900, N'UPS', 4.2500, 6.0000, 90.2400, N'VISA', N'1111-2222-3333-4444', 5, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1123, N'Phil1@maxxmlcK.com', CAST(0x0000A1BA00000000 AS DateTime), 79.9900, N'UPS', 6.0000, 6.0000, 91.9900, N'VISA', N'1111-2222-3333-4444', 12, 2014)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1124, N'Cary@webxmlmaster.edu', CAST(0x0000A1BA00000000 AS DateTime), 159.9800, N'UPS', 4.2500, 12.0000, 176.2300, N'VISA', N'1111-2222-3333-4444', 10, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1125, N'Michael@zmasterftRW.com', CAST(0x0000A1BA00000000 AS DateTime), 69.9900, N'UPS', 4.2500, 5.2500, 79.4900, N'VISA', N'1111-2222-3333-4444', 1, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1126, N'NuLawrence@webrad.net', CAST(0x0000A1BA00000000 AS DateTime), 29.9900, N'UPS', 4.2500, 2.2500, 36.4900, N'VISA', N'1111-2222-3333-4444', 12, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1127, N'Andra91@webtechdotca.edu', CAST(0x0000A1BA00000000 AS DateTime), 39.9900, N'UPS', 4.2500, 3.0000, 47.2400, N'VISA', N'1111-2222-3333-4444', 1, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1128, N'Larry37@qDGYtech.com', CAST(0x0000A1BA00000000 AS DateTime), 59.9900, N'UPS', 4.2500, 4.5000, 68.7400, N'VISA', N'1111-2222-3333-4444', 3, 2016)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1129, N'LeErpenbach@yDjxmlqfBxmi.', CAST(0x0000A1BA00000000 AS DateTime), 73.9700, N'UPS', 6.0000, 5.5500, 85.5200, N'VISA', N'1111-2222-3333-4444', 11, 2013)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1130, N'Radhakrishna9@matcomp.net', CAST(0x0000A1BA00000000 AS DateTime), 19.9900, N'UPS', 4.2500, 1.5000, 25.7400, N'VISA', N'1111-2222-3333-4444', 8, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1131, N'ALitterson@mastermaster.c', CAST(0x0000A1BA00000000 AS DateTime), 69.9900, N'UPS', 4.2500, 5.2500, 79.4900, N'VISA', N'1111-2222-3333-4444', 2, 2018)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1132, N'BHenry@webnetduo.com', CAST(0x0000A1BA00000000 AS DateTime), 119.7900, N'UPS', 6.0000, 8.9800, 134.7700, N'VISA', N'1111-2222-3333-4444', 9, 2018)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1133, N'Dhananjay01@caremat.com', CAST(0x0000A1BA00000000 AS DateTime), 14.9900, N'UPS', 4.2500, 1.1200, 20.3600, N'VISA', N'1111-2222-3333-4444', 8, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1134, N'Jamie55@bamomaxmaxbi.com', CAST(0x0000A1BB00000000 AS DateTime), 79.9800, N'UPS', 4.2500, 6.0000, 90.2300, N'VISA', N'1111-2222-3333-4444', 11, 2014)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1135, N'Sam91@OSZqIKrNxmlE.gov', CAST(0x0000A1BB00000000 AS DateTime), 59.9700, N'UPS', 4.2500, 4.5000, 68.7200, N'VISA', N'1111-2222-3333-4444', 9, 2013)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1136, N'GeStein@faOJdDbionet.com', CAST(0x0000A1BB00000000 AS DateTime), 39.9900, N'UPS', 4.2500, 3.0000, 47.2400, N'VISA', N'1111-2222-3333-4444', 12, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1137, N'Mohamed@maxmatmaster.com', CAST(0x0000A1BB00000000 AS DateTime), 199.9800, N'UPS', 4.2500, 15.0000, 219.2300, N'VISA', N'1111-2222-3333-4444', 6, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1138, N'Greg3@duowildmin.edu', CAST(0x0000A1BB00000000 AS DateTime), 114.9500, N'UPS', 7.7500, 8.6200, 131.3200, N'VISA', N'1111-2222-3333-4444', 7, 2013)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1139, N'ASmith@linuxeAe.com', CAST(0x0000A1BB00000000 AS DateTime), 79.9800, N'UPS', 4.2500, 6.0000, 90.2300, N'VISA', N'1111-2222-3333-4444', 9, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1140, N'Alan@NsiYYGE.net', CAST(0x0000A1BB00000000 AS DateTime), 324.9400, N'UPS', 7.7500, 24.3700, 357.0600, N'VISA', N'1111-2222-3333-4444', 6, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1141, N'Darald@DDiHYzrmaste.net', CAST(0x0000A1BB00000000 AS DateTime), 199.9000, N'UPS', 7.7500, 14.9900, 222.6400, N'VISA', N'1111-2222-3333-4444', 3, 2015)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1142, N'Harper1@rVtechcaredo.com', CAST(0x0000A1BB00000000 AS DateTime), 223.9200, N'UPS', 9.5000, 16.7900, 250.2100, N'VISA', N'1111-2222-3333-4444', 11, 2018)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1143, N'Bala@EQlminXaiXEl.gov', CAST(0x0000A1BB00000000 AS DateTime), 239.9600, N'UPS', 4.2500, 18.0000, 262.2100, N'VISA', N'1111-2222-3333-4444', 3, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1144, N'Chris53@kgsiwebartsd.edu', CAST(0x0000A1BB00000000 AS DateTime), 184.9500, N'UPS', 7.7500, 13.8700, 206.5700, N'VISA', N'1111-2222-3333-4444', 7, 2019)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1145, N'Lawrence@FTkstcomplin.gov', CAST(0x0000A1BC00000000 AS DateTime), 29.9900, N'UPS', 4.2500, 2.2500, 36.4900, N'VISA', N'1111-2222-3333-4444', 5, 2017)
INSERT [dbo].[Invoices] ([InvoiceNumber], [CustEmail], [OrderDate], [Subtotal], [ShipMethod], [Shipping], [SalesTax], [Total], [CreditCardType], [CardNumber], [ExpirationMonth], [ExpirationYear]) VALUES (1146, N'ChLoyal@VVassocLm.com', CAST(0x0000A1BC00000000 AS DateTime), 44.8500, N'UPS', 4.2500, 3.3600, 52.4600, N'VISA', N'1111-2222-3333-4444', 12, 2014)
SET IDENTITY_INSERT [dbo].[Invoices] OFF
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1000, N'frankc01  ', 39.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1001, N'head02    ', 29.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1001, N'rat01     ', 14.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1001, N'skel01    ', 14.9500, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1002, N'super01   ', 39.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1003, N'mum01     ', 39.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1004, N'fogj01    ', 9.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1004, N'skullfog01', 39.9500, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1005, N'fog01     ', 34.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1005, N'jar01     ', 59.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1005, N'tlm01     ', 99.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1006, N'cat01     ', 19.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1007, N'head01    ', 29.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1008, N'frankc01  ', 39.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1009, N'head02    ', 29.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1010, N'fog01     ', 34.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1011, N'fogj01    ', 9.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1011, N'head01    ', 29.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1011, N'mum01     ', 39.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1011, N'super01   ', 39.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1012, N'arm01     ', 19.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1012, N'super01   ', 39.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1013, N'hippie01  ', 79.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1013, N'jar01     ', 59.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1014, N'fogj01    ', 9.9900, 4)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1015, N'hippie01  ', 79.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1016, N'super01   ', 39.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1017, N'skel01    ', 14.9500, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1018, N'arm01     ', 19.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1018, N'bl01      ', 24.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1018, N'fred01    ', 29.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1019, N'bl01      ', 24.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1019, N'jar01     ', 59.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1020, N'bats01    ', 69.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1021, N'rat02     ', 19.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1022, N'fred01    ', 29.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1023, N'cat01     ', 19.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1023, N'frankc01  ', 39.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1023, N'pow01     ', 79.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1023, N'rat02     ', 19.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1024, N'skel01    ', 14.9500, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1025, N'fred01    ', 29.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1026, N'jar01     ', 59.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1026, N'martian01 ', 69.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1026, N'super01   ', 39.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1027, N'bats01    ', 69.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1027, N'cat01     ', 19.9900, 4)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1027, N'fog01     ', 34.9900, 4)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1027, N'mum01     ', 39.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1028, N'jar01     ', 59.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1028, N'pow01     ', 79.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1028, N'skullfog01', 39.9500, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1028, N'tlm01     ', 99.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1029, N'bats01    ', 69.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1029, N'jar01     ', 59.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1030, N'fogj01    ', 9.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1030, N'hippie01  ', 79.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1031, N'frankc01  ', 39.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1032, N'fred01    ', 29.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1032, N'hippie01  ', 79.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1033, N'skel01    ', 14.9500, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1034, N'skel01    ', 14.9500, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1035, N'bats01    ', 69.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1036, N'fog01     ', 34.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1036, N'rat02     ', 19.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1037, N'bl01      ', 24.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1037, N'head02    ', 29.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1037, N'rat01     ', 14.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1038, N'fred01    ', 29.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1038, N'rat01     ', 14.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1038, N'rat02     ', 19.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1039, N'fog01     ', 34.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1039, N'fred01    ', 29.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1040, N'fog01     ', 34.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1040, N'hippie01  ', 79.9900, 4)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1041, N'bats01    ', 69.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1041, N'tlm01     ', 99.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1042, N'rat01     ', 14.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1043, N'bats01    ', 69.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1044, N'jar01     ', 59.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1045, N'head02    ', 29.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1045, N'skel01    ', 14.9500, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1045, N'str01     ', 13.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1045, N'super01   ', 39.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1046, N'bats01    ', 69.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1047, N'frankc01  ', 39.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1048, N'str01     ', 13.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1049, N'head02    ', 29.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1050, N'jar01     ', 59.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1050, N'martian01 ', 69.9900, 4)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1050, N'str01     ', 13.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1051, N'arm01     ', 19.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1052, N'bl01      ', 24.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1052, N'head01    ', 29.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1052, N'rat02     ', 19.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1053, N'skel01    ', 14.9500, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1054, N'super01   ', 39.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1055, N'fogj01    ', 9.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1055, N'str01     ', 13.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1056, N'fogj01    ', 9.9900, 1)
GO
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1056, N'head01    ', 29.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1057, N'cat01     ', 19.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1057, N'str01     ', 13.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1057, N'super01   ', 39.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1058, N'fog01     ', 34.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1058, N'head02    ', 29.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1058, N'skullfog01', 39.9500, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1059, N'rat01     ', 14.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1060, N'arm01     ', 19.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1061, N'bats01    ', 69.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1061, N'cat01     ', 19.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1061, N'skullfog01', 39.9500, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1062, N'arm01     ', 19.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1062, N'bats01    ', 69.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1062, N'martian01 ', 69.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1063, N'head02    ', 29.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1064, N'fog01     ', 34.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1065, N'bl01      ', 24.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1065, N'head02    ', 29.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1066, N'bats01    ', 69.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1066, N'head02    ', 29.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1066, N'tlm01     ', 99.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1067, N'cat01     ', 19.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1067, N'frankc01  ', 39.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1068, N'skel01    ', 14.9500, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1069, N'head02    ', 29.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1069, N'pow01     ', 79.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1069, N'super01   ', 39.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1070, N'rat02     ', 19.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1070, N'str01     ', 13.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1071, N'frankc01  ', 39.9900, 4)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1072, N'fogj01    ', 9.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1072, N'skel01    ', 14.9500, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1073, N'bl01      ', 24.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1074, N'super01   ', 39.9900, 4)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1075, N'bl01      ', 24.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1075, N'frankc01  ', 39.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1076, N'arm01     ', 19.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1076, N'martian01 ', 69.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1077, N'fred01    ', 29.9900, 4)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1077, N'jar01     ', 59.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1078, N'rat02     ', 19.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1079, N'arm01     ', 19.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1079, N'rat01     ', 14.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1079, N'super01   ', 39.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1080, N'pow01     ', 79.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1080, N'str01     ', 13.9900, 4)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1081, N'super01   ', 39.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1082, N'arm01     ', 19.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1082, N'head02    ', 29.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1082, N'martian01 ', 69.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1083, N'bl01      ', 24.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1084, N'head02    ', 29.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1084, N'pow01     ', 79.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1085, N'bl01      ', 24.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1085, N'fog01     ', 34.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1085, N'super01   ', 39.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1086, N'super01   ', 39.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1087, N'frankc01  ', 39.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1087, N'skel01    ', 14.9500, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1088, N'fred01    ', 29.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1088, N'martian01 ', 69.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1089, N'head02    ', 29.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1089, N'skullfog01', 39.9500, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1090, N'arm01     ', 19.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1090, N'head01    ', 29.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1090, N'martian01 ', 69.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1091, N'head02    ', 29.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1092, N'frankc01  ', 39.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1092, N'head02    ', 29.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1092, N'jar01     ', 59.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1093, N'frankc01  ', 39.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1093, N'fred01    ', 29.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1094, N'hippie01  ', 79.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1095, N'cat01     ', 19.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1096, N'mum01     ', 39.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1096, N'skullfog01', 39.9500, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1096, N'str01     ', 13.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1097, N'martian01 ', 69.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1097, N'rat02     ', 19.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1098, N'fred01    ', 29.9900, 4)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1099, N'arm01     ', 19.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1100, N'fog01     ', 34.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1101, N'fog01     ', 34.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1101, N'fred01    ', 29.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1101, N'head02    ', 29.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1102, N'rat02     ', 19.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1103, N'str01     ', 13.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1104, N'fogj01    ', 9.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1105, N'bl01      ', 24.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1105, N'fogj01    ', 9.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1106, N'head01    ', 29.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1107, N'mum01     ', 39.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1108, N'bats01    ', 69.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1108, N'bl01      ', 24.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1109, N'skullfog01', 39.9500, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1110, N'fogj01    ', 9.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1111, N'fogj01    ', 9.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1112, N'mum01     ', 39.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1112, N'skullfog01', 39.9500, 1)
GO
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1113, N'pow01     ', 79.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1114, N'str01     ', 13.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1114, N'tlm01     ', 99.9900, 4)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1115, N'pow01     ', 79.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1116, N'jar01     ', 59.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1117, N'tlm01     ', 99.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1118, N'arm01     ', 19.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1118, N'frankc01  ', 39.9900, 4)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1119, N'fred01    ', 29.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1120, N'martian01 ', 69.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1121, N'skel01    ', 14.9500, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1122, N'hippie01  ', 79.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1123, N'pow01     ', 79.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1124, N'hippie01  ', 79.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1125, N'bats01    ', 69.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1126, N'head02    ', 29.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1127, N'super01   ', 39.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1128, N'jar01     ', 59.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1129, N'head01    ', 29.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1129, N'str01     ', 13.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1130, N'cat01     ', 19.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1131, N'bats01    ', 69.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1132, N'jar01     ', 59.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1132, N'skel01    ', 14.9500, 4)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1133, N'rat01     ', 14.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1134, N'mum01     ', 39.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1135, N'arm01     ', 19.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1136, N'super01   ', 39.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1137, N'tlm01     ', 99.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1138, N'arm01     ', 19.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1138, N'rat01     ', 14.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1138, N'super01   ', 39.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1139, N'mum01     ', 39.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1140, N'bl01      ', 24.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1140, N'cat01     ', 19.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1140, N'martian01 ', 69.9900, 4)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1141, N'cat01     ', 19.9900, 4)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1141, N'hippie01  ', 79.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1141, N'skullfog01', 39.9500, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1142, N'fogj01    ', 9.9900, 2)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1142, N'head02    ', 29.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1142, N'mum01     ', 39.9900, 4)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1142, N'str01     ', 13.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1143, N'jar01     ', 59.9900, 4)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1144, N'bl01      ', 24.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1144, N'head01    ', 29.9900, 3)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1144, N'martian01 ', 69.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1145, N'head02    ', 29.9900, 1)
INSERT [dbo].[LineItems] ([InvoiceNumber], [ProductID], [UnitPrice], [Quantity]) VALUES (1146, N'skel01    ', 14.9500, 3)
INSERT [dbo].[Products] ([ProductID], [Name], [ShortDescription], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'arm01     ', N'Freddie Arm', N'Life-size Freddy arm', N'This arm will give people nightmares, and not just on Elm street!', N'props', N'arm1.jpg', 20.9500, 200)
INSERT [dbo].[Products] ([ProductID], [Name], [ShortDescription], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'bats01    ', N'Flying Bats', N'Bats flying in front of moon', N'Bats flying in front of a full moon make for an eerie spectacle.', N'props', N'cool1.jpg', 69.9900, 25)
INSERT [dbo].[Products] ([ProductID], [Name], [ShortDescription], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'bl01      ', N'Black Light', N'Black light with base', N'Create that creepy glow-in-the-dark effect with this powerful black light.', N'fx', N'blacklight1.jpg', 19.9900, 200)
INSERT [dbo].[Products] ([ProductID], [Name], [ShortDescription], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'cat01     ', N'Deranged Cat', N'20" Ugly cat', N'This cat provides its own light and is perfect for a backyard haunting.', N'props', N'cat1.jpg', 19.9900, 45)
INSERT [dbo].[Products] ([ProductID], [Name], [ShortDescription], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'fog01     ', N'Fog Machine', N'600W Fog machine', N'The perfect fog machine for the home haunter.', N'fx', N'fog1.jpg', 34.9900, 100)
INSERT [dbo].[Products] ([ProductID], [Name], [ShortDescription], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'fogj01    ', N'Fog Juice (1qt)', N'1 qt Bottle of fog juice', N'Fill up your fog machine to create an eerie affect.', N'fx', N'fogjuice1.jpg', 9.9900, 500)
INSERT [dbo].[Products] ([ProductID], [Name], [ShortDescription], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'frankc01  ', N'Frankenstein', N'Frankenstein costume', N'Have all your friends screaming "It''s alive!"', N'costumes', N'frank1.jpg', 39.9900, 100)
INSERT [dbo].[Products] ([ProductID], [Name], [ShortDescription], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'fred01    ', N'Freddie', N'Freddie Krueger mask', N'The ultimate in monster-movie bad guys.', N'masks', N'freddy1.jpg', 29.9900, 50)
INSERT [dbo].[Products] ([ProductID], [Name], [ShortDescription], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'head01    ', N'Michael Head', N'Mini Michael Meyers head', N'For classic horror lovers! The infamous Halloween murderer''s shrunken head is a perfect party prop.', N'props', N'head1.jpg', 29.9900, 100)
INSERT [dbo].[Products] ([ProductID], [Name], [ShortDescription], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'head02    ', N'Saw Head', N'Jigsaw head scale replica', N'Perfect for getting a point across. Don''t take this guy for granted!', N'props', N'head2.jpg', 29.9900, 100)
INSERT [dbo].[Products] ([ProductID], [Name], [ShortDescription], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'hippie01  ', N'Hippie', N'Women''s hippie costume', N'Share the peace and love in this hippie costume straight from the 60''s.', N'costumes', N'hippie1.jpg', 79.9900, 40)
INSERT [dbo].[Products] ([ProductID], [Name], [ShortDescription], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'jar01     ', N'JarJar', N'Jar Jar Binks', N'Meesa happy to sees you ata Big Halloweenie Party!', N'costumes', N'jarjar1.jpg', 59.9900, 25)
INSERT [dbo].[Products] ([ProductID], [Name], [ShortDescription], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'martian01 ', N'Martian', N'Martian costume', N'Now includes an exclusive  Illodium Q-36 Explosive Space Modulator!', N'costumes', N'martian1.jpg', 69.9900, 100)
INSERT [dbo].[Products] ([ProductID], [Name], [ShortDescription], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'mum01     ', N'Mummy', N'Mummy mask', N'All wrapped up and nowhere to go.', N'masks', N'mummy1.jpg', 39.9900, 30)
INSERT [dbo].[Products] ([ProductID], [Name], [ShortDescription], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'pow01     ', N'Austin Powers', N'Austin Powers costume', N'Be the most shagadelic guest at this year''s party, baby.', N'costumes', N'powers1.jpg', 79.9900, 25)
INSERT [dbo].[Products] ([ProductID], [Name], [ShortDescription], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'rat01     ', N'Ugly Rat', N'16" Rat', N'This guy is sure to shorten the stay of any unwanted house guests.', N'props', N'rat1.jpg', 14.9900, 75)
INSERT [dbo].[Products] ([ProductID], [Name], [ShortDescription], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'rat02     ', N'Uglier Rat', N'20" Rat', N'Yuch! This one will keep you awake at night.', N'props', N'rat2.jpg', 19.9900, 50)
INSERT [dbo].[Products] ([ProductID], [Name], [ShortDescription], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'skel01    ', N'Life-size Skeleton', N'Life-size plastic skeleton', N'This blown plastic skeleton will be the life of the party. Use him as is or dress him up for an even better effect.', N'props', N'skel1.jpg', 14.9500, 10)
INSERT [dbo].[Products] ([ProductID], [Name], [ShortDescription], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'skullfog01', N'Skull Fogger', N'2,800 cubic foot fogger', N'This fogger puts out a whopping 2,800 cubic feet of fog per minute. Comes with a 10-foot remote control.', N'fx', N'skullfog1.jpg', 39.9500, 50)
INSERT [dbo].[Products] ([ProductID], [Name], [ShortDescription], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'str01     ', N'Mini-strobe', N'Black mini strobe light', N'Perfect for creating that spot flash effect. Includes mounting bracket.', N'fx', N'strobe1.jpg', 13.9900, 200)
INSERT [dbo].[Products] ([ProductID], [Name], [ShortDescription], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'super01   ', N'Superman', N'Superman costume', N'Look, up in the sky...it''s a bird...it''s a plane...No, it''s you in this fantastic Superman costume!', N'costumes', N'superman1.jpg', 39.9900, 100)
INSERT [dbo].[Products] ([ProductID], [Name], [ShortDescription], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'tlm01     ', N'T&L Machine', N'Thunder & Lightning machine', N'Flash! Boom! Create your own realistic thunder and lightning effects!', N'fx', N'tlm1.jpg', 99.9900, 10)
INSERT [dbo].[Products] ([ProductID], [Name], [ShortDescription], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (N'vader01   ', N'Darth Vader Mask', N'The legendary Darth Vader', N'OB1 has taught you well, young Skywalker.', N'masks', N'vader1.jpg', 19.9900, 100)
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'AK', N'Alaska')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'AL', N'Alabama')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'AR', N'Arkansas')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'AZ', N'Arizona')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'CA', N'California')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'CO', N'Colorado')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'CT', N'Connecticut')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'DC', N'District of Columbia')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'DE', N'Delaware')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'FL', N'Florida')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'GA', N'Georgia')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'HI', N'Hawaii')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'IA', N'Iowa')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'ID', N'Idaho')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'IL', N'Illinois')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'IN', N'Indiana')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'KS', N'Kansas')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'KY', N'Kentucky')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'LA', N'Lousiana')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'MA', N'Massachusetts')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'MD', N'Maryland')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'ME', N'Maine')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'MI', N'Michigan')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'MN', N'Minnesota')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'MO', N'Missouri')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'MS', N'Mississippi')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'MT', N'Montana')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'NC', N'North Carolina')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'ND', N'North Dakota')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'NE', N'Nebraska')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'NH', N'New Hampshire')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'NJ', N'New Jersey')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'NM', N'New Mexico')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'NV', N'Nevada')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'NY', N'New York')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'OH', N'Ohio')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'OK', N'Oklahoma')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'OR', N'Oregon')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'PA', N'Pennsylvania')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'RI', N'Rhode Island')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'SC', N'South Carolina')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'SD', N'South Dakota')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'TN', N'Tennessee')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'TX', N'Texas')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'UT', N'Utah')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'VA', N'Virginia')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'VI', N'Virgin Islands')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'VT', N'Vermont')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'WA', N'Washington')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'WI', N'Wisconsin')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'WV', N'West Virginia')
INSERT [dbo].[States] ([StateCode], [StateName]) VALUES (N'WY', N'Wyoming')
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_States] FOREIGN KEY([State])
REFERENCES [dbo].[States] ([StateCode])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_States]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_Customers] FOREIGN KEY([CustEmail])
REFERENCES [dbo].[Customers] ([Email])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_Customers]
GO
ALTER TABLE [dbo].[LineItems]  WITH NOCHECK ADD  CONSTRAINT [FK_LineItems_Invoices] FOREIGN KEY([InvoiceNumber])
REFERENCES [dbo].[Invoices] ([InvoiceNumber])
GO
ALTER TABLE [dbo].[LineItems] CHECK CONSTRAINT [FK_LineItems_Invoices]
GO
ALTER TABLE [dbo].[LineItems]  WITH NOCHECK ADD  CONSTRAINT [FK_LineItems_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[LineItems] CHECK CONSTRAINT [FK_LineItems_Products]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
