CREATE TABLE [dbo].[Dim_Ticker] (
    [TickerId]       SMALLINT     IDENTITY (1, 1) NOT NULL,
    [TickerCode]     VARCHAR (10) NOT NULL,
    [CreatedDateUtc] DATETIME     CONSTRAINT [DF_Dim_Ticker_CreatedDateUtc] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_Dim_Ticker] PRIMARY KEY CLUSTERED ([TickerId] ASC)
);

