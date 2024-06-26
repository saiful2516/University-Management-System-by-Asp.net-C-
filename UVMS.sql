USE [master]
GO
/****** Object:  Database [UVMS]    Script Date: 4/21/2018 9:51:29 PM ******/
CREATE DATABASE [UVMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UVMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\UVMS.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UVMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\UVMS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UVMS] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UVMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UVMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UVMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UVMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UVMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UVMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [UVMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UVMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UVMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UVMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UVMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UVMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UVMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UVMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UVMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UVMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UVMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UVMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UVMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UVMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UVMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UVMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UVMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UVMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UVMS] SET  MULTI_USER 
GO
ALTER DATABASE [UVMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UVMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UVMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UVMS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [UVMS] SET DELAYED_DURABILITY = DISABLED 
GO
USE [UVMS]
GO
/****** Object:  Table [dbo].[AllocateRoom_tbl]    Script Date: 4/21/2018 9:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AllocateRoom_tbl](
	[AllocateRoomId] [int] IDENTITY(1,1) NOT NULL,
	[Dept_Id] [int] NOT NULL,
	[Course_Id] [int] NOT NULL,
	[RoomNo_Id] [int] NOT NULL,
	[DayId] [int] NOT NULL,
	[TimeFrom] [varchar](50) NOT NULL,
	[TimeTo] [varchar](50) NOT NULL,
	[AllocationStatus] [int] NOT NULL,
 CONSTRAINT [PK_AllocateRoom_tbl] PRIMARY KEY CLUSTERED 
(
	[AllocateRoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Course_tbl]    Script Date: 4/21/2018 9:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course_tbl](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseCode] [varchar](50) NOT NULL,
	[CourseName] [varchar](150) NOT NULL,
	[CourseCredit] [decimal](18, 2) NOT NULL,
	[CourseDesc] [text] NULL,
	[Dept_Id] [int] NOT NULL,
	[Sem_Id] [int] NOT NULL,
 CONSTRAINT [PK_Course_tbl] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CourseAssign_tbl]    Script Date: 4/21/2018 9:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseAssign_tbl](
	[AssignId] [int] IDENTITY(1,1) NOT NULL,
	[Dept_Id] [int] NOT NULL,
	[AssignTeacherId] [int] NOT NULL,
	[AssignCourseId] [int] NOT NULL,
	[AssignCourseStatus] [int] NOT NULL,
	[AssignCredit] [decimal](18, 2) NULL,
 CONSTRAINT [PK_CourseAssign_tbl] PRIMARY KEY CLUSTERED 
(
	[AssignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Day_tbl]    Script Date: 4/21/2018 9:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Day_tbl](
	[DId] [int] IDENTITY(1,1) NOT NULL,
	[DayName] [varchar](50) NULL,
 CONSTRAINT [PK_Day_tbl] PRIMARY KEY CLUSTERED 
(
	[DId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department_tbl]    Script Date: 4/21/2018 9:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department_tbl](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentCode] [varchar](50) NOT NULL,
	[DepartmentName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Department_tbl] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designation_tbl]    Script Date: 4/21/2018 9:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designation_tbl](
	[DesignationId] [int] IDENTITY(1,1) NOT NULL,
	[DesignationName] [varchar](150) NULL,
 CONSTRAINT [PK_Designation_tbl] PRIMARY KEY CLUSTERED 
(
	[DesignationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EnrollCourse_table]    Script Date: 4/21/2018 9:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EnrollCourse_table](
	[EnrollId] [int] IDENTITY(1,1) NOT NULL,
	[StudentRegNo] [varchar](50) NOT NULL,
	[EnrollCourseId] [int] NOT NULL,
	[EnrollDate] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EnrollCourse_table] PRIMARY KEY CLUSTERED 
(
	[EnrollId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IdCounter_tbl]    Script Date: 4/21/2018 9:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IdCounter_tbl](
	[SlNo] [int] IDENTITY(1,1) NOT NULL,
	[Dept_Id] [int] NOT NULL,
	[Year] [varchar](50) NOT NULL,
	[CountNo] [int] NOT NULL,
 CONSTRAINT [PK_IdCounter_tbl] PRIMARY KEY CLUSTERED 
(
	[SlNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Room_tbl]    Script Date: 4/21/2018 9:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Room_tbl](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[RoomNo] [varchar](50) NULL,
 CONSTRAINT [PK_Room_tbl] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Semester_tbl]    Script Date: 4/21/2018 9:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Semester_tbl](
	[SemesterId] [int] IDENTITY(1,1) NOT NULL,
	[SemesterName] [varchar](50) NULL,
 CONSTRAINT [PK_Semester_tbl] PRIMARY KEY CLUSTERED 
(
	[SemesterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student_tbl]    Script Date: 4/21/2018 9:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student_tbl](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[RegistrationNumber] [varchar](50) NOT NULL,
	[StudentName] [varchar](150) NULL,
	[StudentEmail] [varchar](50) NULL,
	[StudentPhone] [varchar](20) NULL,
	[RegisDate] [date] NULL,
	[StudentAddress] [text] NULL,
	[Dept_Id] [int] NOT NULL,
 CONSTRAINT [PK_Student_tbl] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentResult]    Script Date: 4/21/2018 9:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentResult](
	[ResultId] [int] IDENTITY(1,1) NOT NULL,
	[StudentRegNo] [varchar](50) NOT NULL,
	[Course_Id] [int] NOT NULL,
	[GradeLetter] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StudentResult] PRIMARY KEY CLUSTERED 
(
	[ResultId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teacher_tbl]    Script Date: 4/21/2018 9:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher_tbl](
	[TeacherId] [int] IDENTITY(1,1) NOT NULL,
	[TeacherName] [varchar](150) NOT NULL,
	[Address] [text] NULL,
	[Email] [varchar](50) NOT NULL,
	[MobileNo] [varchar](50) NOT NULL,
	[Desg_Id] [int] NOT NULL,
	[Dept_Id] [int] NOT NULL,
	[TeacherCredit] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Teacher_tbl] PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[AssignCourseWithTeacher]    Script Date: 4/21/2018 9:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AssignCourseWithTeacher] AS
SELECT dept.*,teacher.TeacherId,teacher.TeacherName,teacher.TeacherCredit,course.CourseId,CourseCode,course.CourseName,course.CourseCredit
From Department_tbl as dept
LEFT JOIN Teacher_tbl as teacher ON teacher.Dept_Id = dept.DepartmentId
Left JOIN Course_tbl as course ON course.Dept_Id = dept.DepartmentId

GO
/****** Object:  View [dbo].[ViewAllocateRoom]    Script Date: 4/21/2018 9:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewAllocateRoom] AS
SELECT course.CourseId,course.CourseCode,course.CourseName,dept.DepartmentId,dept.DepartmentName,'R. No: '+room.RoomNo+', '+daytbl.DayName+', '+allocate.TimeFrom+' - '+allocate.TimeTo as timetable
From AllocateRoom_tbl as allocate
LEFT JOIN Department_tbl as dept ON dept.DepartmentId = allocate.Dept_Id
Left JOIN Course_tbl as course ON course.CourseId = allocate.Course_Id
Left JOIN Room_tbl as room ON room.RoomId = allocate.RoomNo_Id
Left JOIN Day_tbl as daytbl ON daytbl.DId = allocate.DayId

GO
/****** Object:  View [dbo].[ViewAllocateRoomWithCourse]    Script Date: 4/21/2018 9:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewAllocateRoomWithCourse] AS
SELECT course.CourseId,course.CourseCode,course.CourseName,dept.DepartmentId,dept.DepartmentName,allocate.AllocationStatus,
timeschedule=STUFF((SELECT DISTINCT ' || ' + CAST('R. No: '+room.RoomNo+', '+daytbl.DayName+', '+CONVERT(varchar(15),  CAST(allocate.TimeFrom AS TIME), 100)+' - '+CONVERT(varchar(15),  CAST(allocate.TimeTo AS TIME), 100) AS VARCHAR(MAX)) FROM Course_tbl course, AllocateRoom_tbl t2 WHERE course.CourseId = allocate.Course_Id FOR XML PATH('') ),1,1,'' ) FROM Course_tbl course
Left JOIN AllocateRoom_tbl as allocate ON allocate.Course_Id = course.CourseId
LEFT JOIN Department_tbl as dept ON dept.DepartmentId = course.Dept_Id
Left JOIN Room_tbl as room ON room.RoomId = allocate.RoomNo_Id
Left JOIN Day_tbl as daytbl ON daytbl.DId = allocate.DayId

GO
/****** Object:  View [dbo].[ViewCourse_Dept_Sem]    Script Date: 4/21/2018 9:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewCourse_Dept_Sem] AS
SELECT course.CourseId,course.CourseCode,course.CourseName,course.CourseCredit,course.CourseDesc,dept.DepartmentId,dept.DepartmentName,sem.SemesterId,sem.SemesterName
From Course_tbl as course
LEFT JOIN Department_tbl as dept ON dept.DepartmentId = course.Dept_Id
Left JOIN Semester_tbl as sem ON sem.SemesterId = course.Sem_Id

GO
/****** Object:  View [dbo].[ViewCourseAssignInfo]    Script Date: 4/21/2018 9:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewCourseAssignInfo] AS
SELECT MAX(dept.DepartmentId) as DepartmentId,MAX(dept.DepartmentName) as DepartmentName,MAX(teacher.TeacherId) as TeacherId,MAX(teacher.TeacherName) as TeacherName,course.CourseId,MAX(course.CourseCode)as CourseCode,MAX(course.CourseName) as CourseName,MAX(assign.AssignCourseStatus) as AssignCourseStatus,MAX(sem.SemesterName) as SemesterName
From Department_tbl as dept
Left JOIN Course_tbl as course ON course.Dept_Id = dept.DepartmentId
LEFT JOIN CourseAssign_tbl as assign ON assign.AssignCourseId = course.CourseId
LEFT JOIN Teacher_tbl as teacher ON teacher.TeacherId = assign.AssignTeacherId
Left JOIN Semester_tbl as sem ON sem.SemesterId = course.Sem_Id
GROUP BY course.CourseId

GO
/****** Object:  View [dbo].[ViewEnrollCourse_Student]    Script Date: 4/21/2018 9:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewEnrollCourse_Student] AS
SELECT dept.DepartmentId,dept.DepartmentName,t1.StudentRegNo,stu.StudentName,CourseIds=STUFF( (SELECT DISTINCT ', '+ CAST(course.CourseName AS VARCHAR(MAX)) FROM Course_tbl course,EnrollCourse_table enroll WHERE course.CourseId=enroll.EnrollCourseId and enroll.StudentRegNo=t1.StudentRegNo FOR XMl PATH('') ),1,1,'' ) FROM EnrollCourse_table t1 
LEFT JOIN Student_tbl as stu ON stu.RegistrationNumber = t1.StudentRegNo
LEFT JOIN Department_tbl as dept ON dept.DepartmentId = stu.Dept_Id
GROUP BY dept.DepartmentId,dept.DepartmentName,t1.StudentRegNo,stu.StudentName

GO
/****** Object:  View [dbo].[ViewResultWithCourseInfo]    Script Date: 4/21/2018 9:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewResultWithCourseInfo] AS
SELECT course.CourseId,CourseCode,course.CourseName,stu.RegistrationNumber,stu.StudentName, result.GradeLetter
From EnrollCourse_table as enroll
Left JOIN Student_tbl as stu ON stu.RegistrationNumber = enroll.StudentRegNo
Left JOIN StudentResult as result ON result.Course_Id = enroll.EnrollCourseId And result.StudentRegNo = enroll.StudentRegNo
Left JOIN Course_tbl as course ON course.CourseId = enroll.EnrollCourseId
GROUP BY course.CourseId,CourseCode,course.CourseName,stu.RegistrationNumber,stu.StudentName,result.GradeLetter

GO
/****** Object:  View [dbo].[ViewStudentWith_DeptCourse]    Script Date: 4/21/2018 9:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewStudentWith_DeptCourse] AS
SELECT course.CourseId,course.CourseCode,course.CourseName,course.CourseCredit,dept.DepartmentId,dept.DepartmentName,student.RegistrationNumber,student.StudentName,student.StudentEmail
From Student_tbl as student
LEFT JOIN Department_tbl as dept ON dept.DepartmentId = student.Dept_Id
Left JOIN Course_tbl as course ON course.Dept_Id = student.Dept_Id

GO
/****** Object:  View [dbo].[ViewStudentWithCourse]    Script Date: 4/21/2018 9:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewStudentWithCourse] AS
SELECT course.CourseCode,course.CourseName,course.CourseId,stu.StudentId,stu.StudentName,stu.StudentEmail,stu.RegistrationNumber
From Student_tbl as stu
LEFT JOIN EnrollCourse_table as encourse ON encourse.StudentRegNo = stu.RegistrationNumber
LEFT JOIN Course_tbl as course ON course.CourseId = encourse.EnrollCourseId

GO
/****** Object:  View [dbo].[ViewStudentWithDepartment]    Script Date: 4/21/2018 9:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewStudentWithDepartment] AS
SELECT dept.DepartmentId,dept.DepartmentName,stu.StudentId,stu.StudentName,stu.StudentEmail,stu.RegistrationNumber
From Student_tbl as stu
LEFT JOIN Department_tbl as dept ON dept.DepartmentId = stu.Dept_Id

GO
/****** Object:  View [dbo].[ViewTeacherCreditList]    Script Date: 4/21/2018 9:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewTeacherCreditList] AS
SELECT teacher.TeacherId,teacher.TeacherName,teacher.TeacherCredit as TotalTeacherCredit,SUM(assign.AssignCredit) as TotalAssignCredit
From Teacher_tbl as teacher
Left JOIN CourseAssign_tbl as assign ON assign.AssignTeacherId = teacher.TeacherId
GROUP BY teacher.TeacherId,teacher.TeacherName,teacher.TeacherCredit

GO
/****** Object:  View [dbo].[ViewTeacherProfile]    Script Date: 4/21/2018 9:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewTeacherProfile] AS
SELECT dept.*,teacher.TeacherId,teacher.TeacherName,teacher.TeacherCredit,teacher.MobileNo,desg.DesignationId,desg.DesignationName
From Teacher_tbl as teacher
LEFT JOIN Department_tbl as dept ON dept.DepartmentId = teacher.Dept_Id
Left JOIN Designation_tbl as desg ON desg.DesignationId = teacher.Desg_Id

GO
SET IDENTITY_INSERT [dbo].[AllocateRoom_tbl] ON 

INSERT [dbo].[AllocateRoom_tbl] ([AllocateRoomId], [Dept_Id], [Course_Id], [RoomNo_Id], [DayId], [TimeFrom], [TimeTo], [AllocationStatus]) VALUES (34, 13, 16, 1, 1, N'10:00', N'11:15', 0)
INSERT [dbo].[AllocateRoom_tbl] ([AllocateRoomId], [Dept_Id], [Course_Id], [RoomNo_Id], [DayId], [TimeFrom], [TimeTo], [AllocationStatus]) VALUES (35, 13, 17, 1, 1, N'11:30', N'12:45', 0)
INSERT [dbo].[AllocateRoom_tbl] ([AllocateRoomId], [Dept_Id], [Course_Id], [RoomNo_Id], [DayId], [TimeFrom], [TimeTo], [AllocationStatus]) VALUES (36, 13, 16, 1, 1, N'10:00', N'11:15', 0)
INSERT [dbo].[AllocateRoom_tbl] ([AllocateRoomId], [Dept_Id], [Course_Id], [RoomNo_Id], [DayId], [TimeFrom], [TimeTo], [AllocationStatus]) VALUES (37, 13, 17, 1, 1, N'10:45', N'12:15', 0)
INSERT [dbo].[AllocateRoom_tbl] ([AllocateRoomId], [Dept_Id], [Course_Id], [RoomNo_Id], [DayId], [TimeFrom], [TimeTo], [AllocationStatus]) VALUES (38, 13, 16, 1, 1, N'10:00', N'11:15', 1)
SET IDENTITY_INSERT [dbo].[AllocateRoom_tbl] OFF
SET IDENTITY_INSERT [dbo].[Course_tbl] ON 

INSERT [dbo].[Course_tbl] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDesc], [Dept_Id], [Sem_Id]) VALUES (16, N'SWE-DBA', N'DATABASE ADMINISTRATION', CAST(4.00 AS Decimal(18, 2)), N'', 13, 1)
INSERT [dbo].[Course_tbl] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDesc], [Dept_Id], [Sem_Id]) VALUES (17, N'WEB-APP', N'WEB Programming Application', CAST(3.50 AS Decimal(18, 2)), N'WEB based application program''s', 13, 1)
INSERT [dbo].[Course_tbl] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDesc], [Dept_Id], [Sem_Id]) VALUES (18, N'SW-TEST', N'Software Testing', CAST(4.00 AS Decimal(18, 2)), N'Software Testing method analysing', 13, 1)
INSERT [dbo].[Course_tbl] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDesc], [Dept_Id], [Sem_Id]) VALUES (19, N'SW-AI', N'Artificial Intelligent', CAST(4.00 AS Decimal(18, 2)), N'', 13, 1)
INSERT [dbo].[Course_tbl] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDesc], [Dept_Id], [Sem_Id]) VALUES (20, N'JAVA-APP', N'JAVA Programming', CAST(4.00 AS Decimal(18, 2)), N'Java Programming Learning', 13, 1)
INSERT [dbo].[Course_tbl] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDesc], [Dept_Id], [Sem_Id]) VALUES (21, N'ENG-01', N'English-I', CAST(3.50 AS Decimal(18, 2)), N'English', 14, 1)
INSERT [dbo].[Course_tbl] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDesc], [Dept_Id], [Sem_Id]) VALUES (22, N'CS -JAVA', N'Web App - JAVA Programming', CAST(3.50 AS Decimal(18, 2)), N'', 14, 1)
INSERT [dbo].[Course_tbl] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDesc], [Dept_Id], [Sem_Id]) VALUES (23, N'CS-CIRCUIT', N'Circuit', CAST(4.00 AS Decimal(18, 2)), N'Hardware Circuit Design', 14, 1)
INSERT [dbo].[Course_tbl] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDesc], [Dept_Id], [Sem_Id]) VALUES (24, N'ARC-AUCD', N'AUTOCAD Design', CAST(4.00 AS Decimal(18, 2)), N'', 16, 1)
INSERT [dbo].[Course_tbl] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDesc], [Dept_Id], [Sem_Id]) VALUES (25, N'ARC-MTD', N'Architecture Methodology', CAST(3.50 AS Decimal(18, 2)), N'Architecture Methodology design & implementation', 16, 1)
SET IDENTITY_INSERT [dbo].[Course_tbl] OFF
SET IDENTITY_INSERT [dbo].[CourseAssign_tbl] ON 

INSERT [dbo].[CourseAssign_tbl] ([AssignId], [Dept_Id], [AssignTeacherId], [AssignCourseId], [AssignCourseStatus], [AssignCredit]) VALUES (50, 13, 14, 19, 1, CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[CourseAssign_tbl] ([AssignId], [Dept_Id], [AssignTeacherId], [AssignCourseId], [AssignCourseStatus], [AssignCredit]) VALUES (51, 13, 15, 16, 1, CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[CourseAssign_tbl] ([AssignId], [Dept_Id], [AssignTeacherId], [AssignCourseId], [AssignCourseStatus], [AssignCredit]) VALUES (52, 13, 17, 20, 1, CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[CourseAssign_tbl] ([AssignId], [Dept_Id], [AssignTeacherId], [AssignCourseId], [AssignCourseStatus], [AssignCredit]) VALUES (53, 13, 15, 18, 1, CAST(4.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[CourseAssign_tbl] OFF
SET IDENTITY_INSERT [dbo].[Day_tbl] ON 

INSERT [dbo].[Day_tbl] ([DId], [DayName]) VALUES (1, N'Saturday')
INSERT [dbo].[Day_tbl] ([DId], [DayName]) VALUES (2, N'Sunday')
INSERT [dbo].[Day_tbl] ([DId], [DayName]) VALUES (3, N'Monday')
INSERT [dbo].[Day_tbl] ([DId], [DayName]) VALUES (4, N'Tuesday')
INSERT [dbo].[Day_tbl] ([DId], [DayName]) VALUES (5, N'Wednessday')
INSERT [dbo].[Day_tbl] ([DId], [DayName]) VALUES (6, N'Thursday')
INSERT [dbo].[Day_tbl] ([DId], [DayName]) VALUES (7, N'Friday')
SET IDENTITY_INSERT [dbo].[Day_tbl] OFF
SET IDENTITY_INSERT [dbo].[Department_tbl] ON 

INSERT [dbo].[Department_tbl] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (13, N'SWE', N'Software Engineering')
INSERT [dbo].[Department_tbl] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (14, N'CSE', N'Computer Science & Engineering')
INSERT [dbo].[Department_tbl] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (15, N'TE', N'Textile Engineering')
INSERT [dbo].[Department_tbl] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (16, N'ARCH', N'Architectute')
INSERT [dbo].[Department_tbl] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (17, N'CIVIL', N'CIVIL Engineering')
INSERT [dbo].[Department_tbl] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (18, N'ENG', N'ENGLISH')
INSERT [dbo].[Department_tbl] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (19, N'MCA', N'Multimedia & Creative ARTS')
INSERT [dbo].[Department_tbl] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (20, N'cse411', N'CSE')
INSERT [dbo].[Department_tbl] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (21, N'ICE', N'Information and communication engineering')
SET IDENTITY_INSERT [dbo].[Department_tbl] OFF
SET IDENTITY_INSERT [dbo].[Designation_tbl] ON 

INSERT [dbo].[Designation_tbl] ([DesignationId], [DesignationName]) VALUES (1, N'Professor')
INSERT [dbo].[Designation_tbl] ([DesignationId], [DesignationName]) VALUES (2, N'Assistant Professor')
INSERT [dbo].[Designation_tbl] ([DesignationId], [DesignationName]) VALUES (3, N'Associate Professor')
INSERT [dbo].[Designation_tbl] ([DesignationId], [DesignationName]) VALUES (4, N'Senior Lecturer')
INSERT [dbo].[Designation_tbl] ([DesignationId], [DesignationName]) VALUES (5, N'Lecturer')
SET IDENTITY_INSERT [dbo].[Designation_tbl] OFF
SET IDENTITY_INSERT [dbo].[EnrollCourse_table] ON 

INSERT [dbo].[EnrollCourse_table] ([EnrollId], [StudentRegNo], [EnrollCourseId], [EnrollDate]) VALUES (15, N'SWE-2016-001', 16, N'2016-05-19')
INSERT [dbo].[EnrollCourse_table] ([EnrollId], [StudentRegNo], [EnrollCourseId], [EnrollDate]) VALUES (16, N'SWE-2016-001', 17, N'2016-05-19')
INSERT [dbo].[EnrollCourse_table] ([EnrollId], [StudentRegNo], [EnrollCourseId], [EnrollDate]) VALUES (17, N'SWE-2016-001', 18, N'2016-05-19')
INSERT [dbo].[EnrollCourse_table] ([EnrollId], [StudentRegNo], [EnrollCourseId], [EnrollDate]) VALUES (18, N'SWE-2016-001', 19, N'2016-05-19')
INSERT [dbo].[EnrollCourse_table] ([EnrollId], [StudentRegNo], [EnrollCourseId], [EnrollDate]) VALUES (19, N'SWE-2016-001', 20, N'2016-05-19')
SET IDENTITY_INSERT [dbo].[EnrollCourse_table] OFF
SET IDENTITY_INSERT [dbo].[IdCounter_tbl] ON 

INSERT [dbo].[IdCounter_tbl] ([SlNo], [Dept_Id], [Year], [CountNo]) VALUES (5, 13, N'2016', 4)
INSERT [dbo].[IdCounter_tbl] ([SlNo], [Dept_Id], [Year], [CountNo]) VALUES (6, 14, N'2016', 1)
SET IDENTITY_INSERT [dbo].[IdCounter_tbl] OFF
SET IDENTITY_INSERT [dbo].[Room_tbl] ON 

INSERT [dbo].[Room_tbl] ([RoomId], [RoomNo]) VALUES (1, N'101-AB')
INSERT [dbo].[Room_tbl] ([RoomId], [RoomNo]) VALUES (2, N'102-AB')
INSERT [dbo].[Room_tbl] ([RoomId], [RoomNo]) VALUES (3, N'103-AB')
INSERT [dbo].[Room_tbl] ([RoomId], [RoomNo]) VALUES (4, N'201-AB')
INSERT [dbo].[Room_tbl] ([RoomId], [RoomNo]) VALUES (5, N'202-AB')
SET IDENTITY_INSERT [dbo].[Room_tbl] OFF
SET IDENTITY_INSERT [dbo].[Semester_tbl] ON 

INSERT [dbo].[Semester_tbl] ([SemesterId], [SemesterName]) VALUES (1, N'1st Semester')
INSERT [dbo].[Semester_tbl] ([SemesterId], [SemesterName]) VALUES (2, N'2nd Semester')
INSERT [dbo].[Semester_tbl] ([SemesterId], [SemesterName]) VALUES (3, N'3rd Semester')
INSERT [dbo].[Semester_tbl] ([SemesterId], [SemesterName]) VALUES (4, N'4th Semester')
INSERT [dbo].[Semester_tbl] ([SemesterId], [SemesterName]) VALUES (5, N'5th Semester')
INSERT [dbo].[Semester_tbl] ([SemesterId], [SemesterName]) VALUES (6, N'6th Semester')
INSERT [dbo].[Semester_tbl] ([SemesterId], [SemesterName]) VALUES (7, N'7th Semester')
INSERT [dbo].[Semester_tbl] ([SemesterId], [SemesterName]) VALUES (8, N'8th Semester')
SET IDENTITY_INSERT [dbo].[Semester_tbl] OFF
SET IDENTITY_INSERT [dbo].[Student_tbl] ON 

INSERT [dbo].[Student_tbl] ([StudentId], [RegistrationNumber], [StudentName], [StudentEmail], [StudentPhone], [RegisDate], [StudentAddress], [Dept_Id]) VALUES (28, N'SWE-2016-001', N'SHUBHA ROY', N'royshubha04@gmail.com', N'01672707566', CAST(N'2016-05-19' AS Date), N'', 13)
INSERT [dbo].[Student_tbl] ([StudentId], [RegistrationNumber], [StudentName], [StudentEmail], [StudentPhone], [RegisDate], [StudentAddress], [Dept_Id]) VALUES (29, N'SWE-2016-003', N'Ujjal Hasan', N'hasan@gmail.com', N'', CAST(N'2016-05-19' AS Date), N'', 13)
INSERT [dbo].[Student_tbl] ([StudentId], [RegistrationNumber], [StudentName], [StudentEmail], [StudentPhone], [RegisDate], [StudentAddress], [Dept_Id]) VALUES (30, N'SWE-2016-004', N'SHAH MAHDI', N'mahdi@gmail.com', N'', CAST(N'2016-05-19' AS Date), N'', 13)
INSERT [dbo].[Student_tbl] ([StudentId], [RegistrationNumber], [StudentName], [StudentEmail], [StudentPhone], [RegisDate], [StudentAddress], [Dept_Id]) VALUES (31, N'CSE-2016-001', N'Saiful Hasan', N'saiful@yahoo.com', N'', CAST(N'2016-05-19' AS Date), N'', 14)
SET IDENTITY_INSERT [dbo].[Student_tbl] OFF
SET IDENTITY_INSERT [dbo].[StudentResult] ON 

INSERT [dbo].[StudentResult] ([ResultId], [StudentRegNo], [Course_Id], [GradeLetter]) VALUES (10, N'SWE-2016-001', 16, N'A+')
INSERT [dbo].[StudentResult] ([ResultId], [StudentRegNo], [Course_Id], [GradeLetter]) VALUES (11, N'SWE-2016-001', 17, N'A')
INSERT [dbo].[StudentResult] ([ResultId], [StudentRegNo], [Course_Id], [GradeLetter]) VALUES (12, N'SWE-2016-001', 18, N'A+')
INSERT [dbo].[StudentResult] ([ResultId], [StudentRegNo], [Course_Id], [GradeLetter]) VALUES (13, N'SWE-2016-001', 19, N'A-')
INSERT [dbo].[StudentResult] ([ResultId], [StudentRegNo], [Course_Id], [GradeLetter]) VALUES (14, N'SWE-2016-001', 20, N'A+')
SET IDENTITY_INSERT [dbo].[StudentResult] OFF
SET IDENTITY_INSERT [dbo].[Teacher_tbl] ON 

INSERT [dbo].[Teacher_tbl] ([TeacherId], [TeacherName], [Address], [Email], [MobileNo], [Desg_Id], [Dept_Id], [TeacherCredit]) VALUES (14, N'Touhid Bhuiyan', N'', N'bhuiyan@gmail.com', N'', 1, 13, CAST(12.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher_tbl] ([TeacherId], [TeacherName], [Address], [Email], [MobileNo], [Desg_Id], [Dept_Id], [TeacherCredit]) VALUES (15, N'Imran Mahmud', N'Dhaka, Bangladesh', N'imran@gmail.com', N'01672707566', 2, 13, CAST(16.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher_tbl] ([TeacherId], [TeacherName], [Address], [Email], [MobileNo], [Desg_Id], [Dept_Id], [TeacherCredit]) VALUES (16, N'MRS. Tasnuva', N'Dhaka, Bangladesh', N'tasnuva@yahoo.com', N'01672707566', 5, 13, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher_tbl] ([TeacherId], [TeacherName], [Address], [Email], [MobileNo], [Desg_Id], [Dept_Id], [TeacherCredit]) VALUES (17, N'Fahad Jamal', N'Dhaka, Bangladesh', N'fahad@yahoo.com', N'01704445228', 4, 13, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher_tbl] ([TeacherId], [TeacherName], [Address], [Email], [MobileNo], [Desg_Id], [Dept_Id], [TeacherCredit]) VALUES (18, N'Anirban Mitra', N'DHAKA', N'mitra@yahoo.com', N'01672707566', 1, 14, CAST(12.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher_tbl] ([TeacherId], [TeacherName], [Address], [Email], [MobileNo], [Desg_Id], [Dept_Id], [TeacherCredit]) VALUES (19, N'Nilima Roy', N'', N'roy@gmail.com', N'', 4, 14, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher_tbl] ([TeacherId], [TeacherName], [Address], [Email], [MobileNo], [Desg_Id], [Dept_Id], [TeacherCredit]) VALUES (20, N'Nirob Saha', N'DHAKA', N'saha@gmail.com', N'01672707566', 5, 14, CAST(24.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher_tbl] ([TeacherId], [TeacherName], [Address], [Email], [MobileNo], [Desg_Id], [Dept_Id], [TeacherCredit]) VALUES (21, N'Ibrahim Molla', N'', N'molla@yahoo.com', N'', 2, 16, CAST(16.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher_tbl] ([TeacherId], [TeacherName], [Address], [Email], [MobileNo], [Desg_Id], [Dept_Id], [TeacherCredit]) VALUES (22, N'MD. Milon Hossain', N'', N'milon@gmail.com', N'', 1, 16, CAST(8.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Teacher_tbl] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Course_tbl]    Script Date: 4/21/2018 9:51:30 PM ******/
ALTER TABLE [dbo].[Course_tbl] ADD  CONSTRAINT [IX_Course_tbl] UNIQUE NONCLUSTERED 
(
	[CourseName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Course_tbl_1]    Script Date: 4/21/2018 9:51:30 PM ******/
ALTER TABLE [dbo].[Course_tbl] ADD  CONSTRAINT [IX_Course_tbl_1] UNIQUE NONCLUSTERED 
(
	[CourseCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Department_tbl]    Script Date: 4/21/2018 9:51:30 PM ******/
ALTER TABLE [dbo].[Department_tbl] ADD  CONSTRAINT [IX_Department_tbl] UNIQUE NONCLUSTERED 
(
	[DepartmentCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Department_tbl_1]    Script Date: 4/21/2018 9:51:30 PM ******/
ALTER TABLE [dbo].[Department_tbl] ADD  CONSTRAINT [IX_Department_tbl_1] UNIQUE NONCLUSTERED 
(
	[DepartmentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Student_tbl]    Script Date: 4/21/2018 9:51:30 PM ******/
ALTER TABLE [dbo].[Student_tbl] ADD  CONSTRAINT [IX_Student_tbl] UNIQUE NONCLUSTERED 
(
	[RegistrationNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Student_tbl_1]    Script Date: 4/21/2018 9:51:30 PM ******/
ALTER TABLE [dbo].[Student_tbl] ADD  CONSTRAINT [IX_Student_tbl_1] UNIQUE NONCLUSTERED 
(
	[StudentEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Teacher_tbl]    Script Date: 4/21/2018 9:51:30 PM ******/
ALTER TABLE [dbo].[Teacher_tbl] ADD  CONSTRAINT [IX_Teacher_tbl] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AllocateRoom_tbl]  WITH CHECK ADD  CONSTRAINT [FK_AllocateRoom_tbl_Course_tbl] FOREIGN KEY([Course_Id])
REFERENCES [dbo].[Course_tbl] ([CourseId])
GO
ALTER TABLE [dbo].[AllocateRoom_tbl] CHECK CONSTRAINT [FK_AllocateRoom_tbl_Course_tbl]
GO
ALTER TABLE [dbo].[AllocateRoom_tbl]  WITH CHECK ADD  CONSTRAINT [FK_AllocateRoom_tbl_Day_tbl] FOREIGN KEY([DayId])
REFERENCES [dbo].[Day_tbl] ([DId])
GO
ALTER TABLE [dbo].[AllocateRoom_tbl] CHECK CONSTRAINT [FK_AllocateRoom_tbl_Day_tbl]
GO
ALTER TABLE [dbo].[AllocateRoom_tbl]  WITH CHECK ADD  CONSTRAINT [FK_AllocateRoom_tbl_Department_tbl] FOREIGN KEY([Dept_Id])
REFERENCES [dbo].[Department_tbl] ([DepartmentId])
GO
ALTER TABLE [dbo].[AllocateRoom_tbl] CHECK CONSTRAINT [FK_AllocateRoom_tbl_Department_tbl]
GO
ALTER TABLE [dbo].[AllocateRoom_tbl]  WITH CHECK ADD  CONSTRAINT [FK_AllocateRoom_tbl_Room_tbl] FOREIGN KEY([RoomNo_Id])
REFERENCES [dbo].[Room_tbl] ([RoomId])
GO
ALTER TABLE [dbo].[AllocateRoom_tbl] CHECK CONSTRAINT [FK_AllocateRoom_tbl_Room_tbl]
GO
ALTER TABLE [dbo].[Course_tbl]  WITH CHECK ADD  CONSTRAINT [FK_Course_tbl_Department_tbl] FOREIGN KEY([Dept_Id])
REFERENCES [dbo].[Department_tbl] ([DepartmentId])
GO
ALTER TABLE [dbo].[Course_tbl] CHECK CONSTRAINT [FK_Course_tbl_Department_tbl]
GO
ALTER TABLE [dbo].[Course_tbl]  WITH CHECK ADD  CONSTRAINT [FK_Course_tbl_Semester_tbl] FOREIGN KEY([Sem_Id])
REFERENCES [dbo].[Semester_tbl] ([SemesterId])
GO
ALTER TABLE [dbo].[Course_tbl] CHECK CONSTRAINT [FK_Course_tbl_Semester_tbl]
GO
ALTER TABLE [dbo].[CourseAssign_tbl]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssign_tbl_Course_tbl] FOREIGN KEY([AssignCourseId])
REFERENCES [dbo].[Course_tbl] ([CourseId])
GO
ALTER TABLE [dbo].[CourseAssign_tbl] CHECK CONSTRAINT [FK_CourseAssign_tbl_Course_tbl]
GO
ALTER TABLE [dbo].[CourseAssign_tbl]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssign_tbl_Department_tbl] FOREIGN KEY([Dept_Id])
REFERENCES [dbo].[Department_tbl] ([DepartmentId])
GO
ALTER TABLE [dbo].[CourseAssign_tbl] CHECK CONSTRAINT [FK_CourseAssign_tbl_Department_tbl]
GO
ALTER TABLE [dbo].[CourseAssign_tbl]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssign_tbl_Teacher_tbl] FOREIGN KEY([AssignTeacherId])
REFERENCES [dbo].[Teacher_tbl] ([TeacherId])
GO
ALTER TABLE [dbo].[CourseAssign_tbl] CHECK CONSTRAINT [FK_CourseAssign_tbl_Teacher_tbl]
GO
ALTER TABLE [dbo].[EnrollCourse_table]  WITH CHECK ADD  CONSTRAINT [FK_EnrollCourse_table_Course_tbl] FOREIGN KEY([EnrollCourseId])
REFERENCES [dbo].[Course_tbl] ([CourseId])
GO
ALTER TABLE [dbo].[EnrollCourse_table] CHECK CONSTRAINT [FK_EnrollCourse_table_Course_tbl]
GO
ALTER TABLE [dbo].[EnrollCourse_table]  WITH CHECK ADD  CONSTRAINT [FK_EnrollCourse_table_Student_tbl] FOREIGN KEY([StudentRegNo])
REFERENCES [dbo].[Student_tbl] ([RegistrationNumber])
GO
ALTER TABLE [dbo].[EnrollCourse_table] CHECK CONSTRAINT [FK_EnrollCourse_table_Student_tbl]
GO
ALTER TABLE [dbo].[IdCounter_tbl]  WITH CHECK ADD  CONSTRAINT [FK_IdCounter_tbl_Department_tbl] FOREIGN KEY([Dept_Id])
REFERENCES [dbo].[Department_tbl] ([DepartmentId])
GO
ALTER TABLE [dbo].[IdCounter_tbl] CHECK CONSTRAINT [FK_IdCounter_tbl_Department_tbl]
GO
ALTER TABLE [dbo].[Student_tbl]  WITH CHECK ADD  CONSTRAINT [FK_Student_tbl_Department_tbl] FOREIGN KEY([Dept_Id])
REFERENCES [dbo].[Department_tbl] ([DepartmentId])
GO
ALTER TABLE [dbo].[Student_tbl] CHECK CONSTRAINT [FK_Student_tbl_Department_tbl]
GO
ALTER TABLE [dbo].[StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_Course_tbl] FOREIGN KEY([Course_Id])
REFERENCES [dbo].[Course_tbl] ([CourseId])
GO
ALTER TABLE [dbo].[StudentResult] CHECK CONSTRAINT [FK_StudentResult_Course_tbl]
GO
ALTER TABLE [dbo].[StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_Student_tbl] FOREIGN KEY([StudentRegNo])
REFERENCES [dbo].[Student_tbl] ([RegistrationNumber])
GO
ALTER TABLE [dbo].[StudentResult] CHECK CONSTRAINT [FK_StudentResult_Student_tbl]
GO
ALTER TABLE [dbo].[Teacher_tbl]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_tbl_Department_tbl] FOREIGN KEY([Dept_Id])
REFERENCES [dbo].[Department_tbl] ([DepartmentId])
GO
ALTER TABLE [dbo].[Teacher_tbl] CHECK CONSTRAINT [FK_Teacher_tbl_Department_tbl]
GO
ALTER TABLE [dbo].[Teacher_tbl]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_tbl_Designation_tbl] FOREIGN KEY([Desg_Id])
REFERENCES [dbo].[Designation_tbl] ([DesignationId])
GO
ALTER TABLE [dbo].[Teacher_tbl] CHECK CONSTRAINT [FK_Teacher_tbl_Designation_tbl]
GO
USE [master]
GO
ALTER DATABASE [UVMS] SET  READ_WRITE 
GO
