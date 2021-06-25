CREATE TABLE [dbo].[Dim_Company] (
    [CompanyId]        INT            IDENTITY (1, 1) NOT NULL,
    [CompanyName]      NVARCHAR (250) NOT NULL,
    [CompanyShortName] NVARCHAR (250) NULL,
    [CreatedDateUtc]   DATETIME       CONSTRAINT [DF_Dim_Company_CreatedDateUtc] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Dim_Company] PRIMARY KEY CLUSTERED ([CompanyId] ASC)
);

