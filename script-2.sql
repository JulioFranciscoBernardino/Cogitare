USE [master]
GO
/****** Object:  Database [Cogitare]    Script Date: 27/05/2025 19:02:27 ******/
CREATE DATABASE [Cogitare]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cogitare', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Cogitare.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Cogitare_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Cogitare_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Cogitare] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cogitare].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cogitare] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cogitare] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cogitare] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cogitare] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cogitare] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cogitare] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cogitare] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cogitare] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cogitare] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cogitare] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cogitare] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cogitare] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cogitare] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cogitare] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cogitare] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Cogitare] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cogitare] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cogitare] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cogitare] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cogitare] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cogitare] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cogitare] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cogitare] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Cogitare] SET  MULTI_USER 
GO
ALTER DATABASE [Cogitare] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cogitare] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cogitare] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cogitare] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cogitare] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Cogitare] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Cogitare] SET QUERY_STORE = ON
GO
ALTER DATABASE [Cogitare] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Cogitare]
GO
/****** Object:  Table [dbo].[Administrador]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrador](
	[IdAdministrador] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](100) NOT NULL,
	[Senha] [varchar](255) NULL,
	[Tipo] [varchar](100) NOT NULL,
	[UltimoAcesso] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAdministrador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Atendimento]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Atendimento](
	[IdAtendimento] [int] IDENTITY(1,1) NOT NULL,
	[IdResponsavel] [int] NULL,
	[IdCuidador] [int] NULL,
	[IdIdoso] [int] NULL,
	[DataInicio] [datetime] NULL,
	[DataFim] [datetime] NULL,
	[Status] [varchar](20) NULL,
	[Local] [varchar](255) NULL,
	[Valor] [decimal](10, 2) NULL,
	[ObservacaoExtra] [varchar](max) NULL,
	[DataCriacao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAtendimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Avaliacao]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Avaliacao](
	[IdAvaliacao] [int] IDENTITY(1,1) NOT NULL,
	[IdResponsavel] [int] NULL,
	[IdCuidador] [int] NULL,
	[IdAtendimento] [int] NULL,
	[Nota] [int] NULL,
	[Comentario] [varchar](max) NULL,
	[DataAvaliacao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAvaliacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Certificado]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certificado](
	[IdCertificado] [int] IDENTITY(1,1) NOT NULL,
	[IdCuidador] [int] NULL,
	[Descricao] [varchar](max) NULL,
	[UrlCertificado] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCertificado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chat]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chat](
	[IdChat] [int] IDENTITY(1,1) NOT NULL,
	[IdCuidador] [int] NULL,
	[IdResponsavel] [int] NULL,
	[DataCriacao] [datetime] NULL,
	[Status] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdChat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuidador]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuidador](
	[IdCuidador] [int] IDENTITY(1,1) NOT NULL,
	[IdEndereco] [int] NULL,
	[Cpf] [varchar](20) NULL,
	[Nome] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Telefone] [varchar](20) NULL,
	[Senha] [varchar](100) NULL,
	[DataNascimento] [date] NULL,
	[FotoUrl] [varchar](255) NULL,
	[Biografia] [varchar](max) NULL,
	[Fumante] [varchar](3) NULL,
	[TemFilhos] [varchar](3) NULL,
	[PossuiCNH] [varchar](3) NULL,
	[TemCarro] [varchar](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCuidador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuidadorEspecialidade]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuidadorEspecialidade](
	[IdCuidadorEspecialidade] [int] IDENTITY(1,1) NOT NULL,
	[IdCuidador] [int] NULL,
	[IdEspecialidade] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCuidadorEspecialidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuidadorServico]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuidadorServico](
	[IdCuidadorServico] [int] IDENTITY(1,1) NOT NULL,
	[IdCuidador] [int] NULL,
	[IdServico] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCuidadorServico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Disponibilidade]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Disponibilidade](
	[IdDisponibilidade] [int] IDENTITY(1,1) NOT NULL,
	[IdCuidador] [int] NULL,
	[DiaSemana] [varchar](20) NULL,
	[DataInicio] [datetime] NULL,
	[DataFim] [datetime] NULL,
	[Observacoes] [varchar](max) NULL,
	[Recorrente] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDisponibilidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doenca]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doenca](
	[IdDoenca] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NULL,
	[Descricao] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDoenca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Endereco]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Endereco](
	[IdEndereco] [int] IDENTITY(1,1) NOT NULL,
	[Cidade] [varchar](100) NULL,
	[Bairro] [varchar](100) NULL,
	[Rua] [varchar](100) NULL,
	[Numero] [varchar](20) NULL,
	[Complemento] [varchar](100) NULL,
	[Cep] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEndereco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especialidade]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidade](
	[IdEspecialidade] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NULL,
	[Descricao] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEspecialidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Experiencia]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Experiencia](
	[IdExperiencia] [int] IDENTITY(1,1) NOT NULL,
	[IdCuidador] [int] NULL,
	[Descricao] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdExperiencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Formacao]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Formacao](
	[IdFormacao] [int] IDENTITY(1,1) NOT NULL,
	[IdCuidador] [int] NULL,
	[Descricao] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdFormacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoricoAdministrador]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoricoAdministrador](
	[IdHistoricoAdm] [int] IDENTITY(1,1) NOT NULL,
	[IdAdministrador] [int] NULL,
	[Operacao] [varchar](255) NOT NULL,
	[DataOperacao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdHistoricoAdm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoricoAtendimento]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoricoAtendimento](
	[IdHistorico] [int] IDENTITY(1,1) NOT NULL,
	[IdAtendimento] [int] NULL,
	[StatusFinal] [varchar](20) NULL,
	[DataRegistro] [datetime] NULL,
	[Observacoes] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdHistorico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoricoCuidador]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoricoCuidador](
	[IdHistoricoCuidador] [int] IDENTITY(1,1) NOT NULL,
	[IdCuidador] [int] NULL,
	[Operacao] [varchar](255) NOT NULL,
	[DataOperacao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdHistoricoCuidador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoricoResponsavel]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoricoResponsavel](
	[IdHistoricoResponsavel] [int] IDENTITY(1,1) NOT NULL,
	[IdResponsavel] [int] NULL,
	[Operacao] [varchar](255) NOT NULL,
	[DataOperacao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdHistoricoResponsavel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Idoso]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Idoso](
	[IdIdoso] [int] IDENTITY(1,1) NOT NULL,
	[IdResponsavel] [int] NULL,
	[IdMobilidade] [int] NULL,
	[IdNivelAutonomia] [int] NULL,
	[Nome] [varchar](100) NULL,
	[DataNascimento] [date] NULL,
	[Sexo] [varchar](20) NULL,
	[CuidadosMedicos] [varchar](max) NULL,
	[DescricaoExtra] [varchar](max) NULL,
	[FotoUrl] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdIdoso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdosoDoenca]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdosoDoenca](
	[IdIdosoDoenca] [int] IDENTITY(1,1) NOT NULL,
	[IdIdoso] [int] NULL,
	[IdDoenca] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdIdosoDoenca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdosoRestricaoAlimentar]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdosoRestricaoAlimentar](
	[IdIdosoRestricaoAlimentar] [int] IDENTITY(1,1) NOT NULL,
	[IdIdoso] [int] NULL,
	[IdRestricaoAlimentar] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdIdosoRestricaoAlimentar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mensagem]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mensagem](
	[IdMensagem] [int] IDENTITY(1,1) NOT NULL,
	[IdChat] [int] NULL,
	[IdRemetente] [int] NULL,
	[RemetenteTipo] [varchar](20) NULL,
	[Conteudo] [varchar](max) NULL,
	[DataEnvio] [datetime] NULL,
	[Lida] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMensagem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mobilidade]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mobilidade](
	[IdMobilidade] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMobilidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NivelAutonomia]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NivelAutonomia](
	[IdNivelAutonomia] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdNivelAutonomia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pagamento]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagamento](
	[IdPagamento] [int] IDENTITY(1,1) NOT NULL,
	[IdAtendimento] [int] NULL,
	[MetodoPagamento] [varchar](20) NULL,
	[StatusPagamento] [varchar](20) NULL,
	[DataPagamento] [datetime] NULL,
	[CodigoTransacao] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPagamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroProfissional]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroProfissional](
	[IdRegistro] [int] IDENTITY(1,1) NOT NULL,
	[IdCuidador] [int] NULL,
	[RegistroCRM] [varchar](50) NULL,
	[RegistroCREFITO] [varchar](50) NULL,
	[RegistroCOREN] [varchar](50) NULL,
	[RegistroCRP] [varchar](50) NULL,
	[DataRegistro] [date] NOT NULL,
	[StatusRegistro] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRegistro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Responsavel]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Responsavel](
	[IdResponsavel] [int] IDENTITY(1,1) NOT NULL,
	[IdEndereco] [int] NULL,
	[Cpf] [varchar](20) NULL,
	[Nome] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Telefone] [varchar](20) NULL,
	[DataNascimento] [date] NULL,
	[FotoUrl] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdResponsavel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RestricaoAlimentar]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RestricaoAlimentar](
	[IdRestricaoAlimentar] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRestricaoAlimentar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servico]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servico](
	[IdServico] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NULL,
	[Descricao] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdServico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Administrador] ON 

INSERT [dbo].[Administrador] ([IdAdministrador], [Usuario], [Senha], [Tipo], [UltimoAcesso]) VALUES (1, N'admin_geral', N'$2b$10$4qGVFwqL6KO.ivi9hlXHtu1HYQ.1nEX7EsW2Itin4JPHQJ7pbZCUK', N'Admistrador', CAST(N'2025-05-27T18:39:37.053' AS DateTime))
INSERT [dbo].[Administrador] ([IdAdministrador], [Usuario], [Senha], [Tipo], [UltimoAcesso]) VALUES (2, N'financeiro_joao', N'$2b$10$.Y/Brwy9JLEQa/EHYLhhaeNVnB5Yc7dpA97I/1PEsCkwquYEe8LZK', N'Gestor Financeiro', CAST(N'2025-05-12T17:22:35.053' AS DateTime))
INSERT [dbo].[Administrador] ([IdAdministrador], [Usuario], [Senha], [Tipo], [UltimoAcesso]) VALUES (3, N'suporte_maria', N'$2b$10$3.R1e1uL2wblN7WunBiB2O6upc64XYTIgPXSiSH6erKhYtP8k7kCK', N'Suporte help-desk', CAST(N'2025-05-12T17:22:35.053' AS DateTime))
INSERT [dbo].[Administrador] ([IdAdministrador], [Usuario], [Senha], [Tipo], [UltimoAcesso]) VALUES (4, N'usuarios_lucas', N'$2b$10$earbm9sKvgYxzWbPbSmekuEwft/cWuymyPtOS3Xa0tstIpNAt9rli', N'Gestor de Usuarios', CAST(N'2025-05-12T17:22:35.053' AS DateTime))
INSERT [dbo].[Administrador] ([IdAdministrador], [Usuario], [Senha], [Tipo], [UltimoAcesso]) VALUES (5, N'historico_ana', N'$2b$10$0v6Qx2Bzh.ZoHDPGigxOQ.4OBhwd7fyqUkBeHv5lt4vKEGeBVZSOa', N'Gestor de Historico', CAST(N'2025-05-26T19:54:40.447' AS DateTime))
INSERT [dbo].[Administrador] ([IdAdministrador], [Usuario], [Senha], [Tipo], [UltimoAcesso]) VALUES (6, N'admin_carla', N'$2b$10$ovA2nT5z7Y93CKtGhVPOSOdNWNpITJJuMXmSOr/zxacxWQZbjzmF2', N'Admistrador', CAST(N'2025-05-12T17:22:35.053' AS DateTime))
INSERT [dbo].[Administrador] ([IdAdministrador], [Usuario], [Senha], [Tipo], [UltimoAcesso]) VALUES (7, N'financeiro_paulo', N'$2b$10$m3dasJZGrgWE8BjFUXX0XuQNohZ/jDBKHL1RzQ7ZnA5QIJiuBftFy', N'Gestor Financeiro', CAST(N'2025-05-12T17:22:35.053' AS DateTime))
INSERT [dbo].[Administrador] ([IdAdministrador], [Usuario], [Senha], [Tipo], [UltimoAcesso]) VALUES (8, N'suporte_larissa', N'$2b$10$TnJGmqUwWdkTfCBRqup7G.e4ZqJlNgneiMSYLgkYsOcpu/mlnKa96', N'Suporte help-desk', CAST(N'2025-05-12T17:22:35.053' AS DateTime))
INSERT [dbo].[Administrador] ([IdAdministrador], [Usuario], [Senha], [Tipo], [UltimoAcesso]) VALUES (9, N'usuarios_renato', N'$2b$10$SNua9zSLVeZ7JMJttGtTz.PdODExLIGOo7.XN.7Sgg9jIZqFzLjzq', N'Gestor de Usuarios', CAST(N'2025-05-12T17:22:35.053' AS DateTime))
INSERT [dbo].[Administrador] ([IdAdministrador], [Usuario], [Senha], [Tipo], [UltimoAcesso]) VALUES (10, N'historico_fernanda', N'$2b$10$Dn2mGCnzpIgCCsehLQKJwupOMEl0TtWlNBjMZGTNTpidNCkgjUwRm', N'Gestor de Historico', CAST(N'2025-05-12T17:22:35.053' AS DateTime))
SET IDENTITY_INSERT [dbo].[Administrador] OFF
GO
SET IDENTITY_INSERT [dbo].[Atendimento] ON 

INSERT [dbo].[Atendimento] ([IdAtendimento], [IdResponsavel], [IdCuidador], [IdIdoso], [DataInicio], [DataFim], [Status], [Local], [Valor], [ObservacaoExtra], [DataCriacao]) VALUES (2, 1, 2, 3, CAST(N'2025-01-06T09:00:00.000' AS DateTime), CAST(N'2025-01-06T11:00:00.000' AS DateTime), N'Concluído', N'Residência do Idoso', CAST(150.00 AS Decimal(10, 2)), N'Verificação de sinais vitais e auxílio na medicação.', CAST(N'2025-05-26T19:09:36.960' AS DateTime))
INSERT [dbo].[Atendimento] ([IdAtendimento], [IdResponsavel], [IdCuidador], [IdIdoso], [DataInicio], [DataFim], [Status], [Local], [Valor], [ObservacaoExtra], [DataCriacao]) VALUES (4, 4, 2, 3, CAST(N'2025-03-06T10:00:00.000' AS DateTime), CAST(N'2025-03-06T11:00:00.000' AS DateTime), N'Concluído', N'Residência do Idoso', CAST(180.00 AS Decimal(10, 2)), N'Apoio psicológico e atividades de estimulação cognitiva.', CAST(N'2025-05-26T19:09:36.960' AS DateTime))
INSERT [dbo].[Atendimento] ([IdAtendimento], [IdResponsavel], [IdCuidador], [IdIdoso], [DataInicio], [DataFim], [Status], [Local], [Valor], [ObservacaoExtra], [DataCriacao]) VALUES (5, 3, 2, 5, CAST(N'2025-04-06T08:00:00.000' AS DateTime), CAST(N'2025-04-06T10:00:00.000' AS DateTime), N'Concluído', N'Residência do Idoso', CAST(100.00 AS Decimal(10, 2)), N'Auxílio na higiene pessoal e preparo do café da manhã.', CAST(N'2025-05-26T19:09:36.960' AS DateTime))
INSERT [dbo].[Atendimento] ([IdAtendimento], [IdResponsavel], [IdCuidador], [IdIdoso], [DataInicio], [DataFim], [Status], [Local], [Valor], [ObservacaoExtra], [DataCriacao]) VALUES (6, 5, 3, 4, CAST(N'2025-05-06T13:00:00.000' AS DateTime), CAST(N'2025-05-06T15:00:00.000' AS DateTime), N'Agendado', N'Consultório Médico', CAST(90.00 AS Decimal(10, 2)), N'Acompanhamento para consulta de rotina com cardiologista.', CAST(N'2025-05-26T19:09:36.960' AS DateTime))
INSERT [dbo].[Atendimento] ([IdAtendimento], [IdResponsavel], [IdCuidador], [IdIdoso], [DataInicio], [DataFim], [Status], [Local], [Valor], [ObservacaoExtra], [DataCriacao]) VALUES (8, 3, 2, 3, CAST(N'2025-07-06T09:30:00.000' AS DateTime), CAST(N'2025-07-06T10:30:00.000' AS DateTime), N'Concluído', N'Residência do Idoso', CAST(130.00 AS Decimal(10, 2)), N'Sessão de reabilitação pós-operatória de joelho.', CAST(N'2025-05-26T19:09:36.960' AS DateTime))
INSERT [dbo].[Atendimento] ([IdAtendimento], [IdResponsavel], [IdCuidador], [IdIdoso], [DataInicio], [DataFim], [Status], [Local], [Valor], [ObservacaoExtra], [DataCriacao]) VALUES (9, 4, 2, 7, CAST(N'2025-08-06T11:00:00.000' AS DateTime), CAST(N'2025-08-06T12:00:00.000' AS DateTime), N'Concluído', N'Residência do Idoso', CAST(95.00 AS Decimal(10, 2)), N'Atividades lúdicas para estimulação da memória.', CAST(N'2025-05-26T19:09:36.960' AS DateTime))
INSERT [dbo].[Atendimento] ([IdAtendimento], [IdResponsavel], [IdCuidador], [IdIdoso], [DataInicio], [DataFim], [Status], [Local], [Valor], [ObservacaoExtra], [DataCriacao]) VALUES (10, 7, 3, 4, CAST(N'2025-09-06T17:00:00.000' AS DateTime), CAST(N'2025-09-06T19:00:00.000' AS DateTime), N'Concluído', N'Residência do Idoso', CAST(70.00 AS Decimal(10, 2)), N'Preparação de jantar e organização da cozinha.', CAST(N'2025-05-26T19:09:36.960' AS DateTime))
SET IDENTITY_INSERT [dbo].[Atendimento] OFF
GO
SET IDENTITY_INSERT [dbo].[Cuidador] ON 

INSERT [dbo].[Cuidador] ([IdCuidador], [IdEndereco], [Cpf], [Nome], [Email], [Telefone], [Senha], [DataNascimento], [FotoUrl], [Biografia], [Fumante], [TemFilhos], [PossuiCNH], [TemCarro]) VALUES (1, 1, N'123.456.789-01', N'Ana Souza', N'ana.souza@example.com', N'(11) 91234-5678', N'senha123', CAST(N'1985-06-15' AS Date), N'https://example.com/fotos/ana.jpg', N'Cuidadora com 10 anos de experiência em cuidados paliativos.', N'Não', N'Sim', N'Sim', N'Sim')
INSERT [dbo].[Cuidador] ([IdCuidador], [IdEndereco], [Cpf], [Nome], [Email], [Telefone], [Senha], [DataNascimento], [FotoUrl], [Biografia], [Fumante], [TemFilhos], [PossuiCNH], [TemCarro]) VALUES (2, 2, N'234.567.890-12', N'Bruno Lima', N'bruno.lima@example.com', N'(21) 93456-7890', N'seguro456', CAST(N'1990-03-22' AS Date), N'https://example.com/fotos/bruno.jpg', N'Especializado em cuidados para idosos com Alzheimer.', N'Sim', N'Não', N'Não', N'Não')
INSERT [dbo].[Cuidador] ([IdCuidador], [IdEndereco], [Cpf], [Nome], [Email], [Telefone], [Senha], [DataNascimento], [FotoUrl], [Biografia], [Fumante], [TemFilhos], [PossuiCNH], [TemCarro]) VALUES (3, 3, N'345.678.901-23', N'Carla Mendes', N'carla.mendes@example.com', N'(31) 99876-5432', N'minhasenha', CAST(N'1978-12-05' AS Date), N'https://example.com/fotos/carla.jpg', N'Formada em enfermagem, atendo em domicílio.', N'Não', N'Não', N'Sim', N'Não')
INSERT [dbo].[Cuidador] ([IdCuidador], [IdEndereco], [Cpf], [Nome], [Email], [Telefone], [Senha], [DataNascimento], [FotoUrl], [Biografia], [Fumante], [TemFilhos], [PossuiCNH], [TemCarro]) VALUES (4, 4, N'456.789.012-34', N'Daniel Rocha', N'daniel.rocha@example.com', N'(41) 92345-6789', N'cuidar123', CAST(N'1982-07-30' AS Date), N'https://example.com/fotos/daniel.jpg', N'Experiência com reabilitação motora.', N'Sim', N'Sim', N'Sim', N'Sim')
INSERT [dbo].[Cuidador] ([IdCuidador], [IdEndereco], [Cpf], [Nome], [Email], [Telefone], [Senha], [DataNascimento], [FotoUrl], [Biografia], [Fumante], [TemFilhos], [PossuiCNH], [TemCarro]) VALUES (5, 5, N'567.890.123-45', N'Elaine Costa', N'elaine.costa@example.com', N'(51) 91111-2222', N'safePass', CAST(N'1989-09-10' AS Date), N'https://example.com/fotos/elaine.jpg', N'Pacientes dizem que sou atenciosa e dedicada.', N'Não', N'Sim', N'Não', N'Sim')
INSERT [dbo].[Cuidador] ([IdCuidador], [IdEndereco], [Cpf], [Nome], [Email], [Telefone], [Senha], [DataNascimento], [FotoUrl], [Biografia], [Fumante], [TemFilhos], [PossuiCNH], [TemCarro]) VALUES (6, 6, N'678.901.234-56', N'Felipe Martins', N'felipe.martins@example.com', N'(61) 93333-4444', N'senha789', CAST(N'1992-11-28' AS Date), N'https://example.com/fotos/felipe.jpg', N'Cuidador com experiência hospitalar.', N'Não', N'Não', N'Sim', N'Sim')
INSERT [dbo].[Cuidador] ([IdCuidador], [IdEndereco], [Cpf], [Nome], [Email], [Telefone], [Senha], [DataNascimento], [FotoUrl], [Biografia], [Fumante], [TemFilhos], [PossuiCNH], [TemCarro]) VALUES (7, 7, N'789.012.345-67', N'Gisele Alves', N'gisele.alves@example.com', N'(71) 95555-6666', N'gisele123', CAST(N'1987-01-14' AS Date), N'https://example.com/fotos/gisele.jpg', N'Especialista em cuidados pós-operatórios.', N'Sim', N'Não', N'Sim', N'Não')
INSERT [dbo].[Cuidador] ([IdCuidador], [IdEndereco], [Cpf], [Nome], [Email], [Telefone], [Senha], [DataNascimento], [FotoUrl], [Biografia], [Fumante], [TemFilhos], [PossuiCNH], [TemCarro]) VALUES (8, 8, N'890.123.456-78', N'Henrique Dias', N'henrique.dias@example.com', N'(81) 97777-8888', N'henrique456', CAST(N'1995-04-09' AS Date), N'https://example.com/fotos/henrique.jpg', N'Atendo com empatia e paciência.', N'Não', N'Sim', N'Sim', N'Não')
INSERT [dbo].[Cuidador] ([IdCuidador], [IdEndereco], [Cpf], [Nome], [Email], [Telefone], [Senha], [DataNascimento], [FotoUrl], [Biografia], [Fumante], [TemFilhos], [PossuiCNH], [TemCarro]) VALUES (9, 9, N'901.234.567-89', N'Isabela Silva', N'isabela.silva@example.com', N'(91) 99999-0000', N'isa789', CAST(N'1980-02-17' AS Date), N'https://example.com/fotos/isabela.jpg', N'Trabalho com idosos há mais de 15 anos.', N'Sim', N'Sim', N'Não', N'Sim')
INSERT [dbo].[Cuidador] ([IdCuidador], [IdEndereco], [Cpf], [Nome], [Email], [Telefone], [Senha], [DataNascimento], [FotoUrl], [Biografia], [Fumante], [TemFilhos], [PossuiCNH], [TemCarro]) VALUES (10, 10, N'012.345.678-90', N'João Ferreira', N'joao.ferreira@example.com', N'(85) 91234-5678', N'joaosenha', CAST(N'1983-08-25' AS Date), N'https://example.com/fotos/joao.jpg', N'Experiência em cuidados com restrição de mobilidade.', N'Não', N'Não', N'Não', N'Não')
SET IDENTITY_INSERT [dbo].[Cuidador] OFF
GO
SET IDENTITY_INSERT [dbo].[CuidadorEspecialidade] ON 

INSERT [dbo].[CuidadorEspecialidade] ([IdCuidadorEspecialidade], [IdCuidador], [IdEspecialidade]) VALUES (1, 1, 1)
INSERT [dbo].[CuidadorEspecialidade] ([IdCuidadorEspecialidade], [IdCuidador], [IdEspecialidade]) VALUES (2, 1, 2)
INSERT [dbo].[CuidadorEspecialidade] ([IdCuidadorEspecialidade], [IdCuidador], [IdEspecialidade]) VALUES (3, 2, 1)
INSERT [dbo].[CuidadorEspecialidade] ([IdCuidadorEspecialidade], [IdCuidador], [IdEspecialidade]) VALUES (4, 3, 3)
INSERT [dbo].[CuidadorEspecialidade] ([IdCuidadorEspecialidade], [IdCuidador], [IdEspecialidade]) VALUES (5, 4, 2)
INSERT [dbo].[CuidadorEspecialidade] ([IdCuidadorEspecialidade], [IdCuidador], [IdEspecialidade]) VALUES (6, 4, 4)
INSERT [dbo].[CuidadorEspecialidade] ([IdCuidadorEspecialidade], [IdCuidador], [IdEspecialidade]) VALUES (7, 5, 5)
INSERT [dbo].[CuidadorEspecialidade] ([IdCuidadorEspecialidade], [IdCuidador], [IdEspecialidade]) VALUES (8, 6, 1)
INSERT [dbo].[CuidadorEspecialidade] ([IdCuidadorEspecialidade], [IdCuidador], [IdEspecialidade]) VALUES (9, 7, 3)
INSERT [dbo].[CuidadorEspecialidade] ([IdCuidadorEspecialidade], [IdCuidador], [IdEspecialidade]) VALUES (10, 8, 2)
SET IDENTITY_INSERT [dbo].[CuidadorEspecialidade] OFF
GO
SET IDENTITY_INSERT [dbo].[CuidadorServico] ON 

INSERT [dbo].[CuidadorServico] ([IdCuidadorServico], [IdCuidador], [IdServico]) VALUES (5, 2, 2)
INSERT [dbo].[CuidadorServico] ([IdCuidadorServico], [IdCuidador], [IdServico]) VALUES (6, 2, 3)
INSERT [dbo].[CuidadorServico] ([IdCuidadorServico], [IdCuidador], [IdServico]) VALUES (7, 2, 2)
INSERT [dbo].[CuidadorServico] ([IdCuidadorServico], [IdCuidador], [IdServico]) VALUES (8, 3, 2)
INSERT [dbo].[CuidadorServico] ([IdCuidadorServico], [IdCuidador], [IdServico]) VALUES (9, 3, 4)
INSERT [dbo].[CuidadorServico] ([IdCuidadorServico], [IdCuidador], [IdServico]) VALUES (10, 4, 5)
INSERT [dbo].[CuidadorServico] ([IdCuidadorServico], [IdCuidador], [IdServico]) VALUES (11, 5, 2)
INSERT [dbo].[CuidadorServico] ([IdCuidadorServico], [IdCuidador], [IdServico]) VALUES (12, 6, 2)
INSERT [dbo].[CuidadorServico] ([IdCuidadorServico], [IdCuidador], [IdServico]) VALUES (13, 7, 3)
INSERT [dbo].[CuidadorServico] ([IdCuidadorServico], [IdCuidador], [IdServico]) VALUES (14, 8, 4)
SET IDENTITY_INSERT [dbo].[CuidadorServico] OFF
GO
SET IDENTITY_INSERT [dbo].[Disponibilidade] ON 

INSERT [dbo].[Disponibilidade] ([IdDisponibilidade], [IdCuidador], [DiaSemana], [DataInicio], [DataFim], [Observacoes], [Recorrente]) VALUES (5, 1, N'Segunda-feira', CAST(N'2025-05-12T08:00:00.000' AS DateTime), CAST(N'2025-05-12T12:00:00.000' AS DateTime), N'Disponível pela manhã.', 1)
INSERT [dbo].[Disponibilidade] ([IdDisponibilidade], [IdCuidador], [DiaSemana], [DataInicio], [DataFim], [Observacoes], [Recorrente]) VALUES (6, 2, N'Terça-feira', CAST(N'2025-05-13T13:00:00.000' AS DateTime), CAST(N'2025-05-13T17:00:00.000' AS DateTime), N'Período da tarde disponível.', 1)
INSERT [dbo].[Disponibilidade] ([IdDisponibilidade], [IdCuidador], [DiaSemana], [DataInicio], [DataFim], [Observacoes], [Recorrente]) VALUES (7, 3, N'Quarta-feira', CAST(N'2025-05-14T07:00:00.000' AS DateTime), CAST(N'2025-05-14T11:00:00.000' AS DateTime), N'Disponível para acompanhamentos.', 1)
INSERT [dbo].[Disponibilidade] ([IdDisponibilidade], [IdCuidador], [DiaSemana], [DataInicio], [DataFim], [Observacoes], [Recorrente]) VALUES (8, 4, N'Quinta-feira', CAST(N'2025-05-15T14:00:00.000' AS DateTime), CAST(N'2025-05-15T18:00:00.000' AS DateTime), N'Disponível após o almoço.', 0)
INSERT [dbo].[Disponibilidade] ([IdDisponibilidade], [IdCuidador], [DiaSemana], [DataInicio], [DataFim], [Observacoes], [Recorrente]) VALUES (9, 5, N'Sexta-feira', CAST(N'2025-05-16T09:00:00.000' AS DateTime), CAST(N'2025-05-16T13:00:00.000' AS DateTime), N'Disponibilidade parcial.', 1)
INSERT [dbo].[Disponibilidade] ([IdDisponibilidade], [IdCuidador], [DiaSemana], [DataInicio], [DataFim], [Observacoes], [Recorrente]) VALUES (10, 6, N'Sábado', CAST(N'2025-05-17T10:00:00.000' AS DateTime), CAST(N'2025-05-17T16:00:00.000' AS DateTime), N'Disponível para plantões.', 1)
INSERT [dbo].[Disponibilidade] ([IdDisponibilidade], [IdCuidador], [DiaSemana], [DataInicio], [DataFim], [Observacoes], [Recorrente]) VALUES (11, 7, N'Domingo', CAST(N'2025-05-18T08:00:00.000' AS DateTime), CAST(N'2025-05-18T12:00:00.000' AS DateTime), N'Disponível para emergências.', 0)
INSERT [dbo].[Disponibilidade] ([IdDisponibilidade], [IdCuidador], [DiaSemana], [DataInicio], [DataFim], [Observacoes], [Recorrente]) VALUES (12, 8, N'Segunda-feira', CAST(N'2025-05-19T15:00:00.000' AS DateTime), CAST(N'2025-05-19T20:00:00.000' AS DateTime), N'Disponível à tarde e à noite.', 1)
INSERT [dbo].[Disponibilidade] ([IdDisponibilidade], [IdCuidador], [DiaSemana], [DataInicio], [DataFim], [Observacoes], [Recorrente]) VALUES (13, 9, N'Terça-feira', CAST(N'2025-05-20T06:00:00.000' AS DateTime), CAST(N'2025-05-20T10:00:00.000' AS DateTime), N'Disponibilidade matinal.', 1)
INSERT [dbo].[Disponibilidade] ([IdDisponibilidade], [IdCuidador], [DiaSemana], [DataInicio], [DataFim], [Observacoes], [Recorrente]) VALUES (14, 10, N'Quarta-feira', CAST(N'2025-05-21T12:00:00.000' AS DateTime), CAST(N'2025-05-21T18:00:00.000' AS DateTime), N'Período integral à tarde.', 0)
SET IDENTITY_INSERT [dbo].[Disponibilidade] OFF
GO
SET IDENTITY_INSERT [dbo].[Doenca] ON 

INSERT [dbo].[Doenca] ([IdDoenca], [Nome], [Descricao]) VALUES (1, N'Alzheimer', N'Doença neurodegenerativa que causa perda de memória e outras habilidades cognitivas.')
INSERT [dbo].[Doenca] ([IdDoenca], [Nome], [Descricao]) VALUES (2, N'Parkinson', N'Distúrbio do sistema nervoso central que afeta o movimento.')
INSERT [dbo].[Doenca] ([IdDoenca], [Nome], [Descricao]) VALUES (3, N'Diabetes Tipo 2', N'Condição crônica que afeta a forma como o corpo processa o açúcar.')
INSERT [dbo].[Doenca] ([IdDoenca], [Nome], [Descricao]) VALUES (4, N'Hipertensão', N'Pressão arterial persistentemente elevada.')
INSERT [dbo].[Doenca] ([IdDoenca], [Nome], [Descricao]) VALUES (5, N'Artrose', N'Desgaste da cartilagem das articulações, causando dor e rigidez.')
INSERT [dbo].[Doenca] ([IdDoenca], [Nome], [Descricao]) VALUES (6, N'AVC (Acidente Vascular Cerebral)', N'Interrupção do fluxo sanguíneo no cérebro, pode causar paralisia e perda de funções.')
INSERT [dbo].[Doenca] ([IdDoenca], [Nome], [Descricao]) VALUES (7, N'Insuficiência Cardíaca', N'Condição em que o coração não bombeia sangue de forma eficiente.')
INSERT [dbo].[Doenca] ([IdDoenca], [Nome], [Descricao]) VALUES (8, N'Osteoporose', N'Redução da densidade óssea, aumentando o risco de fraturas.')
INSERT [dbo].[Doenca] ([IdDoenca], [Nome], [Descricao]) VALUES (9, N'Demência Senil', N'Declínio cognitivo devido ao envelhecimento.')
INSERT [dbo].[Doenca] ([IdDoenca], [Nome], [Descricao]) VALUES (10, N'Incontinência Urinária', N'Perda involuntária de urina, comum em idosos.')
SET IDENTITY_INSERT [dbo].[Doenca] OFF
GO
SET IDENTITY_INSERT [dbo].[Endereco] ON 

INSERT [dbo].[Endereco] ([IdEndereco], [Cidade], [Bairro], [Rua], [Numero], [Complemento], [Cep]) VALUES (1, N'São Paulo', N'Vila Mariana', N'Rua Domingos de Morais', N'1234', N'Apto 101', N'04010-100')
INSERT [dbo].[Endereco] ([IdEndereco], [Cidade], [Bairro], [Rua], [Numero], [Complemento], [Cep]) VALUES (2, N'Rio de Janeiro', N'Copacabana', N'Av. Atlântica', N'456', N'Bloco B', N'22010-000')
INSERT [dbo].[Endereco] ([IdEndereco], [Cidade], [Bairro], [Rua], [Numero], [Complemento], [Cep]) VALUES (3, N'Belo Horizonte', N'Savassi', N'Rua Pernambuco', N'789', N'', N'30130-151')
INSERT [dbo].[Endereco] ([IdEndereco], [Cidade], [Bairro], [Rua], [Numero], [Complemento], [Cep]) VALUES (4, N'Curitiba', N'Batel', N'Av. do Batel', N'321', N'Sala 10', N'80420-090')
INSERT [dbo].[Endereco] ([IdEndereco], [Cidade], [Bairro], [Rua], [Numero], [Complemento], [Cep]) VALUES (5, N'Porto Alegre', N'Moinhos de Vento', N'Rua Padre Chagas', N'876', N'', N'90570-080')
INSERT [dbo].[Endereco] ([IdEndereco], [Cidade], [Bairro], [Rua], [Numero], [Complemento], [Cep]) VALUES (6, N'Salvador', N'Barra', N'Av. Oceânica', N'159', N'Casa 3', N'40140-130')
INSERT [dbo].[Endereco] ([IdEndereco], [Cidade], [Bairro], [Rua], [Numero], [Complemento], [Cep]) VALUES (7, N'Florianópolis', N'Centro', N'Rua Felipe Schmidt', N'258', N'Apto 402', N'88010-001')
INSERT [dbo].[Endereco] ([IdEndereco], [Cidade], [Bairro], [Rua], [Numero], [Complemento], [Cep]) VALUES (8, N'Fortaleza', N'Meireles', N'Rua Silva Jatahy', N'963', N'', N'60165-070')
INSERT [dbo].[Endereco] ([IdEndereco], [Cidade], [Bairro], [Rua], [Numero], [Complemento], [Cep]) VALUES (9, N'Brasília', N'Asa Sul', N'SQS 205', N'Bloco A', N'Apto 302', N'70232-020')
INSERT [dbo].[Endereco] ([IdEndereco], [Cidade], [Bairro], [Rua], [Numero], [Complemento], [Cep]) VALUES (10, N'Recife', N'Boa Viagem', N'Rua dos Navegantes', N'741', N'Cobertura', N'51021-010')
SET IDENTITY_INSERT [dbo].[Endereco] OFF
GO
SET IDENTITY_INSERT [dbo].[Especialidade] ON 

INSERT [dbo].[Especialidade] ([IdEspecialidade], [Nome], [Descricao]) VALUES (1, N'Cuidados Paliativos', N'Cuidados especializados para pacientes em fase terminal, com foco no conforto e qualidade de vida.')
INSERT [dbo].[Especialidade] ([IdEspecialidade], [Nome], [Descricao]) VALUES (2, N'Alzheimer', N'Atendimento especializado para pacientes com Alzheimer e outras doenças neurodegenerativas.')
INSERT [dbo].[Especialidade] ([IdEspecialidade], [Nome], [Descricao]) VALUES (3, N'Cuidados Pós-Cirúrgicos', N'Apoio a pacientes que estão em recuperação após procedimentos cirúrgicos, com foco na reabilitação.')
INSERT [dbo].[Especialidade] ([IdEspecialidade], [Nome], [Descricao]) VALUES (4, N'Mobilização e Reabilitação', N'Técnicas de mobilização e reabilitação para pacientes com dificuldade de movimento.')
INSERT [dbo].[Especialidade] ([IdEspecialidade], [Nome], [Descricao]) VALUES (5, N'Cuidados Geriátricos', N'Cuidados voltados para a saúde e bem-estar dos idosos, promovendo qualidade de vida.')
INSERT [dbo].[Especialidade] ([IdEspecialidade], [Nome], [Descricao]) VALUES (6, N'Acompanhamento Psicossocial', N'Apoio psicológico para pacientes e familiares, especialmente em casos de doenças crônicas.')
INSERT [dbo].[Especialidade] ([IdEspecialidade], [Nome], [Descricao]) VALUES (7, N'Enfermagem', N'Serviços de enfermagem, como administração de medicamentos e monitoramento de saúde.')
INSERT [dbo].[Especialidade] ([IdEspecialidade], [Nome], [Descricao]) VALUES (8, N'Atendimento em Domicílio', N'Cuidados prestados diretamente na residência do paciente, para maior comodidade e conforto.')
INSERT [dbo].[Especialidade] ([IdEspecialidade], [Nome], [Descricao]) VALUES (9, N'Cuidados com Pacientes Acamados', N'Apoio a pacientes acamados, com foco na prevenção de complicações e manutenção da saúde.')
INSERT [dbo].[Especialidade] ([IdEspecialidade], [Nome], [Descricao]) VALUES (10, N'Cuidados com Deficiência Física', N'Cuidados especializados para pacientes com limitações físicas permanentes ou temporárias.')
SET IDENTITY_INSERT [dbo].[Especialidade] OFF
GO
SET IDENTITY_INSERT [dbo].[Experiencia] ON 

INSERT [dbo].[Experiencia] ([IdExperiencia], [IdCuidador], [Descricao]) VALUES (1, 1, N'Trabalhou 2 anos em clínica geriátrica especializada em Alzheimer.')
INSERT [dbo].[Experiencia] ([IdExperiencia], [IdCuidador], [Descricao]) VALUES (2, 2, N'Experiência com cuidados paliativos domiciliares por 3 anos.')
INSERT [dbo].[Experiencia] ([IdExperiencia], [IdCuidador], [Descricao]) VALUES (3, 3, N'Atuou em hospital público na ala de internação de idosos.')
INSERT [dbo].[Experiencia] ([IdExperiencia], [IdCuidador], [Descricao]) VALUES (4, 4, N'Cuidadora particular de paciente com mobilidade reduzida por 5 anos.')
INSERT [dbo].[Experiencia] ([IdExperiencia], [IdCuidador], [Descricao]) VALUES (5, 5, N'Experiência com administração de medicamentos e aferição de sinais vitais.')
INSERT [dbo].[Experiencia] ([IdExperiencia], [IdCuidador], [Descricao]) VALUES (6, 6, N'Trabalhou em abrigo com ênfase em atenção psicossocial.')
INSERT [dbo].[Experiencia] ([IdExperiencia], [IdCuidador], [Descricao]) VALUES (7, 7, N'Acompanhamento de idosos em atividades externas como consultas e caminhadas.')
INSERT [dbo].[Experiencia] ([IdExperiencia], [IdCuidador], [Descricao]) VALUES (8, 8, N'Experiência em cuidados noturnos com idosos acamados.')
INSERT [dbo].[Experiencia] ([IdExperiencia], [IdCuidador], [Descricao]) VALUES (9, 9, N'Trabalho voluntário em lar de idosos com foco em reabilitação física.')
INSERT [dbo].[Experiencia] ([IdExperiencia], [IdCuidador], [Descricao]) VALUES (10, 10, N'Atendimento domiciliar com foco em reabilitação pós-operatória.')
SET IDENTITY_INSERT [dbo].[Experiencia] OFF
GO
SET IDENTITY_INSERT [dbo].[Formacao] ON 

INSERT [dbo].[Formacao] ([IdFormacao], [IdCuidador], [Descricao]) VALUES (1, 2, N'Curso Técnico de Enfermagem - Concluído em 2020')
INSERT [dbo].[Formacao] ([IdFormacao], [IdCuidador], [Descricao]) VALUES (2, 2, N'Especialização em Cuidados com Idosos - 2022')
INSERT [dbo].[Formacao] ([IdFormacao], [IdCuidador], [Descricao]) VALUES (3, 2, N'Curso de Cuidador de Idosos - SENAC - 2019')
INSERT [dbo].[Formacao] ([IdFormacao], [IdCuidador], [Descricao]) VALUES (4, 2, N'Treinamento em Primeiros Socorros - 2021')
INSERT [dbo].[Formacao] ([IdFormacao], [IdCuidador], [Descricao]) VALUES (5, 3, N'Curso de Auxiliar de Enfermagem Domiciliar - 2018')
INSERT [dbo].[Formacao] ([IdFormacao], [IdCuidador], [Descricao]) VALUES (6, 3, N'Atualização em Alzheimer e Demência Senil - 2023')
INSERT [dbo].[Formacao] ([IdFormacao], [IdCuidador], [Descricao]) VALUES (7, 4, N'Curso de Noções Básicas de Gerontologia - 2020')
INSERT [dbo].[Formacao] ([IdFormacao], [IdCuidador], [Descricao]) VALUES (8, 4, N'Formação em Cuidados Paliativos - 2022')
INSERT [dbo].[Formacao] ([IdFormacao], [IdCuidador], [Descricao]) VALUES (9, 5, N'Capacitação em Higiene e Mobilidade de Idosos - 2021')
INSERT [dbo].[Formacao] ([IdFormacao], [IdCuidador], [Descricao]) VALUES (10, 5, N'Formação Técnica em Saúde da Pessoa Idosa - 2023')
SET IDENTITY_INSERT [dbo].[Formacao] OFF
GO
SET IDENTITY_INSERT [dbo].[HistoricoAdministrador] ON 

INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1, 1, N'Login', CAST(N'2025-05-22T14:37:25.920' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (2, 1, N'Login', CAST(N'2025-05-22T14:56:04.163' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (3, 1, N'Logout', CAST(N'2025-05-22T14:56:06.727' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1002, 1, N'Login', CAST(N'2025-05-23T11:31:45.177' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1003, 1, N'Login', CAST(N'2025-05-23T11:33:22.100' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1004, 1, N'Login', CAST(N'2025-05-23T11:36:21.260' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1005, 1, N'Login', CAST(N'2025-05-23T12:28:41.693' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1006, 1, N'Login', CAST(N'2025-05-23T12:59:34.773' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1007, 1, N'Login', CAST(N'2025-05-26T14:55:33.083' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1008, 1, N'Login', CAST(N'2025-05-26T15:14:08.740' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1009, 1, N'Login', CAST(N'2025-05-26T15:48:15.373' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1010, 1, N'Login', CAST(N'2025-05-26T17:35:45.347' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1011, 1, N'Login', CAST(N'2025-05-26T18:53:24.210' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1012, 1, N'Logout', CAST(N'2025-05-26T19:15:22.600' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1013, 1, N'Login', CAST(N'2025-05-26T19:15:58.673' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1014, 1, N'Logout', CAST(N'2025-05-26T19:19:28.770' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1015, 1, N'Login', CAST(N'2025-05-26T19:19:39.670' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1016, 1, N'Login', CAST(N'2025-05-26T19:45:27.477' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1017, 1, N'Login', CAST(N'2025-05-26T19:45:38.023' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1018, 1, N'Login', CAST(N'2025-05-26T19:45:50.533' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1019, 1, N'Login', CAST(N'2025-05-26T19:47:11.127' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1020, 1, N'Login', CAST(N'2025-05-26T19:47:23.127' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1021, 1, N'Login', CAST(N'2025-05-26T19:50:38.127' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1022, 1, N'Login', CAST(N'2025-05-26T19:50:52.813' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1023, 1, N'Login', CAST(N'2025-05-26T19:53:16.933' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1024, 1, N'Login', CAST(N'2025-05-26T19:53:37.870' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1025, 5, N'Login', CAST(N'2025-05-26T19:54:40.447' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1026, 1, N'Login', CAST(N'2025-05-26T19:56:59.943' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1027, 1, N'Login', CAST(N'2025-05-26T19:57:10.673' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1028, 1, N'Login', CAST(N'2025-05-26T19:57:15.253' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1029, 1, N'Login', CAST(N'2025-05-26T19:58:36.563' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1030, 1, N'Login', CAST(N'2025-05-26T20:02:31.860' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1031, 1, N'Login', CAST(N'2025-05-26T20:07:36.797' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1032, 1, N'Login', CAST(N'2025-05-26T20:08:09.960' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1033, 1, N'Login', CAST(N'2025-05-26T20:08:52.420' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1034, 1, N'Login', CAST(N'2025-05-26T20:09:07.223' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1035, 1, N'Login', CAST(N'2025-05-26T20:09:22.303' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1036, 1, N'Login', CAST(N'2025-05-26T20:09:38.300' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1037, 1, N'Login', CAST(N'2025-05-26T20:25:38.070' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1038, 1, N'Login', CAST(N'2025-05-26T20:25:59.697' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1039, 1, N'Login', CAST(N'2025-05-26T20:29:30.883' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1040, 1, N'Login', CAST(N'2025-05-26T20:34:18.260' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1041, 1, N'Login', CAST(N'2025-05-26T20:35:05.120' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1042, 1, N'Login', CAST(N'2025-05-26T20:40:34.683' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1043, 1, N'Login', CAST(N'2025-05-26T20:41:41.800' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1044, 1, N'Login', CAST(N'2025-05-26T20:46:33.320' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1045, 1, N'Login', CAST(N'2025-05-26T21:39:18.677' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1046, 1, N'Login', CAST(N'2025-05-26T21:44:28.380' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1047, 1, N'Login', CAST(N'2025-05-26T22:17:09.190' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1048, 1, N'Login', CAST(N'2025-05-27T12:40:36.173' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1049, 1, N'Login', CAST(N'2025-05-27T12:52:12.817' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1050, 1, N'Login', CAST(N'2025-05-27T13:06:47.153' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1051, 1, N'Login', CAST(N'2025-05-27T13:10:13.850' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1052, 1, N'Login', CAST(N'2025-05-27T13:14:44.577' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1053, 1, N'Login', CAST(N'2025-05-27T13:22:42.020' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1054, 1, N'Login', CAST(N'2025-05-27T13:25:52.360' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1055, 1, N'Login', CAST(N'2025-05-27T13:57:43.613' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1056, 1, N'Logout', CAST(N'2025-05-27T14:08:14.287' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1057, 1, N'Login', CAST(N'2025-05-27T14:08:24.220' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1058, 1, N'Login', CAST(N'2025-05-27T14:38:59.010' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1059, 1, N'Login', CAST(N'2025-05-27T14:42:11.487' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1060, 1, N'Login', CAST(N'2025-05-27T14:44:52.073' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1061, 1, N'Login', CAST(N'2025-05-27T14:44:55.387' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1062, 1, N'Login', CAST(N'2025-05-27T14:48:14.047' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1063, 1, N'Login', CAST(N'2025-05-27T14:53:41.500' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1064, 1, N'Login', CAST(N'2025-05-27T15:18:16.043' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1065, 1, N'Login', CAST(N'2025-05-27T15:19:59.280' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1066, 1, N'Login', CAST(N'2025-05-27T15:28:40.357' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1067, 1, N'Login', CAST(N'2025-05-27T15:31:13.587' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1068, 1, N'Login', CAST(N'2025-05-27T15:34:35.513' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1069, 1, N'Login', CAST(N'2025-05-27T15:35:56.807' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1070, 1, N'Login', CAST(N'2025-05-27T15:38:24.973' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1071, 1, N'Login', CAST(N'2025-05-27T17:58:50.180' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1072, 1, N'Logout', CAST(N'2025-05-27T18:01:01.060' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1073, 1, N'Login', CAST(N'2025-05-27T18:01:21.680' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1074, 1, N'Logout', CAST(N'2025-05-27T18:04:18.257' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1075, 1, N'Login', CAST(N'2025-05-27T18:04:36.060' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1076, 1, N'Login', CAST(N'2025-05-27T18:05:33.473' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1077, 1, N'Login', CAST(N'2025-05-27T18:08:09.203' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1078, 1, N'Login', CAST(N'2025-05-27T18:11:09.020' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1079, NULL, N'Idoso ddddd (ID 14) criado.', CAST(N'2025-05-27T18:11:27.977' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1080, 1, N'Login', CAST(N'2025-05-27T18:17:18.123' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1081, NULL, N'Idoso aaaaa (ID 15) criado.', CAST(N'2025-05-27T18:17:37.060' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1082, 1, N'Login', CAST(N'2025-05-27T18:18:48.163' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1083, NULL, N'Idoso ddddddddddddddddddd (ID 16) criado.', CAST(N'2025-05-27T18:19:08.060' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1084, 1, N'Login', CAST(N'2025-05-27T18:20:50.850' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1085, 1, N'Login', CAST(N'2025-05-27T18:22:19.083' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1086, 1, N'Login', CAST(N'2025-05-27T18:25:16.803' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1087, 1, N'Login', CAST(N'2025-05-27T18:26:41.410' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1088, 1, N'Idoso df\dsf\dsf\dsf (ID 17) criado.', CAST(N'2025-05-27T18:27:00.770' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1089, 1, N'Login', CAST(N'2025-05-27T18:31:05.680' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1090, NULL, N'Idoso Marcos (ID ) alterado.', CAST(N'2025-05-27T18:31:25.440' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1091, 1, N'Login', CAST(N'2025-05-27T18:36:05.837' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1092, NULL, N'Idoso Marcos01 (ID 17) alterado.', CAST(N'2025-05-27T18:36:15.953' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1093, 1, N'Login', CAST(N'2025-05-27T18:39:37.053' AS DateTime))
INSERT [dbo].[HistoricoAdministrador] ([IdHistoricoAdm], [IdAdministrador], [Operacao], [DataOperacao]) VALUES (1094, 1, N'Idoso Marcos0007 (ID 17) alterado.', CAST(N'2025-05-27T18:39:51.753' AS DateTime))
SET IDENTITY_INSERT [dbo].[HistoricoAdministrador] OFF
GO
SET IDENTITY_INSERT [dbo].[HistoricoAtendimento] ON 

INSERT [dbo].[HistoricoAtendimento] ([IdHistorico], [IdAtendimento], [StatusFinal], [DataRegistro], [Observacoes]) VALUES (2, 2, N'Finalizado', CAST(N'2025-01-06T11:15:00.000' AS DateTime), N'Atendimento concluído com sucesso. Idoso cooperou bem.')
INSERT [dbo].[HistoricoAtendimento] ([IdHistorico], [IdAtendimento], [StatusFinal], [DataRegistro], [Observacoes]) VALUES (3, 2, N'Finalizado', CAST(N'2025-02-06T15:45:00.000' AS DateTime), N'Sessão de fisioterapia completa. Leve melhora na amplitude.')
INSERT [dbo].[HistoricoAtendimento] ([IdHistorico], [IdAtendimento], [StatusFinal], [DataRegistro], [Observacoes]) VALUES (5, 4, N'Concluído', CAST(N'2025-04-06T10:10:00.000' AS DateTime), N'Cuidados de higiene e café da manhã prestados. Idoso bem cuidado.')
INSERT [dbo].[HistoricoAtendimento] ([IdHistorico], [IdAtendimento], [StatusFinal], [DataRegistro], [Observacoes]) VALUES (6, 5, N'Reagendado', CAST(N'2025-05-06T15:30:00.000' AS DateTime), N'Consulta com cardiologista reagendada devido a problema na clínica.')
INSERT [dbo].[HistoricoAtendimento] ([IdHistorico], [IdAtendimento], [StatusFinal], [DataRegistro], [Observacoes]) VALUES (7, 6, N'Finalizado', CAST(N'2025-06-06T17:15:00.000' AS DateTime), N'Passeio realizado. Idoso aproveitou o ar livre.')
INSERT [dbo].[HistoricoAtendimento] ([IdHistorico], [IdAtendimento], [StatusFinal], [DataRegistro], [Observacoes]) VALUES (9, 8, N'Finalizado', CAST(N'2025-08-06T12:05:00.000' AS DateTime), N'Atividades de memória concluídas. Idoso demonstrou bom engajamento.')
INSERT [dbo].[HistoricoAtendimento] ([IdHistorico], [IdAtendimento], [StatusFinal], [DataRegistro], [Observacoes]) VALUES (10, 9, N'Concluído', CAST(N'2025-09-06T19:10:00.000' AS DateTime), N'Jantar preparado e servido. Ambiente limpo e organizado.')
INSERT [dbo].[HistoricoAtendimento] ([IdHistorico], [IdAtendimento], [StatusFinal], [DataRegistro], [Observacoes]) VALUES (11, 10, N'Finalizado', CAST(N'2025-10-06T09:15:00.000' AS DateTime), N'Rotina matinal completa. Idoso interagiu bastante durante a leitura.')
INSERT [dbo].[HistoricoAtendimento] ([IdHistorico], [IdAtendimento], [StatusFinal], [DataRegistro], [Observacoes]) VALUES (12, 2, N'Finalizado', CAST(N'2025-01-06T11:15:00.000' AS DateTime), N'Atendimento concluído com sucesso. Idoso cooperou bem.')
INSERT [dbo].[HistoricoAtendimento] ([IdHistorico], [IdAtendimento], [StatusFinal], [DataRegistro], [Observacoes]) VALUES (13, 2, N'Finalizado', CAST(N'2025-02-06T15:45:00.000' AS DateTime), N'Sessão de fisioterapia completa. Leve melhora na amplitude.')
INSERT [dbo].[HistoricoAtendimento] ([IdHistorico], [IdAtendimento], [StatusFinal], [DataRegistro], [Observacoes]) VALUES (15, 4, N'Concluído', CAST(N'2025-04-06T10:10:00.000' AS DateTime), N'Cuidados de higiene e café da manhã prestados. Idoso bem cuidado.')
INSERT [dbo].[HistoricoAtendimento] ([IdHistorico], [IdAtendimento], [StatusFinal], [DataRegistro], [Observacoes]) VALUES (16, 5, N'Reagendado', CAST(N'2025-05-06T15:30:00.000' AS DateTime), N'Consulta com cardiologista reagendada devido a problema na clínica.')
INSERT [dbo].[HistoricoAtendimento] ([IdHistorico], [IdAtendimento], [StatusFinal], [DataRegistro], [Observacoes]) VALUES (17, 6, N'Finalizado', CAST(N'2025-06-06T17:15:00.000' AS DateTime), N'Passeio realizado. Idoso aproveitou o ar livre.')
INSERT [dbo].[HistoricoAtendimento] ([IdHistorico], [IdAtendimento], [StatusFinal], [DataRegistro], [Observacoes]) VALUES (19, 8, N'Finalizado', CAST(N'2025-08-06T12:05:00.000' AS DateTime), N'Atividades de memória concluídas. Idoso demonstrou bom engajamento.')
INSERT [dbo].[HistoricoAtendimento] ([IdHistorico], [IdAtendimento], [StatusFinal], [DataRegistro], [Observacoes]) VALUES (20, 9, N'Concluído', CAST(N'2025-09-06T19:10:00.000' AS DateTime), N'Jantar preparado e servido. Ambiente limpo e organizado.')
INSERT [dbo].[HistoricoAtendimento] ([IdHistorico], [IdAtendimento], [StatusFinal], [DataRegistro], [Observacoes]) VALUES (21, 10, N'Finalizado', CAST(N'2025-10-06T09:15:00.000' AS DateTime), N'Rotina matinal completa. Idoso interagiu bastante durante a leitura.')
SET IDENTITY_INSERT [dbo].[HistoricoAtendimento] OFF
GO
SET IDENTITY_INSERT [dbo].[Idoso] ON 

INSERT [dbo].[Idoso] ([IdIdoso], [IdResponsavel], [IdMobilidade], [IdNivelAutonomia], [Nome], [DataNascimento], [Sexo], [CuidadosMedicos], [DescricaoExtra], [FotoUrl]) VALUES (3, 2, 2, 2, N'Maria Oliveira', CAST(N'1938-07-22' AS Date), N'Feminino', N'Hipertensão, uso de Amlodipina.', N'Precisa de ajuda para locomoção.', N'https://example.com/fotos/maria.jpg')
INSERT [dbo].[Idoso] ([IdIdoso], [IdResponsavel], [IdMobilidade], [IdNivelAutonomia], [Nome], [DataNascimento], [Sexo], [CuidadosMedicos], [DescricaoExtra], [FotoUrl]) VALUES (4, 3, 3, 3, N'Antônio Souza', CAST(N'1945-01-30' AS Date), N'Masculino', N'Diabetes tipo 2, insulina diária.', N'Utiliza cadeira de rodas.', N'https://example.com/fotos/antonio.jpg')
INSERT [dbo].[Idoso] ([IdIdoso], [IdResponsavel], [IdMobilidade], [IdNivelAutonomia], [Nome], [DataNascimento], [Sexo], [CuidadosMedicos], [DescricaoExtra], [FotoUrl]) VALUES (5, 4, 4, 4, N'Rita Mendes', CAST(N'1935-11-10' AS Date), N'Feminino', N'Problemas de coluna, usa andador.', N'Lúcida e comunicativa.', N'https://example.com/fotos/rita.jpg')
INSERT [dbo].[Idoso] ([IdIdoso], [IdResponsavel], [IdMobilidade], [IdNivelAutonomia], [Nome], [DataNascimento], [Sexo], [CuidadosMedicos], [DescricaoExtra], [FotoUrl]) VALUES (6, 5, 5, 5, N'Carlos Pereira', CAST(N'1940-06-18' AS Date), N'Masculino', N'Cardiopatia leve.', N'Precisa de acompanhamento em caminhadas.', N'https://example.com/fotos/carlos.jpg')
INSERT [dbo].[Idoso] ([IdIdoso], [IdResponsavel], [IdMobilidade], [IdNivelAutonomia], [Nome], [DataNascimento], [Sexo], [CuidadosMedicos], [DescricaoExtra], [FotoUrl]) VALUES (7, 6, 6, 6, N'Helena Costa', CAST(N'1939-09-09' AS Date), N'Feminino', N'Recuperando de cirurgia no quadril.', N'Usa cadeira com ajuda parcial.', N'https://example.com/fotos/helena.jpg')
INSERT [dbo].[Idoso] ([IdIdoso], [IdResponsavel], [IdMobilidade], [IdNivelAutonomia], [Nome], [DataNascimento], [Sexo], [CuidadosMedicos], [DescricaoExtra], [FotoUrl]) VALUES (8, 7, 7, 7, N'Joaquim Ramos', CAST(N'1943-12-01' AS Date), N'Masculino', N'Artrose nas pernas.', N'Movimenta-se com prótese.', N'https://example.com/fotos/joaquim.jpg')
INSERT [dbo].[Idoso] ([IdIdoso], [IdResponsavel], [IdMobilidade], [IdNivelAutonomia], [Nome], [DataNascimento], [Sexo], [CuidadosMedicos], [DescricaoExtra], [FotoUrl]) VALUES (9, 8, 8, 8, N'Tereza Dias', CAST(N'1941-08-05' AS Date), N'Feminino', N'Pressão controlada com medicação.', N'Autônoma com bastão.', N'https://example.com/fotos/tereza.jpg')
INSERT [dbo].[Idoso] ([IdIdoso], [IdResponsavel], [IdMobilidade], [IdNivelAutonomia], [Nome], [DataNascimento], [Sexo], [CuidadosMedicos], [DescricaoExtra], [FotoUrl]) VALUES (10, 9, 9, 9, N'Manoel Lima', CAST(N'1946-02-14' AS Date), N'Masculino', N'Problemas auditivos leves.', N'Precisa de apoio para tarefas domésticas.', N'https://example.com/fotos/manoel.jpg')
INSERT [dbo].[Idoso] ([IdIdoso], [IdResponsavel], [IdMobilidade], [IdNivelAutonomia], [Nome], [DataNascimento], [Sexo], [CuidadosMedicos], [DescricaoExtra], [FotoUrl]) VALUES (11, 10, 10, 10, N'Laura Nogueira', CAST(N'1937-04-27' AS Date), N'Feminino', N'Boa saúde.', N'Completamente independente.', N'https://example.com/fotos/laura.jpg')
INSERT [dbo].[Idoso] ([IdIdoso], [IdResponsavel], [IdMobilidade], [IdNivelAutonomia], [Nome], [DataNascimento], [Sexo], [CuidadosMedicos], [DescricaoExtra], [FotoUrl]) VALUES (13, 10, 1, 11, N'ANA', CAST(N'1983-07-27' AS Date), N'Feminino', N'Nada', N'Nada', N'')
INSERT [dbo].[Idoso] ([IdIdoso], [IdResponsavel], [IdMobilidade], [IdNivelAutonomia], [Nome], [DataNascimento], [Sexo], [CuidadosMedicos], [DescricaoExtra], [FotoUrl]) VALUES (17, 6, 8, 9, N'Marcos0007', CAST(N'2025-05-22' AS Date), N'Masculino', N'\\sdf\sdf\sdf', N'\dsf\sdfdf\dsf', N'')
SET IDENTITY_INSERT [dbo].[Idoso] OFF
GO
SET IDENTITY_INSERT [dbo].[IdosoDoenca] ON 

INSERT [dbo].[IdosoDoenca] ([IdIdosoDoenca], [IdIdoso], [IdDoenca]) VALUES (5, 3, 3)
INSERT [dbo].[IdosoDoenca] ([IdIdosoDoenca], [IdIdoso], [IdDoenca]) VALUES (6, 4, 5)
INSERT [dbo].[IdosoDoenca] ([IdIdosoDoenca], [IdIdoso], [IdDoenca]) VALUES (7, 5, 6)
INSERT [dbo].[IdosoDoenca] ([IdIdosoDoenca], [IdIdoso], [IdDoenca]) VALUES (8, 6, 7)
INSERT [dbo].[IdosoDoenca] ([IdIdosoDoenca], [IdIdoso], [IdDoenca]) VALUES (9, 7, 8)
INSERT [dbo].[IdosoDoenca] ([IdIdosoDoenca], [IdIdoso], [IdDoenca]) VALUES (10, 8, 9)
INSERT [dbo].[IdosoDoenca] ([IdIdosoDoenca], [IdIdoso], [IdDoenca]) VALUES (11, 9, 10)
SET IDENTITY_INSERT [dbo].[IdosoDoenca] OFF
GO
SET IDENTITY_INSERT [dbo].[IdosoRestricaoAlimentar] ON 

INSERT [dbo].[IdosoRestricaoAlimentar] ([IdIdosoRestricaoAlimentar], [IdIdoso], [IdRestricaoAlimentar]) VALUES (5, 3, 5)
INSERT [dbo].[IdosoRestricaoAlimentar] ([IdIdosoRestricaoAlimentar], [IdIdoso], [IdRestricaoAlimentar]) VALUES (6, 4, 6)
INSERT [dbo].[IdosoRestricaoAlimentar] ([IdIdosoRestricaoAlimentar], [IdIdoso], [IdRestricaoAlimentar]) VALUES (7, 4, 10)
INSERT [dbo].[IdosoRestricaoAlimentar] ([IdIdosoRestricaoAlimentar], [IdIdoso], [IdRestricaoAlimentar]) VALUES (8, 5, 7)
INSERT [dbo].[IdosoRestricaoAlimentar] ([IdIdosoRestricaoAlimentar], [IdIdoso], [IdRestricaoAlimentar]) VALUES (9, 5, 9)
INSERT [dbo].[IdosoRestricaoAlimentar] ([IdIdosoRestricaoAlimentar], [IdIdoso], [IdRestricaoAlimentar]) VALUES (10, 3, 8)
SET IDENTITY_INSERT [dbo].[IdosoRestricaoAlimentar] OFF
GO
SET IDENTITY_INSERT [dbo].[Mobilidade] ON 

INSERT [dbo].[Mobilidade] ([IdMobilidade], [Descricao]) VALUES (1, N'Totalmente Imóvel: Paciente que não pode se mover de forma alguma, necessita de cuidados constantes.')
INSERT [dbo].[Mobilidade] ([IdMobilidade], [Descricao]) VALUES (2, N'Parcialmente Imóvel: Paciente com dificuldade de locomoção, mas que pode fazer alguns movimentos.')
INSERT [dbo].[Mobilidade] ([IdMobilidade], [Descricao]) VALUES (3, N'Ambulante com Cadeira de Rodas: Paciente que pode andar por curtas distâncias, mas usa cadeira de rodas para longas distâncias.')
INSERT [dbo].[Mobilidade] ([IdMobilidade], [Descricao]) VALUES (4, N'Ambulante com Auxílio: Paciente que consegue andar com o auxílio de bengala ou andador.')
INSERT [dbo].[Mobilidade] ([IdMobilidade], [Descricao]) VALUES (5, N'Independente: Paciente totalmente capaz de se locomover sozinho, sem qualquer assistência.')
INSERT [dbo].[Mobilidade] ([IdMobilidade], [Descricao]) VALUES (6, N'Com Mobilidade Limitada: Paciente com alguma limitação na mobilidade, mas que consegue andar com alguma dificuldade.')
INSERT [dbo].[Mobilidade] ([IdMobilidade], [Descricao]) VALUES (7, N'Usa Próteses: Paciente que utiliza próteses para caminhar ou realizar movimentos.')
INSERT [dbo].[Mobilidade] ([IdMobilidade], [Descricao]) VALUES (8, N'Ambulante com Bastão: Paciente que pode caminhar, mas usa bastão para dar apoio e equilíbrio.')
INSERT [dbo].[Mobilidade] ([IdMobilidade], [Descricao]) VALUES (9, N'Com Mobilidade Ajudada: Paciente que precisa de assistência para andar, seja com um acompanhante ou dispositivo.')
INSERT [dbo].[Mobilidade] ([IdMobilidade], [Descricao]) VALUES (10, N'Totalmente Independente: Paciente que é totalmente independente em suas atividades diárias e locomoção.')
SET IDENTITY_INSERT [dbo].[Mobilidade] OFF
GO
SET IDENTITY_INSERT [dbo].[NivelAutonomia] ON 

INSERT [dbo].[NivelAutonomia] ([IdNivelAutonomia], [Descricao]) VALUES (2, N'Totalmente Dependente: Paciente que não possui nenhuma capacidade de realizar atividades básicas de vida diária.')
INSERT [dbo].[NivelAutonomia] ([IdNivelAutonomia], [Descricao]) VALUES (3, N'Dependente Parcial: Paciente que precisa de ajuda em algumas atividades diárias, mas consegue realizar outras sozinho.')
INSERT [dbo].[NivelAutonomia] ([IdNivelAutonomia], [Descricao]) VALUES (4, N'Semi-Independente: Paciente que realiza a maioria das atividades sozinho, mas precisa de assistência em algumas tarefas.')
INSERT [dbo].[NivelAutonomia] ([IdNivelAutonomia], [Descricao]) VALUES (5, N'Independente com Assistência: Paciente que pode realizar atividades sozinho, mas precisa de ajuda em algumas situações específicas.')
INSERT [dbo].[NivelAutonomia] ([IdNivelAutonomia], [Descricao]) VALUES (6, N'Independente: Paciente que é totalmente capaz de realizar suas atividades diárias sem ajuda.')
INSERT [dbo].[NivelAutonomia] ([IdNivelAutonomia], [Descricao]) VALUES (7, N'Com Necessidade de Assistência Temporária: Paciente que necessita de assistência temporária devido a recuperação de uma doença ou cirurgia.')
INSERT [dbo].[NivelAutonomia] ([IdNivelAutonomia], [Descricao]) VALUES (8, N'Independente com Limitations: Paciente que realiza atividades sozinho, mas com alguma limitação física.')
INSERT [dbo].[NivelAutonomia] ([IdNivelAutonomia], [Descricao]) VALUES (9, N'Dependente para Atividades Complexas: Paciente que pode realizar tarefas simples, mas precisa de ajuda para atividades mais complexas.')
INSERT [dbo].[NivelAutonomia] ([IdNivelAutonomia], [Descricao]) VALUES (10, N'Totalmente Independente em Atividades Simples: Paciente que é totalmente independente nas atividades cotidianas simples, mas não em tarefas mais complexas.')
INSERT [dbo].[NivelAutonomia] ([IdNivelAutonomia], [Descricao]) VALUES (11, N'Com Auxílio Parcial: Paciente que precisa de apoio em algumas atividades, mas é capaz de se movimentar e realizar outras tarefas sem ajuda.')
SET IDENTITY_INSERT [dbo].[NivelAutonomia] OFF
GO
SET IDENTITY_INSERT [dbo].[RegistroProfissional] ON 

INSERT [dbo].[RegistroProfissional] ([IdRegistro], [IdCuidador], [RegistroCRM], [RegistroCREFITO], [RegistroCOREN], [RegistroCRP], [DataRegistro], [StatusRegistro]) VALUES (1, 1, N'CRM12345SP', NULL, NULL, NULL, CAST(N'2023-02-15' AS Date), N'Ativo')
INSERT [dbo].[RegistroProfissional] ([IdRegistro], [IdCuidador], [RegistroCRM], [RegistroCREFITO], [RegistroCOREN], [RegistroCRP], [DataRegistro], [StatusRegistro]) VALUES (2, 2, NULL, N'CREFITO67890', NULL, NULL, CAST(N'2022-08-22' AS Date), N'Inativo')
INSERT [dbo].[RegistroProfissional] ([IdRegistro], [IdCuidador], [RegistroCRM], [RegistroCREFITO], [RegistroCOREN], [RegistroCRP], [DataRegistro], [StatusRegistro]) VALUES (3, 3, NULL, NULL, N'COREN11223MG', NULL, CAST(N'2023-11-05' AS Date), N'Ativo')
INSERT [dbo].[RegistroProfissional] ([IdRegistro], [IdCuidador], [RegistroCRM], [RegistroCREFITO], [RegistroCOREN], [RegistroCRP], [DataRegistro], [StatusRegistro]) VALUES (4, 4, NULL, NULL, NULL, N'CRP554433RJ', CAST(N'2024-01-20' AS Date), N'Ativo')
INSERT [dbo].[RegistroProfissional] ([IdRegistro], [IdCuidador], [RegistroCRM], [RegistroCREFITO], [RegistroCOREN], [RegistroCRP], [DataRegistro], [StatusRegistro]) VALUES (5, 5, N'CRM99887RJ', NULL, NULL, NULL, CAST(N'2021-07-30' AS Date), N'Inativo')
INSERT [dbo].[RegistroProfissional] ([IdRegistro], [IdCuidador], [RegistroCRM], [RegistroCREFITO], [RegistroCOREN], [RegistroCRP], [DataRegistro], [StatusRegistro]) VALUES (6, 6, NULL, N'CREFITO55667SP', NULL, NULL, CAST(N'2023-03-10' AS Date), N'Ativo')
INSERT [dbo].[RegistroProfissional] ([IdRegistro], [IdCuidador], [RegistroCRM], [RegistroCREFITO], [RegistroCOREN], [RegistroCRP], [DataRegistro], [StatusRegistro]) VALUES (7, 7, NULL, NULL, N'COREN77889SP', NULL, CAST(N'2022-05-18' AS Date), N'Inativo')
INSERT [dbo].[RegistroProfissional] ([IdRegistro], [IdCuidador], [RegistroCRM], [RegistroCREFITO], [RegistroCOREN], [RegistroCRP], [DataRegistro], [StatusRegistro]) VALUES (8, 8, NULL, NULL, NULL, N'CRP119988BA', CAST(N'2023-09-01' AS Date), N'Ativo')
INSERT [dbo].[RegistroProfissional] ([IdRegistro], [IdCuidador], [RegistroCRM], [RegistroCREFITO], [RegistroCOREN], [RegistroCRP], [DataRegistro], [StatusRegistro]) VALUES (9, 9, NULL, NULL, N'COREN33445RS', NULL, CAST(N'2024-04-11' AS Date), N'Ativo')
INSERT [dbo].[RegistroProfissional] ([IdRegistro], [IdCuidador], [RegistroCRM], [RegistroCREFITO], [RegistroCOREN], [RegistroCRP], [DataRegistro], [StatusRegistro]) VALUES (10, 10, N'CRM11223MG', NULL, NULL, NULL, CAST(N'2022-12-25' AS Date), N'Inativo')
SET IDENTITY_INSERT [dbo].[RegistroProfissional] OFF
GO
SET IDENTITY_INSERT [dbo].[Responsavel] ON 

INSERT [dbo].[Responsavel] ([IdResponsavel], [IdEndereco], [Cpf], [Nome], [Email], [Telefone], [DataNascimento], [FotoUrl]) VALUES (1, 1, N'123.456.789-00', N'Ana Paula Lima', N'ana.lima@email.com', N'(11) 98765-4321', CAST(N'1980-05-15' AS Date), N'https://exemplo.com/fotos/ana.jpg')
INSERT [dbo].[Responsavel] ([IdResponsavel], [IdEndereco], [Cpf], [Nome], [Email], [Telefone], [DataNascimento], [FotoUrl]) VALUES (2, 2, N'987.654.321-11', N'Carlos Eduardo Silva', N'carlos.silva@email.com', N'(21) 99887-6655', CAST(N'1975-03-22' AS Date), N'https://exemplo.com/fotos/carlos.jpg')
INSERT [dbo].[Responsavel] ([IdResponsavel], [IdEndereco], [Cpf], [Nome], [Email], [Telefone], [DataNascimento], [FotoUrl]) VALUES (3, 3, N'456.123.789-22', N'Beatriz Almeida', N'beatriz.almeida@email.com', N'(31) 98555-1122', CAST(N'1990-11-30' AS Date), N'https://exemplo.com/fotos/beatriz.jpg')
INSERT [dbo].[Responsavel] ([IdResponsavel], [IdEndereco], [Cpf], [Nome], [Email], [Telefone], [DataNascimento], [FotoUrl]) VALUES (4, 4, N'321.654.987-33', N'Ricardo Mendes', N'ricardo.mendes@email.com', N'(41) 99999-1234', CAST(N'1965-08-10' AS Date), N'https://exemplo.com/fotos/ricardo.jpg')
INSERT [dbo].[Responsavel] ([IdResponsavel], [IdEndereco], [Cpf], [Nome], [Email], [Telefone], [DataNascimento], [FotoUrl]) VALUES (5, 5, N'852.963.741-44', N'Fernanda Souza', N'fernanda.souza@email.com', N'(51) 98777-8888', CAST(N'1988-02-17' AS Date), N'https://exemplo.com/fotos/fernanda.jpg')
INSERT [dbo].[Responsavel] ([IdResponsavel], [IdEndereco], [Cpf], [Nome], [Email], [Telefone], [DataNascimento], [FotoUrl]) VALUES (6, 6, N'741.852.963-55', N'João Batista', N'joao.batista@email.com', N'(71) 99888-7766', CAST(N'1970-07-01' AS Date), N'https://exemplo.com/fotos/joao.jpg')
INSERT [dbo].[Responsavel] ([IdResponsavel], [IdEndereco], [Cpf], [Nome], [Email], [Telefone], [DataNascimento], [FotoUrl]) VALUES (7, 7, N'159.753.486-66', N'Mariana Castro', N'mariana.castro@email.com', N'(48) 98654-3322', CAST(N'1983-12-05' AS Date), N'https://exemplo.com/fotos/mariana.jpg')
INSERT [dbo].[Responsavel] ([IdResponsavel], [IdEndereco], [Cpf], [Nome], [Email], [Telefone], [DataNascimento], [FotoUrl]) VALUES (8, 8, N'357.159.486-77', N'Luiz Fernando', N'luiz.fernando@email.com', N'(85) 98444-5566', CAST(N'1978-09-19' AS Date), N'https://exemplo.com/fotos/luiz.jpg')
INSERT [dbo].[Responsavel] ([IdResponsavel], [IdEndereco], [Cpf], [Nome], [Email], [Telefone], [DataNascimento], [FotoUrl]) VALUES (9, 9, N'654.987.321-88', N'Patrícia Gomes', N'patricia.gomes@email.com', N'(61) 99900-1122', CAST(N'1995-04-23' AS Date), N'https://exemplo.com/fotos/patricia.jpg')
INSERT [dbo].[Responsavel] ([IdResponsavel], [IdEndereco], [Cpf], [Nome], [Email], [Telefone], [DataNascimento], [FotoUrl]) VALUES (10, 10, N'321.987.654-99', N'Roberto Freitas', N'roberto.freitas@email.com', N'(81) 98766-5544', CAST(N'1982-06-14' AS Date), N'https://exemplo.com/fotos/roberto.jpg')
SET IDENTITY_INSERT [dbo].[Responsavel] OFF
GO
SET IDENTITY_INSERT [dbo].[RestricaoAlimentar] ON 

INSERT [dbo].[RestricaoAlimentar] ([IdRestricaoAlimentar], [Nome]) VALUES (1, N'Sem Glúten')
INSERT [dbo].[RestricaoAlimentar] ([IdRestricaoAlimentar], [Nome]) VALUES (2, N'Sem Lactose')
INSERT [dbo].[RestricaoAlimentar] ([IdRestricaoAlimentar], [Nome]) VALUES (3, N'Baixo Sódio')
INSERT [dbo].[RestricaoAlimentar] ([IdRestricaoAlimentar], [Nome]) VALUES (4, N'Sem Açúcar')
INSERT [dbo].[RestricaoAlimentar] ([IdRestricaoAlimentar], [Nome]) VALUES (5, N'Vegetariano')
INSERT [dbo].[RestricaoAlimentar] ([IdRestricaoAlimentar], [Nome]) VALUES (6, N'Vegano')
INSERT [dbo].[RestricaoAlimentar] ([IdRestricaoAlimentar], [Nome]) VALUES (7, N'Hipoalergênico')
INSERT [dbo].[RestricaoAlimentar] ([IdRestricaoAlimentar], [Nome]) VALUES (8, N'Sem Oleaginosas')
INSERT [dbo].[RestricaoAlimentar] ([IdRestricaoAlimentar], [Nome]) VALUES (9, N'Dieta Pastosa')
INSERT [dbo].[RestricaoAlimentar] ([IdRestricaoAlimentar], [Nome]) VALUES (10, N'Restrição de Gorduras')
SET IDENTITY_INSERT [dbo].[RestricaoAlimentar] OFF
GO
SET IDENTITY_INSERT [dbo].[Servico] ON 

INSERT [dbo].[Servico] ([IdServico], [Nome], [Descricao]) VALUES (1, NULL, N'Acompanhamento Psicológico')
INSERT [dbo].[Servico] ([IdServico], [Nome], [Descricao]) VALUES (2, NULL, N'Cuidados com Higiene Pessoal')
INSERT [dbo].[Servico] ([IdServico], [Nome], [Descricao]) VALUES (3, NULL, N'Acompanhamento de Medicamentos')
INSERT [dbo].[Servico] ([IdServico], [Nome], [Descricao]) VALUES (4, NULL, N'Fisioterapia e Reabilitação')
INSERT [dbo].[Servico] ([IdServico], [Nome], [Descricao]) VALUES (5, NULL, N'Acompanhamento de Alimentação')
INSERT [dbo].[Servico] ([IdServico], [Nome], [Descricao]) VALUES (6, NULL, N'Cuidados com Mobilidade e Exercícios')
INSERT [dbo].[Servico] ([IdServico], [Nome], [Descricao]) VALUES (7, NULL, N'Suporte para Atividades de Vida Diária')
INSERT [dbo].[Servico] ([IdServico], [Nome], [Descricao]) VALUES (8, NULL, N'Acompanhamento Médico Geral')
INSERT [dbo].[Servico] ([IdServico], [Nome], [Descricao]) VALUES (9, NULL, N'Acompanhamento de Terapias Específicas')
INSERT [dbo].[Servico] ([IdServico], [Nome], [Descricao]) VALUES (10, NULL, N'Apoio e Acompanhamento Social')
SET IDENTITY_INSERT [dbo].[Servico] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Administ__E3237CF7AF5D97DA]    Script Date: 27/05/2025 19:02:27 ******/
ALTER TABLE [dbo].[Administrador] ADD UNIQUE NONCLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Administrador] ADD  DEFAULT (getdate()) FOR [UltimoAcesso]
GO
ALTER TABLE [dbo].[Atendimento] ADD  DEFAULT (getdate()) FOR [DataCriacao]
GO
ALTER TABLE [dbo].[Avaliacao] ADD  DEFAULT (getdate()) FOR [DataAvaliacao]
GO
ALTER TABLE [dbo].[Chat] ADD  DEFAULT (getdate()) FOR [DataCriacao]
GO
ALTER TABLE [dbo].[Cuidador] ADD  DEFAULT ('Não') FOR [Fumante]
GO
ALTER TABLE [dbo].[Cuidador] ADD  DEFAULT ('Não') FOR [TemFilhos]
GO
ALTER TABLE [dbo].[Cuidador] ADD  DEFAULT ('Não') FOR [PossuiCNH]
GO
ALTER TABLE [dbo].[Cuidador] ADD  DEFAULT ('Não') FOR [TemCarro]
GO
ALTER TABLE [dbo].[HistoricoAdministrador] ADD  DEFAULT (getdate()) FOR [DataOperacao]
GO
ALTER TABLE [dbo].[HistoricoAtendimento] ADD  DEFAULT (getdate()) FOR [DataRegistro]
GO
ALTER TABLE [dbo].[HistoricoCuidador] ADD  DEFAULT (getdate()) FOR [DataOperacao]
GO
ALTER TABLE [dbo].[HistoricoResponsavel] ADD  DEFAULT (getdate()) FOR [DataOperacao]
GO
ALTER TABLE [dbo].[Mensagem] ADD  DEFAULT (getdate()) FOR [DataEnvio]
GO
ALTER TABLE [dbo].[Pagamento] ADD  DEFAULT (getdate()) FOR [DataPagamento]
GO
ALTER TABLE [dbo].[Atendimento]  WITH CHECK ADD FOREIGN KEY([IdCuidador])
REFERENCES [dbo].[Cuidador] ([IdCuidador])
GO
ALTER TABLE [dbo].[Atendimento]  WITH CHECK ADD FOREIGN KEY([IdResponsavel])
REFERENCES [dbo].[Responsavel] ([IdResponsavel])
GO
ALTER TABLE [dbo].[Atendimento]  WITH CHECK ADD  CONSTRAINT [FK_Atendimento_Idoso] FOREIGN KEY([IdIdoso])
REFERENCES [dbo].[Idoso] ([IdIdoso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Atendimento] CHECK CONSTRAINT [FK_Atendimento_Idoso]
GO
ALTER TABLE [dbo].[Avaliacao]  WITH CHECK ADD FOREIGN KEY([IdAtendimento])
REFERENCES [dbo].[Atendimento] ([IdAtendimento])
GO
ALTER TABLE [dbo].[Avaliacao]  WITH CHECK ADD FOREIGN KEY([IdCuidador])
REFERENCES [dbo].[Cuidador] ([IdCuidador])
GO
ALTER TABLE [dbo].[Avaliacao]  WITH CHECK ADD FOREIGN KEY([IdResponsavel])
REFERENCES [dbo].[Responsavel] ([IdResponsavel])
GO
ALTER TABLE [dbo].[Certificado]  WITH CHECK ADD FOREIGN KEY([IdCuidador])
REFERENCES [dbo].[Cuidador] ([IdCuidador])
GO
ALTER TABLE [dbo].[Chat]  WITH CHECK ADD FOREIGN KEY([IdCuidador])
REFERENCES [dbo].[Cuidador] ([IdCuidador])
GO
ALTER TABLE [dbo].[Chat]  WITH CHECK ADD FOREIGN KEY([IdResponsavel])
REFERENCES [dbo].[Responsavel] ([IdResponsavel])
GO
ALTER TABLE [dbo].[Cuidador]  WITH CHECK ADD FOREIGN KEY([IdEndereco])
REFERENCES [dbo].[Endereco] ([IdEndereco])
GO
ALTER TABLE [dbo].[CuidadorEspecialidade]  WITH CHECK ADD FOREIGN KEY([IdCuidador])
REFERENCES [dbo].[Cuidador] ([IdCuidador])
GO
ALTER TABLE [dbo].[CuidadorEspecialidade]  WITH CHECK ADD FOREIGN KEY([IdEspecialidade])
REFERENCES [dbo].[Especialidade] ([IdEspecialidade])
GO
ALTER TABLE [dbo].[CuidadorServico]  WITH CHECK ADD FOREIGN KEY([IdCuidador])
REFERENCES [dbo].[Cuidador] ([IdCuidador])
GO
ALTER TABLE [dbo].[CuidadorServico]  WITH CHECK ADD FOREIGN KEY([IdServico])
REFERENCES [dbo].[Servico] ([IdServico])
GO
ALTER TABLE [dbo].[Disponibilidade]  WITH CHECK ADD FOREIGN KEY([IdCuidador])
REFERENCES [dbo].[Cuidador] ([IdCuidador])
GO
ALTER TABLE [dbo].[Experiencia]  WITH CHECK ADD FOREIGN KEY([IdCuidador])
REFERENCES [dbo].[Cuidador] ([IdCuidador])
GO
ALTER TABLE [dbo].[Formacao]  WITH CHECK ADD FOREIGN KEY([IdCuidador])
REFERENCES [dbo].[Cuidador] ([IdCuidador])
GO
ALTER TABLE [dbo].[HistoricoAdministrador]  WITH CHECK ADD FOREIGN KEY([IdAdministrador])
REFERENCES [dbo].[Administrador] ([IdAdministrador])
GO
ALTER TABLE [dbo].[HistoricoAtendimento]  WITH CHECK ADD  CONSTRAINT [FK_HistoricoAtendimento_Atendimento] FOREIGN KEY([IdAtendimento])
REFERENCES [dbo].[Atendimento] ([IdAtendimento])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HistoricoAtendimento] CHECK CONSTRAINT [FK_HistoricoAtendimento_Atendimento]
GO
ALTER TABLE [dbo].[HistoricoCuidador]  WITH CHECK ADD FOREIGN KEY([IdCuidador])
REFERENCES [dbo].[Cuidador] ([IdCuidador])
GO
ALTER TABLE [dbo].[HistoricoResponsavel]  WITH CHECK ADD FOREIGN KEY([IdResponsavel])
REFERENCES [dbo].[Responsavel] ([IdResponsavel])
GO
ALTER TABLE [dbo].[Idoso]  WITH CHECK ADD FOREIGN KEY([IdMobilidade])
REFERENCES [dbo].[Mobilidade] ([IdMobilidade])
GO
ALTER TABLE [dbo].[Idoso]  WITH CHECK ADD FOREIGN KEY([IdNivelAutonomia])
REFERENCES [dbo].[NivelAutonomia] ([IdNivelAutonomia])
GO
ALTER TABLE [dbo].[Idoso]  WITH CHECK ADD FOREIGN KEY([IdResponsavel])
REFERENCES [dbo].[Responsavel] ([IdResponsavel])
GO
ALTER TABLE [dbo].[IdosoDoenca]  WITH CHECK ADD FOREIGN KEY([IdDoenca])
REFERENCES [dbo].[Doenca] ([IdDoenca])
GO
ALTER TABLE [dbo].[IdosoDoenca]  WITH CHECK ADD  CONSTRAINT [FK_IdosoDoenca_Idoso] FOREIGN KEY([IdIdoso])
REFERENCES [dbo].[Idoso] ([IdIdoso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdosoDoenca] CHECK CONSTRAINT [FK_IdosoDoenca_Idoso]
GO
ALTER TABLE [dbo].[IdosoRestricaoAlimentar]  WITH CHECK ADD FOREIGN KEY([IdRestricaoAlimentar])
REFERENCES [dbo].[RestricaoAlimentar] ([IdRestricaoAlimentar])
GO
ALTER TABLE [dbo].[IdosoRestricaoAlimentar]  WITH CHECK ADD  CONSTRAINT [FK_IdosoRestricaoAlimentar_Idoso] FOREIGN KEY([IdIdoso])
REFERENCES [dbo].[Idoso] ([IdIdoso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdosoRestricaoAlimentar] CHECK CONSTRAINT [FK_IdosoRestricaoAlimentar_Idoso]
GO
ALTER TABLE [dbo].[Mensagem]  WITH CHECK ADD FOREIGN KEY([IdChat])
REFERENCES [dbo].[Chat] ([IdChat])
GO
ALTER TABLE [dbo].[Pagamento]  WITH CHECK ADD FOREIGN KEY([IdAtendimento])
REFERENCES [dbo].[Atendimento] ([IdAtendimento])
GO
ALTER TABLE [dbo].[RegistroProfissional]  WITH CHECK ADD  CONSTRAINT [FK_Cuidador] FOREIGN KEY([IdCuidador])
REFERENCES [dbo].[Cuidador] ([IdCuidador])
GO
ALTER TABLE [dbo].[RegistroProfissional] CHECK CONSTRAINT [FK_Cuidador]
GO
ALTER TABLE [dbo].[Responsavel]  WITH CHECK ADD FOREIGN KEY([IdEndereco])
REFERENCES [dbo].[Endereco] ([IdEndereco])
GO
ALTER TABLE [dbo].[Administrador]  WITH CHECK ADD CHECK  (([Tipo]='Gestor de Historico' OR [Tipo]='Gestor de Usuarios' OR [Tipo]='Suporte help-desk' OR [Tipo]='Gestor Financeiro' OR [Tipo]='Admistrador'))
GO
ALTER TABLE [dbo].[Cuidador]  WITH CHECK ADD CHECK  (([Fumante]='Não' OR [Fumante]='Sim'))
GO
ALTER TABLE [dbo].[Cuidador]  WITH CHECK ADD CHECK  (([PossuiCNH]='Não' OR [PossuiCNH]='Sim'))
GO
ALTER TABLE [dbo].[Cuidador]  WITH CHECK ADD CHECK  (([TemCarro]='Não' OR [TemCarro]='Sim'))
GO
ALTER TABLE [dbo].[Cuidador]  WITH CHECK ADD CHECK  (([TemFilhos]='Não' OR [TemFilhos]='Sim'))
GO
ALTER TABLE [dbo].[RegistroProfissional]  WITH CHECK ADD CHECK  (([StatusRegistro]='Inativo' OR [StatusRegistro]='Ativo'))
GO
/****** Object:  StoredProcedure [dbo].[AtualizarIdoso]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[AtualizarIdoso](
    @IdIdoso INT,
    @IdResponsavel INT,
    @IdMobilidade INT,
    @IdNivelAutonomia INT,
    @Nome VARCHAR(100),
    @DataNascimento DATE,
    @Sexo VARCHAR(10),
    @CuidadosMedicos TEXT,
    @DescricaoExtra TEXT,
    @FotoUrl VARCHAR(255)
	)
AS
BEGIN
    UPDATE Idoso
    SET IdResponsavel = @IdResponsavel,
        IdMobilidade = @IdMobilidade,
        IdNivelAutonomia = @IdNivelAutonomia,
        Nome = @Nome,
        DataNascimento = @DataNascimento,
        Sexo = @Sexo,
        CuidadosMedicos = @CuidadosMedicos,
        DescricaoExtra = @DescricaoExtra,
        FotoUrl = @FotoUrl
    WHERE IdIdoso = @IdIdoso;
END;
GO
/****** Object:  StoredProcedure [dbo].[ExcluirIdoso]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ExcluirIdoso]
    @IdIdoso INT
AS
BEGIN
    DELETE FROM Idoso WHERE IdIdoso = @IdIdoso;
END;
GO
/****** Object:  StoredProcedure [dbo].[InserirIdoso]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[InserirIdoso](
    @IdResponsavel INT,
    @IdMobilidade INT,
    @IdNivelAutonomia INT,
    @Nome VARCHAR(100),
    @DataNascimento DATE,
    @Sexo VARCHAR(10),
    @CuidadosMedicos TEXT,
    @DescricaoExtra TEXT,
    @FotoUrl VARCHAR(255)
	)
AS
BEGIN
    INSERT INTO Idoso (IdResponsavel, IdMobilidade, IdNivelAutonomia, Nome, DataNascimento, Sexo, CuidadosMedicos, DescricaoExtra, FotoUrl)
    VALUES (@IdResponsavel, @IdMobilidade, @IdNivelAutonomia, @Nome, @DataNascimento, @Sexo, @CuidadosMedicos, @DescricaoExtra, @FotoUrl);
END;
GO
/****** Object:  StoredProcedure [dbo].[ListarIdosos]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ListarIdosos]
AS
BEGIN
    SELECT * FROM Idoso;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_AtualizarIdoso]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_AtualizarIdoso]
    @IdIdoso INT,
    @IdResponsavel INT,
    @IdMobilidade INT,
    @IdNivelAutonomia INT,
    @Nome NVARCHAR(100),
    @DataNascimento DATE,
    @Sexo NVARCHAR(10),
    @CuidadosMedicos NVARCHAR(MAX),
    @DescricaoExtra NVARCHAR(MAX),
    @FotoUrl NVARCHAR(MAX),
    @IdAdministrador INT
AS
BEGIN
    -- Atualizar o idoso
    UPDATE Idoso
    SET 
        IdResponsavel = @IdResponsavel,
        IdMobilidade = @IdMobilidade,
        IdNivelAutonomia = @IdNivelAutonomia,
        Nome = @Nome,
        DataNascimento = @DataNascimento,
        Sexo = @Sexo,
        CuidadosMedicos = @CuidadosMedicos,
        DescricaoExtra = @DescricaoExtra,
        FotoUrl = @FotoUrl
    WHERE IdIdoso = @IdIdoso;

    -- Inserir no histórico do administrador
    INSERT INTO HistoricoAdministrador (IdAdministrador, Operacao, DataOperacao)
    VALUES (
        @IdAdministrador,
        CONCAT('Idoso ', @Nome, ' (ID ', @IdIdoso, ') alterado.'),
        GETDATE()
    );
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_CriarIdoso]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Inserir novo idoso
CREATE   PROCEDURE [dbo].[sp_CriarIdoso]
    @IdResponsavel INT,
    @IdMobilidade INT,
    @IdNivelAutonomia INT,
    @Nome NVARCHAR(100),
    @DataNascimento DATE,
    @Sexo NVARCHAR(10),
    @CuidadosMedicos NVARCHAR(MAX),
    @DescricaoExtra NVARCHAR(MAX),
    @FotoUrl NVARCHAR(MAX),
    @IdAdministrador INT
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. Inserir o idoso
    INSERT INTO Idoso (IdResponsavel, IdMobilidade, IdNivelAutonomia, Nome, DataNascimento, Sexo, CuidadosMedicos, DescricaoExtra, FotoUrl)
    VALUES (@IdResponsavel, @IdMobilidade, @IdNivelAutonomia, @Nome, @DataNascimento, @Sexo, @CuidadosMedicos, @DescricaoExtra, @FotoUrl);

    -- 2. Recuperar o ID gerado
    DECLARE @NovoIdIdoso INT = SCOPE_IDENTITY();

    -- 3. Inserir no histórico do administrador
    INSERT INTO HistoricoAdministrador (IdAdministrador, Operacao, DataOperacao)
    VALUES (@IdAdministrador, CONCAT('Idoso ', @Nome, ' (ID ', @NovoIdIdoso, ') criado.'), GETDATE());
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ExcluirIdoso]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Excluir idoso
CREATE PROCEDURE [dbo].[sp_ExcluirIdoso]
    @IdIdoso INT
AS
BEGIN
    DELETE FROM Idoso WHERE IdIdoso = @IdIdoso;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarHistoricoAtendimentos]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_ListarHistoricoAtendimentos]
AS
BEGIN
    SELECT
        HA.IdHistorico,
        HA.idAtendimento,
        I.Nome AS NomeIdoso,          -- Nome do Idoso
        HA.DataRegistro,              -- Data de registro do histórico      
        C.Nome AS NomeProfissional,   -- Nome do Profissional
        HA.StatusFinal,
        HA.Observacoes
    FROM
        HistoricoAtendimento AS HA
    INNER JOIN
        Atendimento AS A ON HA.IdAtendimento = A.IdAtendimento
    INNER JOIN
        Idoso AS I ON A.IdIdoso = I.IdIdoso
    INNER JOIN
      Cuidador AS C ON A.IdCuidador = C.IdCuidador
    ORDER BY
        HA.DataRegistro DESC; -- Ordena do mais recente para o mais antigo
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarIdosos]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_ListarIdosos]
AS
BEGIN
    SELECT * FROM Idoso;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarMobilidade]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_ListarMobilidade]
AS
BEGIN
    SELECT *FROM Mobilidade
    ORDER BY Descricao;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarNivelAutonomia]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_ListarNivelAutonomia]
AS
BEGIN
    SELECT *FROM NivelAutonomia
    ORDER BY Descricao;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarResponsavel]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_ListarResponsavel]
AS
BEGIN
    SELECT *FROM Responsavel
    ORDER BY nome;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_Login_Administrador]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_Login_Administrador]
    @Usuario VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @IdAdministrador INT;

    -- Recupera o IdAdministrador com base no usuário
    SELECT TOP 1
        @IdAdministrador = IdAdministrador
    FROM Administrador
    WHERE Usuario = @Usuario;

    IF @IdAdministrador IS NOT NULL
    BEGIN
        -- Atualiza o campo UltimoAcesso
        UPDATE Administrador
        SET UltimoAcesso = GETDATE()
        WHERE IdAdministrador = @IdAdministrador;

        -- Insere histórico da operação de login
        INSERT INTO HistoricoAdministrador (IdAdministrador, Operacao)
        VALUES (@IdAdministrador, 'Login');
    END;

    -- Retorna os dados do administrador
    SELECT TOP 1
        IdAdministrador,
        Usuario,
        Senha,
        Tipo,
        UltimoAcesso
    FROM Administrador
    WHERE Usuario = @Usuario;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_Logout_Administrador]    Script Date: 27/05/2025 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_Logout_Administrador]
    @IdAdministrador INT
AS
BEGIN
    -- Insere um registro no histórico
    INSERT INTO HistoricoAdministrador (IdAdministrador, Operacao, DataOperacao)
    VALUES (@IdAdministrador, 'Logout', GETDATE());
END;
GO
USE [master]
GO
ALTER DATABASE [Cogitare] SET  READ_WRITE 
GO
