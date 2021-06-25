CREATE view [Transform].[Map_Ticker]
(
	 [TickerId]		
	,[CompanyId]	
	,[SectorId]		
	,[IndustryId]	
	,[StartDateUtc]	
	,[EndDateUtc]	
)
as

	select 
		 [TickerId]				= defTck.TickerId
		,[CompanyId]			= defCmpy.CompanyId
		,[SectorId]				= defSct.SectorId
		,[IndustryId]			= defInd.IndustryId
		,[StartDateUtc]			= [ChangeDate]
		,[EndDateUtc]			= dateadd(ms,-3, lead([ChangeDate]) over (partition by defTck.TickerId order by [ChangeDate]))
	from 
		[Staging].[companies] as datNw
		cross apply
		(
			select
				[ChangeDate]	= cast(datNw.[name change effective date] as datetime)
		) as defCol
		inner join
		[dbo].[Dim_Ticker] as defTck
			on datNw.ticker = defTck.TickerCode
		inner join
		[dbo].[Dim_Company] as defCmpy
			on datNw.[short name] = defCmpy.CompanyShortName
			and datNw.[company name] = defCmpy.CompanyName
		inner join
		[dbo].[Dim_Sector] as defSct
			on datNw.sector = defSct.SectorDescription
		inner join
		[dbo].[Dim_Industry] as defInd
			on datNw.industry = defInd.IndustryDescription
	where
		not exists
		(
			select null 
			from 
				[dbo].[Map_Ticker] as defInd
			where
				defTck.TickerId = defInd.[TickerId]
				and defCmpy.CompanyId = defInd.CompanyId
				and defSct.[SectorId] = defInd.[SectorId]
				and defInd.[IndustryId] = defInd.[IndustryId]
				and defInd.[StartDateUtc] = defInd.[StartDateUtc]
		)