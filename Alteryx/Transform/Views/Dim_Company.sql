
CREATE view [Transform].[Dim_Company]
(
	  [CompanyName]
	 ,[CompanyShortName]
	 ,[CreatedDateUtc]
)
as
	SELECT distinct 
		 [CompanyName]			= cast([company name] as [nvarchar](250))
		,[CompanyShortName]		= cast([short name]  as [nvarchar](250))
		,[CreatedDateUtc]		= GETUTCDATE()
	FROM 
		[Staging].[companies] as datNw
	where
		not exists
		(
			select null 
			from 
				[dbo].[Dim_Company] as defInd
			where
				datNw.[company name] = defInd.[CompanyName]
				and datNw.[short name] = defInd.[CompanyShortName]
		)