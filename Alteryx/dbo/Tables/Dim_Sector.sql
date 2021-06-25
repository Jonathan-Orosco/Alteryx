CREATE TABLE [dbo].[Dim_Sector] (
    [SectorId]          INT           IDENTITY (1, 1) NOT NULL,
    [SectorDescription] NVARCHAR (50) NULL,
    [CreatedDateUtc]    DATETIME      CONSTRAINT [DF_Dim_Sector_CreatedDateUtc] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Dim_Sector] PRIMARY KEY CLUSTERED ([SectorId] ASC)
);

