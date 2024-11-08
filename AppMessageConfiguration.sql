USE IntegrationHub
GO

/*************************************************************
AppMessage
*************************************************************/
declare @ID varchar(50)
declare @OrgUnitID varchar(50)
declare @MessageName varchar(30)
declare @CompanyCode char(3)
declare @CountryCode char(3)
declare @Source char(10)
declare @MessageType varchar(20)
declare @StoreCode char(10)
declare @Version char(10)
declare @Handling varchar(15)
declare @RouterTransformation varchar(200)
declare @HandlerTransformation varchar(200)
declare @PCIServicing char(10)
declare @RouterProvider varchar(200)
declare @HandlerProvider varchar(200)
declare @EBOTarget varchar(200)
declare @Priority int
declare @ProcessingStartWindow datetime
declare @ProcessingEndWindow datetime
declare @RetryInterval int
declare @RetryThreashold int
declare @PCIConfiguredActionIn varchar(100)
declare @PCIConfiguredActionOut varchar(100)
declare @FullLogging char(1)
declare @CreatedByID varchar(50)
declare @ModifiedByID varchar(50)
declare @TrackPurgedMessages char(1)
declare @DelayProcessingWhenFutureDated char(1)
declare @DisableBatchProcessing char(1)
declare @AuthorizeByADGroup varchar(128)
declare @ValidateCheckOnly bit
declare @TLInstanceName varchar (12)

/*************************************************************/
select @ID = 'E50942E4-D0D6-461D-A913-BC927D7F83C7'
select @OrgUnitID = '3F0992D0-F760-11DC-A98C-001C23349415' 
select @MessageName = 'CreditCardPayout'
select @CompanyCode = 'DRP'
select @CountryCode = 'US'
select @Source = 'AltaCart'
select @MessageType = 'RequestResponse'
select @StoreCode = 'DRP'
select @Version = '1.0'
select @Handling = 'Immediate'
select @RouterTransformation = NULL
select @HandlerTransformation = NULL
select @PCIServicing = 'NONE'
select @RouterProvider = 'AR.IntegrationHub.Routers.MessageHandler.MessageHandlerProvider, AR.IntegrationHub.Routers.MessageHandler'
select @HandlerProvider = 'PCITrans'
select @EBOTarget = 'AltaResources.PaymentProcessing.CreditCard.Transactions.Payout, AltaResources.PaymentProcessing.CreditCard.Transactions'
select @Priority = NULL
select @ProcessingStartWindow = NULL
select @ProcessingEndWindow = NULL
select @RetryInterval = '0'
select @RetryThreashold = '0'
select @PCIConfiguredActionIn = NULL
select @PCIConfiguredActionOut = NULL
select @FullLogging = 'N'
select @CreatedByID = 'DRP-SetupScript'
select @ModifiedByID = 'DRP-SetupScript'
select @TrackPurgedMessages = 'Y'
select @DelayProcessingWhenFutureDated = NULL
select @DisableBatchProcessing= 'N'
select @AuthorizeByADGroup = NULL
select @ValidateCheckOnly = NULL
select @TLInstanceName = 'AltaGlobalTL'

select ID from AppMessageConfiguration where ID = @ID
if(@@RowCount=0) begin
INSERT INTO [dbo].[AppMessageConfiguration]
           ([ID]
           ,[OrgUnitID]
           ,[MessageName]
           ,[CompanyCode]
           ,[CountryCode]
           ,[Source]
           ,[MessageType]
           ,[StoreCode]
           ,[Version]
           ,[Handling]
           ,[RouterTransformation]
           ,[HandlerTransformation]
           ,[PCIServicing]
           ,[RouterProvider]
           ,[HandlerProvider]
           ,[EBOTarget]
           ,[Priority]
           ,[ProcessingStartWindow]
           ,[ProcessingEndWindow]
           ,[RetryInterval]
           ,[RetryThreashold]
           ,[PCIConfiguredActionIn]
           ,[PCIConfiguredActionOut]
           ,[FullLogging]
           ,[DateCreated]
           ,[CreatedByID]
           ,[DateModified]
           ,[ModifiedByID]
           ,[TrackPurgedMessages]
		   ,DelayProcessingWhenFutureDated
           ,DisableBatchProcessing
           ,AuthorizeByADGroup
		   ,ValidateCheckOnly
		   ,TLInstanceName)
     VALUES
           (@ID
           ,@OrgUnitID
           ,@MessageName
           ,@CompanyCode
           ,@CountryCode
           ,@Source
           ,@MessageType
           ,@StoreCode
           ,@Version
           ,@Handling
           ,@RouterTransformation
           ,@HandlerTransformation
           ,@PCIServicing
           ,@RouterProvider
           ,@HandlerProvider
           ,@EBOTarget
           ,@Priority
           ,@ProcessingStartWindow
           ,@ProcessingEndWindow
           ,@RetryInterval
           ,@RetryThreashold
           ,@PCIConfiguredActionIn
           ,@PCIConfiguredActionOut
           ,@FullLogging
           ,getdate()
           ,@CreatedByID
           ,getdate()
           ,@ModifiedByID
           ,@TrackPurgedMessages 
		   ,@DelayProcessingWhenFutureDated
           ,@DisableBatchProcessing
           ,@AuthorizeByADGroup
		   ,@ValidateCheckOnly
		   ,@TLInstanceName)

end

