
Create Database POSTDB
/****** Object:  Table [dbo].[PostTable]    Script Date: 12/25/20 11:56:28 PM ******/

/****** Object:  Table [dbo].[Comments]    Script Date: 12/25/20 11:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentsID] [int] IDENTITY(1,1) NOT NULL,
	[CommentsText] [nvarchar](50) NULL,
	[CommentsUser] [nvarchar](50) NULL,
	[CommentsDateTime] [datetime] NULL,
	[PostID] [int] NULL,
	[CommentsLike] [int] NULL,
	[CommentsDisLike] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PostTable]    Script Date: 12/25/20 11:56:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostTable](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[PostName] [nvarchar](max) NULL,
	[PostUser] [nvarchar](50) NULL,
	[PostDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

GO
INSERT [dbo].[Comments] ([CommentsID], [CommentsText], [CommentsUser], [CommentsDateTime], [PostID], [CommentsLike], [CommentsDisLike]) VALUES (1, N'Comments 1', N'User 1', CAST(N'2020-12-25 08:25:55.000' AS DateTime), 1, 8, 8)
GO
INSERT [dbo].[Comments] ([CommentsID], [CommentsText], [CommentsUser], [CommentsDateTime], [PostID], [CommentsLike], [CommentsDisLike]) VALUES (2, N'Comments 2', N'User 2', CAST(N'2020-12-25 08:25:55.000' AS DateTime), 1, 6, 7)
GO
INSERT [dbo].[Comments] ([CommentsID], [CommentsText], [CommentsUser], [CommentsDateTime], [PostID], [CommentsLike], [CommentsDisLike]) VALUES (3, N'Comments 3', N'User 3', CAST(N'2020-12-25 08:25:55.000' AS DateTime), 1, 11, 20)
GO
INSERT [dbo].[Comments] ([CommentsID], [CommentsText], [CommentsUser], [CommentsDateTime], [PostID], [CommentsLike], [CommentsDisLike]) VALUES (4, N'Comments 1', N'User 1', CAST(N'2020-12-25 08:25:55.000' AS DateTime), 2, 22, 3)
GO
INSERT [dbo].[Comments] ([CommentsID], [CommentsText], [CommentsUser], [CommentsDateTime], [PostID], [CommentsLike], [CommentsDisLike]) VALUES (5, N'Comments 2', N'User 2', CAST(N'2020-12-25 08:25:55.000' AS DateTime), 2, 55, 55)
GO
INSERT [dbo].[Comments] ([CommentsID], [CommentsText], [CommentsUser], [CommentsDateTime], [PostID], [CommentsLike], [CommentsDisLike]) VALUES (6, N'Comments 3', N'User 3', CAST(N'2020-12-25 08:25:55.000' AS DateTime), 2, 23, 6)
GO
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[PostTable] ON 

GO
INSERT [dbo].[PostTable] ([PostID], [PostName], [PostUser], [PostDateTime]) VALUES (1, N'Post 1', N'Admin', CAST(N'2020-12-25 08:28:03.000' AS DateTime))
GO
INSERT [dbo].[PostTable] ([PostID], [PostName], [PostUser], [PostDateTime]) VALUES (2, N'Post 2', N'Admin', CAST(N'2020-12-25 08:28:03.000' AS DateTime))
GO
INSERT [dbo].[PostTable] ([PostID], [PostName], [PostUser], [PostDateTime]) VALUES (3, N'Post 3', N'Admin', CAST(N'2020-12-25 08:28:03.000' AS DateTime))
GO
INSERT [dbo].[PostTable] ([PostID], [PostName], [PostUser], [PostDateTime]) VALUES (4, N'Post 4', N'Admin', CAST(N'2020-12-25 08:28:03.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[PostTable] OFF
GO
