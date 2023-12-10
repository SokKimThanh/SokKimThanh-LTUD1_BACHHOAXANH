﻿-- ================================================
-- Create Procedure sp_chitiethoadon_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Quy Ngo
-- Create date: <10/12/2023>

-- =============================================
drop procedure if exists sp_chitiethoadon_select_one
go
CREATE PROCEDURE sp_chitiethoadon_select_one
	-- Add the parameters for the stored procedure here
	@makm char(11) = '', 
	@hinhthuc nvarchar(50) = N'',
	@ghichu nvarchar(100) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from chitiethoadon where makm = @makm --like chính xác mã 100%
END
GO
