CREATE TABLE [dbo].[Fact_Daily_Values] (
    [RowId]       BIGINT IDENTITY (1, 1) NOT NULL,
    [TickerMapId] INT    NOT NULL,
    [MarketDate]  DATE   NOT NULL,
    [OpenValue]   MONEY  NOT NULL,
    [CloseValue]  MONEY  NOT NULL,
    [HighValue]   MONEY  NOT NULL,
    [LowValue]    MONEY  NOT NULL,
    [Volume]      INT    NULL,
    CONSTRAINT [PK_Fact_Daily_Values] PRIMARY KEY CLUSTERED ([TickerMapId] ASC, [MarketDate] ASC),
    CONSTRAINT [FK_Fact_Daily_Values_Map_Ticker] FOREIGN KEY ([TickerMapId]) REFERENCES [dbo].[Map_Ticker] ([TickerMapId])
);



