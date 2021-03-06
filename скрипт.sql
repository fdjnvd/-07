USE [18ip50]
GO
/****** Object:  Table [dbo].[Автобус]    Script Date: 02.12.2021 10:24:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Автобус](
	[ID автобуса] [int] IDENTITY(1,1) NOT NULL,
	[ID водителя] [int] NULL,
	[Модель автобуса] [nvarchar](max) NULL,
	[Пассажировместимость] [int] NULL,
	[Дата проверки ТО] [date] NULL,
 CONSTRAINT [PK_Автобус] PRIMARY KEY CLUSTERED 
(
	[ID автобуса] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Билет]    Script Date: 02.12.2021 10:24:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Билет](
	[ID билета] [int] IDENTITY(1,1) NOT NULL,
	[ID пассажира] [int] NULL,
	[ID рейса] [int] NULL,
 CONSTRAINT [PK_Билет] PRIMARY KEY CLUSTERED 
(
	[ID билета] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Водители]    Script Date: 02.12.2021 10:24:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Водители](
	[ID водителя] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [nvarchar](max) NULL,
	[Имя] [nvarchar](max) NULL,
	[Отчество] [nvarchar](max) NULL,
	[Телефон] [int] NULL,
	[Водительское удостоверение] [nchar](10) NULL,
	[Паспортные данные] [int] NULL,
	[ID рейса] [int] NULL,
	[ID автобуса] [int] NULL,
 CONSTRAINT [PK_Водители] PRIMARY KEY CLUSTERED 
(
	[ID водителя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Диспетчер]    Script Date: 02.12.2021 10:24:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Диспетчер](
	[ID диспетчера] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [nchar](10) NULL,
	[Имя] [nchar](10) NULL,
	[Отчество] [nchar](10) NULL,
	[Паспортные данные] [int] NULL,
 CONSTRAINT [PK_Диспетчер] PRIMARY KEY CLUSTERED 
(
	[ID диспетчера] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Маршрут]    Script Date: 02.12.2021 10:24:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Маршрут](
	[ID маршрута] [int] IDENTITY(1,1) NOT NULL,
	[Название маршрута] [nchar](10) NULL,
	[ID рейса] [int] NULL,
	[ID автобуса] [int] NULL,
	[ID диспетчера] [int] NULL,
 CONSTRAINT [PK_Маршрут] PRIMARY KEY CLUSTERED 
(
	[ID маршрута] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пассажир]    Script Date: 02.12.2021 10:24:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пассажир](
	[ID пассажира] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [nvarchar](max) NOT NULL,
	[Имя] [nvarchar](max) NOT NULL,
	[Отчество] [nvarchar](max) NOT NULL,
	[Паспортные данные] [int] NOT NULL,
	[ID билета] [int] NOT NULL,
 CONSTRAINT [PK_Пассажир] PRIMARY KEY CLUSTERED 
(
	[ID пассажира] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пассажировместимость]    Script Date: 02.12.2021 10:24:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пассажировместимость](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Количество мест] [int] NULL,
	[Количество билетов] [int] NULL,
	[ID билета] [int] NULL,
 CONSTRAINT [PK_Пассажировместимость] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Расписание рейсов]    Script Date: 02.12.2021 10:24:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Расписание рейсов](
	[ID рейса] [int] IDENTITY(1,1) NOT NULL,
	[Время отправки] [time](7) NULL,
	[Время прибытия] [time](7) NULL,
	[Статус рейса] [nchar](10) NULL,
	[ID водителя] [int] NULL,
	[ID маршрута] [int] NULL,
	[Название рейса] [nvarchar](max) NULL,
	[ID диспетчера] [int] NOT NULL,
	[ID автобуса] [int] NULL,
	[ID билета] [int] NULL,
 CONSTRAINT [PK_Расписание рейсов] PRIMARY KEY CLUSTERED 
(
	[ID рейса] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Билет]  WITH CHECK ADD  CONSTRAINT [FK_Билет_Расписание рейсов] FOREIGN KEY([ID рейса])
REFERENCES [dbo].[Расписание рейсов] ([ID рейса])
GO
ALTER TABLE [dbo].[Билет] CHECK CONSTRAINT [FK_Билет_Расписание рейсов]
GO
ALTER TABLE [dbo].[Пассажировместимость]  WITH CHECK ADD  CONSTRAINT [FK_Пассажировместимость_Билет] FOREIGN KEY([ID билета])
REFERENCES [dbo].[Билет] ([ID билета])
GO
ALTER TABLE [dbo].[Пассажировместимость] CHECK CONSTRAINT [FK_Пассажировместимость_Билет]
GO
ALTER TABLE [dbo].[Расписание рейсов]  WITH CHECK ADD  CONSTRAINT [FK_Расписание рейсов_Автобус] FOREIGN KEY([ID автобуса])
REFERENCES [dbo].[Автобус] ([ID автобуса])
GO
ALTER TABLE [dbo].[Расписание рейсов] CHECK CONSTRAINT [FK_Расписание рейсов_Автобус]
GO
ALTER TABLE [dbo].[Расписание рейсов]  WITH CHECK ADD  CONSTRAINT [FK_Расписание рейсов_Водители] FOREIGN KEY([ID водителя])
REFERENCES [dbo].[Водители] ([ID водителя])
GO
ALTER TABLE [dbo].[Расписание рейсов] CHECK CONSTRAINT [FK_Расписание рейсов_Водители]
GO
ALTER TABLE [dbo].[Расписание рейсов]  WITH CHECK ADD  CONSTRAINT [FK_Расписание рейсов_Диспетчер] FOREIGN KEY([ID диспетчера])
REFERENCES [dbo].[Диспетчер] ([ID диспетчера])
GO
ALTER TABLE [dbo].[Расписание рейсов] CHECK CONSTRAINT [FK_Расписание рейсов_Диспетчер]
GO
ALTER TABLE [dbo].[Расписание рейсов]  WITH CHECK ADD  CONSTRAINT [FK_Расписание рейсов_Маршрут] FOREIGN KEY([ID маршрута])
REFERENCES [dbo].[Маршрут] ([ID маршрута])
GO
ALTER TABLE [dbo].[Расписание рейсов] CHECK CONSTRAINT [FK_Расписание рейсов_Маршрут]
GO
