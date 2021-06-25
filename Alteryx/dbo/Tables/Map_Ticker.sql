CREATE TABLE [dbo].[Map_Ticker] (
    [TickerMapId]  INT      IDENTITY (1, 1) NOT NULL,
    [TickerId]     SMALLINT NOT NULL,
    [CompanyId]    INT      NOT NULL,
    [SectorId]     INT      NOT NULL,
    [IndustryId]   INT      NOT NULL,
    [StartDateUtc] DATETIME CONSTRAINT [DF_Map_Ticker_StartDateUtc] DEFAULT (getutcdate()) NOT NULL,
    [EndDateUtc]   DATETIME NULL,
    CONSTRAINT [PK_Map_Ticker] PRIMARY KEY CLUSTERED ([TickerMapId] ASC),
    CONSTRAINT [FK_Map_Ticker_Dim_Company] FOREIGN KEY ([CompanyId]) REFERENCES [dbo].[Dim_Company] ([CompanyId]),
    CONSTRAINT [FK_Map_Ticker_Dim_Industry] FOREIGN KEY ([IndustryId]) REFERENCES [dbo].[Dim_Industry] ([IndustryId]),
    CONSTRAINT [FK_Map_Ticker_Dim_Sector] FOREIGN KEY ([SectorId]) REFERENCES [dbo].[Dim_Sector] ([SectorId]),
    CONSTRAINT [FK_Map_Ticker_Dim_Ticker] FOREIGN KEY ([TickerId]) REFERENCES [dbo].[Dim_Ticker] ([TickerId])
);