else begin

	UPDATE [dbo].[AppMessageConfiguration]
	   SET [OrgUnitID] = @OrgUnitID
		  ,[MessageName] = @MessageName
		  ,[CompanyCode] = @CompanyCode
		  ,[CountryCode] = @CountryCode
		  ,[Source] = @Source
		  ,[MessageType] = @MessageType
		  ,[StoreCode] = @StoreCode
		  ,[Version] = @Version
		  ,[Handling] = @Handling
		  ,[RouterTransformation] = @RouterTransformation
		  ,[HandlerTransformation] = @HandlerTransformation
		  ,[PCIServicing] = @PCIServicing
		  ,[RouterProvider] = @RouterProvider
		  ,[HandlerProvider] = @HandlerProvider
		  ,[EBOTarget] = @EBOTarget
		  ,[Priority] = @Priority
		  ,[ProcessingStartWindow] = @ProcessingStartWindow
		  ,[ProcessingEndWindow] = @ProcessingEndWindow
		  ,[RetryInterval] = @RetryInterval
		  ,[RetryThreashold] = @RetryThreashold
		  ,[PCIConfiguredActionIn] = @PCIConfiguredActionIn
		  ,[PCIConfiguredActionOut] = @PCIConfiguredActionOut
		  ,[FullLogging] = @FullLogging
		  ,[DateModified] = getdate()
		  ,[ModifiedByID] = @ModifiedByID
		  ,[TrackPurgedMessages] = @TrackPurgedMessages
		  ,DelayProcessingWhenFutureDated = @DelayProcessingWhenFutureDated
          ,DisableBatchProcessing = @DisableBatchProcessing
          ,AuthorizeByADGroup = @AuthorizeByADGroup
		  ,ValidateCheckOnly = @ValidateCheckOnly
		  ,TLInstanceName = @TLInstanceName
	 WHERE ID = @ID

end


/*************************************************************/

select @ID = '55D7FCDB-6438-472F-A485-740F35557FA2'
select @Source = 'OMS'


select ID from AppMessageConfiguration where ID = @ID
if(@@RowCount=0) begin
INSERT INTO [dbo].[AppMessageConfiguration]
           ([ID]
           ,[OrgUnitID]
           ,[MessageName]
           ,[CompanyCode]
           ,[CountryCode]
           ,[Source]
           ,[MessageType]
           ,[StoreCode]
           ,[Version]
           ,[Handling]
           ,[RouterTransformation]
           ,[HandlerTransformation]
           ,[PCIServicing]
           ,[RouterProvider]
           ,[HandlerProvider]
           ,[EBOTarget]
           ,[Priority]
           ,[ProcessingStartWindow]
           ,[ProcessingEndWindow]
           ,[RetryInterval]
           ,[RetryThreashold]
           ,[PCIConfiguredActionIn]
           ,[PCIConfiguredActionOut]
           ,[FullLogging]
           ,[DateCreated]
           ,[CreatedByID]
           ,[DateModified]
           ,[ModifiedByID]
           ,[TrackPurgedMessages]
		   ,DelayProcessingWhenFutureDated
           ,DisableBatchProcessing
           ,AuthorizeByADGroup
		   ,ValidateCheckOnly
		   ,TLInstanceName)
     VALUES
           (@ID
           ,@OrgUnitID
           ,@MessageName
           ,@CompanyCode
           ,@CountryCode
           ,@Source
           ,@MessageType
           ,@StoreCode
           ,@Version
           ,@Handling
           ,@RouterTransformation
           ,@HandlerTransformation
           ,@PCIServicing
           ,@RouterProvider
           ,@HandlerProvider
           ,@EBOTarget
           ,@Priority
           ,@ProcessingStartWindow
           ,@ProcessingEndWindow
           ,@RetryInterval
           ,@RetryThreashold
           ,@PCIConfiguredActionIn
           ,@PCIConfiguredActionOut
           ,@FullLogging
           ,getdate()
           ,@CreatedByID
           ,getdate()
           ,@ModifiedByID
           ,@TrackPurgedMessages 
		   ,@DelayProcessingWhenFutureDated
           ,@DisableBatchProcessing
           ,@AuthorizeByADGroup
		   ,@ValidateCheckOnly
		   ,@TLInstanceName)

end

else begin

	UPDATE [dbo].[AppMessageConfiguration]
	   SET [OrgUnitID] = @OrgUnitID
		  ,[MessageName] = @MessageName
		  ,[CompanyCode] = @CompanyCode
		  ,[CountryCode] = @CountryCode
		  ,[Source] = @Source
		  ,[MessageType] = @MessageType
		  ,[StoreCode] = @StoreCode
		  ,[Version] = @Version
		  ,[Handling] = @Handling
		  ,[RouterTransformation] = @RouterTransformation
		  ,[HandlerTransformation] = @HandlerTransformation
		  ,[PCIServicing] = @PCIServicing
		  ,[RouterProvider] = @RouterProvider
		  ,[HandlerProvider] = @HandlerProvider
		  ,[EBOTarget] = @EBOTarget
		  ,[Priority] = @Priority
		  ,[ProcessingStartWindow] = @ProcessingStartWindow
		  ,[ProcessingEndWindow] = @ProcessingEndWindow
		  ,[RetryInterval] = @RetryInterval
		  ,[RetryThreashold] = @RetryThreashold
		  ,[PCIConfiguredActionIn] = @PCIConfiguredActionIn
		  ,[PCIConfiguredActionOut] = @PCIConfiguredActionOut
		  ,[FullLogging] = @FullLogging
		  ,[DateModified] = getdate()
		  ,[ModifiedByID] = @ModifiedByID
		  ,[TrackPurgedMessages] = @TrackPurgedMessages
		  ,DelayProcessingWhenFutureDated = @DelayProcessingWhenFutureDated
          ,DisableBatchProcessing = @DisableBatchProcessing
          ,AuthorizeByADGroup = @AuthorizeByADGroup
		  ,ValidateCheckOnly = @ValidateCheckOnly
		  ,TLInstanceName = @TLInstanceName
	 WHERE ID = @ID

end