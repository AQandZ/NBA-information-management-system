USE [master]
GO

/****** Object:  Database [NBAHUPUSIM]    ******/
CREATE DATABASE [NBAHUPUSIM]
ON  PRIMARY 
( NAME = N'NBAHUPUSIM', FILENAME = N'D:\Data\NBAHUPUSIM.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NBAHUPUSIM_log', FILENAME = N'D:\Data\NBAHUPUSIM_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

USE NBAHUPUSIM
GO

CREATE TABLE [dbo].[Users](
    [UserId] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[UserName] [varchar](50) NOT NULL,
	[UserPwd] [varchar](50) NOT NULL,
    [CreateTime] [date] DEFAULT (getdate()) NOT NULL,
	[Status] [int]  DEFAULT ((1)) NOT NULL
)
GO

CREATE TABLE [dbo].[Association](
	[AssociationId] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[AssociationName] [nvarchar](50) NOT NULL,
)
GO

CREATE TABLE [dbo].[Division](
	[DivisionId] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[DivisionName] [nvarchar](50) NOT NULL,
	[AssociationId] [int] NOT NULL FOREIGN KEY REFERENCES [dbo].[Association] ([AssociationId]),
)
GO


CREATE TABLE [dbo].[Team](
	[TeamId] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[TeamName] [nvarchar](50) NOT NULL,
    [TeamSize] [int] NULL,
	[DivisionId] [int] NOT NULL FOREIGN KEY REFERENCES [dbo].[Division] ([DivisionId])
)
GO

CREATE TABLE [dbo].[Player](
	[PlayerName] [nvarchar](50) NOT NULL,
	[PlayerEngName] [nvarchar](50) NOT NULL,
	[PlayerNo] [char](10) NOT NULL PRIMARY KEY,
	[TeamId] [int] NOT NULL FOREIGN KEY REFERENCES [dbo].[Team] ([TeamId]),
	[Age] [varchar](2) NULL,
	[Birthday] [date] NULL,
	[Height] [varchar](5) NULL,
	[Weight] [varchar](5) NULL,
	[Location] [nvarchar](50) NULL,
	[Photo] [nvarchar](50) NULL
)
GO

USE [NBAHUPUSIM]
GO

--��������Association������
Insert into Association values('����')
Insert into Association values('����')
GO

--��������Division������
Insert into Division values('̫ƽ������',1)
Insert into Division values('��������',1)
Insert into Division values('��������',1)
Insert into Division values('��������',2)
Insert into Division values('�в�����',2)
Insert into Division values('����������',2)
GO

--�������Team������
Insert into Team values('��ʿ',50,1)
Insert into Team values('����',50,1)
Insert into Team values('�촬',50,1)
Insert into Team values('����',50,1)
Insert into Team values('̫��',50,1)
Insert into Team values('���',50,2)
Insert into Team values('���',50,2)
Insert into Team values('����',50,2)
Insert into Team values('����',50,2)
Insert into Team values('Сţ',50,2)
Insert into Team values('ɭ����',50,3)
Insert into Team values('������',50,3)
Insert into Team values('����',50,3)
Insert into Team values('���',50,3)
Insert into Team values('��ʿ',50,3)
Insert into Team values('���',50,4)
Insert into Team values('�Ȼ�',50,4)
Insert into Team values('�Ʒ�',50,4)
Insert into Team values('ħ��',50,4)
Insert into Team values('��ӥ',50,4)
Insert into Team values('��ʿ',50,5)
Insert into Team values('������',50,5)
Insert into Team values('��¹',50,5)
Insert into Team values('����',50,5)
Insert into Team values('��ţ',50,5)
Insert into Team values('��������',50,6)
Insert into Team values('����',50,6)
Insert into Team values('���˹',50,6)
Insert into Team values('76��',50,6)
Insert into Team values('����',50,6)
GO

--������ԱPlayer������
Insert into Player(PlayerName,PlayerEngName,PlayerNo,TeamId,Age,Birthday,Height,Weight,Location)
values('˹�ٷ�-����','Stephen Curry','30',1,'29','1988-03-14','191','87','�������')
Insert into Player(PlayerName,PlayerEngName,PlayerNo,TeamId,Age,Birthday,Height,Weight,Location)
values('����-������','Kevin Durant','35',1,'30','1988-09-29','206','109','Сǰ��')
Insert into Player(PlayerName,PlayerEngName,PlayerNo,TeamId,Age,Birthday,Height,Weight,Location)
values('����-����ɭ','Klay Thompson','11',1,'28','1990-02-08','201','98','�÷ֺ���')
Insert into Player(PlayerName,PlayerEngName,PlayerNo,TeamId,Age,Birthday,Height,Weight,Location)
values('�����ɵ�-����','Draymond Green','23',1,'28','1990-03-04','203','105','��ǰ��')
Insert into Player(PlayerName,PlayerEngName,PlayerNo,TeamId,Age,Birthday,Height,Weight,Location)
values('������-�������','Andre Iguodala','9',1,'34','1984-01-28','199','98','�÷ֺ���')
Insert into Player(PlayerName,PlayerEngName,PlayerNo,TeamId,Age,Birthday,Height,Weight,Location)
values('��ά��-���','	JaVale McGee','1',1,'30','1988-01-19','214','123','�з�')
Insert into Player(PlayerName,PlayerEngName,PlayerNo,TeamId,Age,Birthday,Height,Weight,Location)
values('�ǵ�-����','Jordan Bell','2',1,'23','1995-01-07','206','102','��ǰ��')
Insert into Player(PlayerName,PlayerEngName,PlayerNo,TeamId,Age,Birthday,Height,Weight,Location)
values('����-Τ˹��','David West','3',1,'38','1980-08-29','206','114','��ǰ��')
Insert into Player(PlayerName,PlayerEngName,PlayerNo,TeamId,Age,Birthday,Height,Weight,Location)
values('���-��','Nick Young','6',1,'33','1985-06-01','201','98','Сǰ��')
Insert into Player(PlayerName,PlayerEngName,PlayerNo,TeamId,Age,Birthday,Height,Weight,Location)
values('����-��������','Zaza Pachulia','27',1,'34','1984-01-28','211','123','�з�')
Insert into Player(PlayerName,PlayerEngName,PlayerNo,TeamId,Age,Birthday,Height,Weight,Location)
values('ɳ��-����˹��','Shaun Livingston','34',1,'33','1985-09-11','201','88','�������')
Insert into Player(PlayerName,PlayerEngName,PlayerNo,TeamId,Age,Birthday,Height,Weight,Location)
values('�������-��','Patrick McCaw','0',1,'23','1995-10-25','201','98','�÷ֺ���')
Insert into Player(PlayerName,PlayerEngName,PlayerNo,TeamId,Age,Birthday,Height,Weight,Location)
values('������-Ӣ����ķ','Brandon Ingram','14',2,'20','1997-09-02','191','87','Сǰ��')
Insert into Player(PlayerName,PlayerEngName,PlayerNo,TeamId,Age,Birthday,Height,Weight,Location)
values('���׿�-�����','Blake Griffin','32',3,'29','1989-03-16','209','114','��ǰ��')
Insert into Player(PlayerName,PlayerEngName,PlayerNo,TeamId,Age,Birthday,Height,Weight,Location)
values('ղķ˹-����','James Harden','13',6,'29','1989-08-26','196','100','�÷ֺ���')
GO

--�����û�������
Insert into [Users](UserName,UserPwd) values('Zesen','123456')
GO

--�û��б�ķ�ҳ����
/****** Object:  StoredProcedure [dbo].[USP_GetUsersListByPage]    Script Date: 2015/11/14 0:25:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GetUsersListByPage]
	@pageIndex int ,
	@pageSize int ,
    @totalCount int  out	
AS
BEGIN
	SET NOCOUNT ON;

	declare @startIndex int ,@endIndex int 
	set @startIndex = (@pageIndex-1) * @pageSize
	set @endIndex = @pageIndex * @pageSize

    select * from ( 
		select row = ROW_NUMBER() over (order by UserId asc) ,Users.*
		from Users ) t 
     where t.row>@startIndex and t.row<=@endIndex

     select @totalCount=COUNT(*) from Users
END

GO

--������ӺŻ�ȡ����Ա�б�ķ�ҳ����
/****** Object:  StoredProcedure [dbo].[USP_GetPlayerListByPage]    Script Date: 2018/1/1 0:00:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GetPlayerListByPage]
	@pageIndex int ,
	@pageSize int ,
    @totalCount int  out,
	@TeamId int   --��ӱ��	
AS
BEGIN
	SET NOCOUNT ON;

	declare @startIndex int ,@endIndex int 
	set @startIndex = (@pageIndex-1) * @pageSize
	set @endIndex = @pageIndex * @pageSize

    select * from (
	     select row = ROW_NUMBER() over(order by (PlayerNo) desc), *
		 from Player		 
		 where TeamId = @TeamId) t 
	where t.row > @startIndex and t.row <= @endIndex

     select @totalCount = COUNT(*) 
	 from Player 
	 where TeamId = @TeamId
END
