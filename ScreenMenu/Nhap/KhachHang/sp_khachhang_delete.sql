﻿-- ================================================
-- Create Procedure sp_nhacungcap_delete.sql
-- Nhà cung cấp delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_khachhang_delete
GO
CREATE PROCEDURE sp_khachhang_delete
	-- Add the parameters for the stored procedure here
	@maKH char(11) = '', 
	@tenKH nvarchar(30) = N'',
	@sdtKH int = 0,
	@diemTL int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM KHACHHANG WHERE MAKH = @maKH
END
GO