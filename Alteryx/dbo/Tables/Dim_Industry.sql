CREATE TABLE [dbo].[Dim_Industry] (
    [IndustryId]          INT           IDENTITY (1, 1) NOT NULL,
    [IndustryDescription] NVARCHAR (50) NULL,
    [CreatedDateUtc]      DATETIME      CONSTRAINT [DF_Dim_Industry_CreatedDateUtc] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Dim_Industry] PRIMARY KEY CLUSTERED ([IndustryId] ASC)
);

