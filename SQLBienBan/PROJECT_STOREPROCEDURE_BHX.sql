﻿-- ================================================
-- Create Procedure sp_chitiethoadon_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_chitiethoadon_delete
GO
CREATE PROCEDURE sp_chitiethoadon_delete
	-- Add the parameters for the stored procedure here
	@makm char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM chitiethoadon WHERE MASP = @makm
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_insert
go
CREATE PROCEDURE sp_chitiethoadon_insert
	-- Add the parameters for the stored procedure here
	@mahd char(11) = '', 
    @masp char(11) = '',
	@sl int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO CHITIETHD VALUES (@mahd, @masp, @sl)
END
GO

﻿-- ================================================
-- Create Procedure sp_chitiethoadon_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_select_all
go
CREATE PROCEDURE sp_chitiethoadon_select_all
	-- Add the parameters for the stored procedure here
	@makm char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT hd.MAHD,sp.TENSP,ct.SLMUA,sp.DONGIA*ct.SLMUA as "Thành Tiền"
	from CHITIETHD ct, HOADON hd, SANPHAM sp
	where ct.MAHD = hd.MAHD and sp.MASP = ct.MASP;
END
GO
exec sp_chitiethoadon_select_all "HD01"
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
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
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_TongTien
go
CREATE PROCEDURE sp_chitiethoadon_TongTien
	-- Add the parameters for the stored procedure here
	@makm char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	Declare  @TT int = 0;
	select @TT += ct.SLMUA * sp.DONGIA
	from CHITIETHD ct,HOADON hd,SANPHAM sp
	where ct.MAHD = hd.MAHD and sp.MASP = ct.MASP

	Update HOADON
	set TONGTHANHTIEN = @TT
	where MAHD = @makm;
END
GO
exec sp_chitiethoadon_TongTien 'HD01'
select * 
from HOADON
where MAHD='HD01'
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_update
go
CREATE PROCEDURE sp_hinhthuckm_update
	-- Add the parameters for the stored procedure here
	@mahd char(11) = '', 
	@masp char(11) = '',
	@sl int
	as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update CHITIETHD set SLMUA = @sl where MAHD = @mahd and  MASP = @masp -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_chitiethoadon_delete
GO
CREATE PROCEDURE sp_chitiethoadon_delete
	-- Add the parameters for the stored procedure here
	@mahd char(11) ,
	@masp char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM CHITIETHD WHERE MASP = @masp and MAHD = @mahd
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_insert
go
CREATE PROCEDURE sp_chitiethoadon_insert
	-- Add the parameters for the stored procedure here
	@mahd char(11),
	@masp char(11),
	@sl int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO CHITIETHD VALUES (@mahd, @masp, @sl)
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_select_all
go
CREATE PROCEDURE sp_chitiethoadon_select_all
	-- Add the parameters for the stored procedure here
	 @MAHD CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT sp.TENSP,ct.SLMUA, ct.SLMUA * sp.DONGIA as "Thành tiền"
	from CHITIETHD ct,HOADON hd,SANPHAM sp 
	where ct.MAHD = hd.MAHD and ct.MASP=sp.MASP and ct.MAHD = @MAHD

END
GO
exec sp_chitiethoadon_select_all 'HD01'
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_update
go
CREATE PROCEDURE sp_chitiethoadon_update
	-- Add the parameters for the stored procedure here
	@mahd char(11) = '', 
	@masp char(11) = '', 
	@SLmua int
	as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update CHITIETHD set SLMUA = @SLmua where MAHD = @mahd and MASP = @masp -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_danhmuc_delete
GO
CREATE PROCEDURE sp_danhmuc_delete
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM LOAISP WHERE MALOAI = @MALOAI
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_insert
go
CREATE PROCEDURE sp_danhmuc_insert
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11) ,
	@TENLOAI NVARCHAR(30),
	@GHICHU NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO LOAISP VALUES (@MALOAI, @TENLOAI, @GHICHU)
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_select_all
go
CREATE PROCEDURE sp_danhmuc_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from LOAISP
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_select_one
go
CREATE PROCEDURE sp_danhmuc_select_one
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from LOAISP where MALOAI like @MALOAI --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_update
go
CREATE PROCEDURE sp_danhmuc_update
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11),
	@TENLOAI NVARCHAR(30),
	@GHICHU NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update LOAISP set TENLOAI = @TENLOAI, GHICHU = @GHICHU where MALOAI = @MALOAI -- chuẩn sql
END
GO
﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_diadiem_delete
GO
CREATE PROCEDURE sp_diadiem_delete
	-- Add the parameters for the stored procedure here
	@maCN char(4) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM CHINHANH WHERE MACN = @maCN
END
GO
﻿-- ================================================
-- Create Procedure sp_diadiem_insert.sql
-- Nhà cung cấp insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
set dateformat dmy
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_diadiem_insert
go
CREATE PROCEDURE sp_diadiem_insert
	-- Add the parameters for the stored procedure here
	@maCN char(4) = '',
	@tenCN nvarchar(30),
	@diaChi nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO CHINHANH VALUES (@maCN,@tenCN,@diaChi)
END
GO
exec sp_diadiem_insert 'CN05', N'Chi nhánh Đà Nẵng', N'Số 3 Nguyễn Văn Linh, Hải Châu, Đà Nẵng';

select * from CHINHANH

﻿set dateformat dmy
-- ================================================
-- Create Procedure sp_diadiem_select_all.sql
-- hoadon select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<dia diem select all>
-- =============================================
drop procedure if exists sp_diadiem_select_all
go
CREATE PROCEDURE sp_diadiem_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 

    -- Insert statements for procedure here
	SELECT * from CHINHANH
END
GO
exec sp_diadiem_select_all
﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_diaiem_update
go
CREATE PROCEDURE sp_diadiem_update
	-- Add the parameters for the stored procedure here
@maCN char(4) = '',
	@tenCN nvarchar(30),
	@diaChi nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update CHINHANH set TENCN = @tenCN, DIACHICN = @diaChi  where MACN = @maCN -- chuẩn sql
END
GO
--exec sp_diadiem_update 'CN05', N'Chi nhánh Bình Phước', N'Số 3 Nguyễn Văn Linh, Hải Châu, Đà Nẵng';
select * from CHINHANH﻿-- ================================================
-- Create Procedure sp_hinhthuckm_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_hinhthuckm_delete
GO
CREATE PROCEDURE sp_hinhthuckm_delete
	-- Add the parameters for the stored procedure here
	@makm char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM hinhthuckm WHERE MAHT = @makm
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_insert
go
CREATE PROCEDURE sp_hinhthuckm_insert
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
	INSERT INTO hinhthuckm VALUES (@makm, @hinhthuc, @ghichu)
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_select_all
go
CREATE PROCEDURE sp_hinhthuckm_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from hinhthuckm
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_select_one
go
CREATE PROCEDURE sp_hinhthuckm_select_one
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
	SELECT * from hinhthuckm where makm = @makm --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_update
go
CREATE PROCEDURE sp_hinhthuckm_update
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
	update hinhthuckm set TENHINHTHUC = @hinhthuc, ghichu = @ghichu  where MAHT = @makm -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_all.sql
-- Nhà cung cấp select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Nhà cung cấp select all>
-- =============================================
drop procedure if exists sp_cbb_khachhang_select_all
go
CREATE PROCEDURE sp_cbb_khachhang_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT kh.MAKH, kh.HOTENKH from KHACHHANG kh
END
GO
exec sp_cbb_khachhang_select_all






-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
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
drop procedure if exists sp_khachhang_update
go
CREATE PROCEDURE sp_khachhang_update
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

    -- Insert statements for procedure here
	update KHACHHANG set HOTENKH = @tenKH,SDTKH = @sdtKH, DIEMTL = @diemTL where MAKH = @maKH -- chuẩn sql
END
GO



-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
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
drop procedure if exists sp_nhacungcap_insert
go
CREATE PROCEDURE sp_khachhang_insert
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

    -- Insert statements for procedure here
	INSERT INTO KHACHHANG VALUES (@maKH, @tenKH, @sdtKH,@diemTL)
END
GO

-- ================================================
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
	@maKH char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM KHACHHANG WHERE MAKH = @maKH
END
GO

﻿set dateformat dmy
-- ================================================
-- Create Procedure sp_nhanvien_select_all.sql
-- nhan vien select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<nhan vien select all>
-- =============================================
drop procedure if exists sp_nhanvien_select_all
go
CREATE PROCEDURE sp_nhanvien_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 

    -- Insert statements for procedure here
	SELECT nv.MANV,nv.HOTENNV from NHANVIEN nv
END
GO
exec sp_nhanvien_select_all






-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
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
drop procedure if exists sp_hoadon_update
go
CREATE PROCEDURE sp_hoadon_update
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update HOADON set NGAYHOADON = @ngayHD, TONGTHANHTIEN = @tongTien, MANV = @maNV, MAKH =@maKH where MAHD = @maHD -- chuẩn sql
END
GO
--exec sp_hoadon_update'HD03','15/01/2022', 90000,'NV02', 'KH02'


-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
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
drop procedure if exists sp_hoadon_insert
go
CREATE PROCEDURE sp_hoadon_insert
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO HOADON VALUES (@maHD, @ngayHD, @tongTien,@maNV,@maKH)
END
GO
--exec sp_hoadon_insert 'HD03','15/01/2022', 90000,'NV02', 'KH02'

-- ================================================
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
DROP PROCEDURE IF EXISTS sp_hoadon_delete
GO
CREATE PROCEDURE sp_hoadon_delete
	-- Add the parameters for the stored procedure here
	@maHD char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM HOADON WHERE MAHD = @maHD
END
GO

﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_hoadon_delete
GO
CREATE PROCEDURE sp_hoadon_delete
	-- Add the parameters for the stored procedure here
	@maHD char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Delete statements for procedure here
	DELETE FROM HOADON WHERE MAHD = @maHD
	DELETE FROM CHITIETHD WHERE MAHD = @maHD
end
﻿-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
set dateformat dmy
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hoadon_insert
go
CREATE PROCEDURE sp_hoadon_insert
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO HOADON VALUES (@maHD, @ngayHD, @tongTien,@maNV,@maKH)
END
GO
exec sp_hoadon_insert 'HD03','15/01/2022', 90000,'NV02', 'KH02'

select * from NHANVIEN

﻿set dateformat dmy
-- ================================================
-- Create Procedure sp_hoadon_select_all.sql
-- hoadon select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Hóa đơn select all>
-- =============================================
drop procedure if exists sp_hoadon_select_all
go
CREATE PROCEDURE sp_hoadon_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 

    -- Insert statements for procedure here
	SELECT hd.MAHD, hd.NGAYHOADON, hd.TONGTHANHTIEN , nv.HOTENNV, kh.HOTENKH from HOADON hd, NHANVIEN nv, KHACHHANG kh
	where hd.MANV = nv.MANV and hd.MAKH = kh.MAKH
END
GO
exec sp_hoadon_select_all


﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_one.sql
-- Nhà cung cấp select one
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
drop procedure if exists sp_hoadon_select_one
go
CREATE PROCEDURE sp_hoadon_select_one
	-- Add the parameters for the stored procedure here
	@maHD char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT * from HOADON where MAHD  = @maHD --like chính xác mã 100%
END
GO
﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hoadon_update
go
CREATE PROCEDURE sp_hoadon_update
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update HOADON set NGAYHOADON = @ngayHD, TONGTHANHTIEN = @tongTien, MANV = @maNV, MAKH =@maKH where MAHD = @maHD -- chuẩn sql
END
GO
exec sp_hoadon_update'HD03','15/01/2022', 90000,'NV02', 'KH02'﻿-- ================================================
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
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM KHACHHANG WHERE MAKH = @maKH
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
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
drop procedure if exists sp_khachhang_insert
go
CREATE PROCEDURE sp_khachhang_insert
	-- Add the parameters for the stored procedure here
	@maKH char(11),
	@tenKH nvarchar(30),
	@sdtKH int = 0,
	@diemTL int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO KHACHHANG VALUES (@maKH, @tenKH, @sdtKH,@diemTL)
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_all.sql
-- Nhà cung cấp select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Nhà cung cấp select all>
-- =============================================
drop procedure if exists sp_khachhang_select_all
go
CREATE PROCEDURE sp_khachhang_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from KHACHHANG
END
GO
exec sp_khachhang_select_all



﻿-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
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
drop procedure if exists sp_khachhang_update
go
CREATE PROCEDURE sp_khachhang_update
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

    -- Insert statements for procedure here
	update KHACHHANG set HOTENKH = @tenKH,SDTKH = @sdtKH, DIEMTL = @diemTL where MAKH = @maKH -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_one.sql
-- Nhà cung cấp select one
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
drop procedure if exists sp_khachhang_select_one
go
CREATE PROCEDURE sp_khachhang_select_one
	-- Add the parameters for the stored procedure here
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT * from KHACHHANG where  MAKH = @maKH --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_cbo_hinhthuckm
go
CREATE PROCEDURE sp_cbo_hinhthuckm
	-- Add the parameters for the stored procedure here
	--@makm char(11) = '', 
	--@hinhthuc nvarchar(50) = N'',
	--@ghichu nvarchar(100) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MAKM from hinhthuckm-- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_khuyenmai_delete
GO
CREATE PROCEDURE sp_khuyenmai_delete
	-- Add the parameters for the stored procedure here
	@makm char(11) = '', 
	@ngaybd date,
	@ngaykt date,
	@masp char(11) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM khuyenmai WHERE makm = @makm
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_insert
go
CREATE PROCEDURE sp_khuyenmai_insert
	-- Add the parameters for the stored procedure here
	@makm char(11) = '', 
	@ngaybd date,
	@ngaykt date,
	@masp char(11) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO khuyenmai VALUES (@makm, @ngaybd, @ngaykt,@masp)
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_select_all
go
CREATE PROCEDURE sp_khuyenmai_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from KHUYENMAI , HINHTHUCKM
	where KHUYENMAI.MAHT = HINHTHUCKM.MAHT
END
GO
exec sp_khuyenmai_select_all
exec sp_sanpham_select_all
﻿-- ================================================
-- Create Procedure sp_khuyenmai_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_select_one
go
CREATE PROCEDURE sp_khuyenmai_select_one
	-- Add the parameters for the stored procedure here
	@MAKM CHAR(11) ,
	@NGAYBD DATE ,
	@NGAYKT DATE,
	@MAHT char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from khuyenmai where MAKM = @MAKM --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_update
go
CREATE PROCEDURE sp_khuyenmai_update
	-- Add the parameters for the stored procedure here
	@makm char(11) = '', 
	@ngaybd date,
	@ngaykt date,
	@masp char(11) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update khuyenmai set ngaybd = @ngaybd, ngaykt = @ngaykt, masp = @masp  where makm = @makm -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_delete.sql
-- Nhà cung cấp delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_nhacungcap_delete
GO
CREATE PROCEDURE sp_nhacungcap_delete
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM nhacungcap WHERE MANCC = @MANCC
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_nhacungcap_insert
go
CREATE PROCEDURE sp_nhacungcap_insert
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11),
	@TENNCC NVARCHAR(30) ,
	@DIACHINCC NVARCHAR(100),
	@SDTNCC INT   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO nhacungcap VALUES (@@MANCC, @TENNCC, @DIACHINCC,@SDTNCC)
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_all.sql
-- Nhà cung cấp select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Nhà cung cấp select all>
-- =============================================
drop procedure if exists sp_nhacungcap_select_all
go
CREATE PROCEDURE sp_nhacungcap_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from nhacungcap
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_one.sql
-- Nhà cung cấp select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_nhacungcap_select_one
go
CREATE PROCEDURE sp_nhacungcap_select_one
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from nhacungcap where MANCC like @MANCC --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_nhacungcap_update
go
CREATE PROCEDURE sp_nhacungcap_update
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11),
	@TENNCC NVARCHAR(30) ,
	@DIACHINCC NVARCHAR(100),
	@SDTNCC INT   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update nhacungcap set TENNCC = @TENNCC, DIACHINCC = @DIACHINCC,SDTNCC = @SDTNCC where MANCC = @MANCC -- chuẩn sql
END
GO
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023>
drop procedure if exists sp_cbo_phongban
go
CREATE PROCEDURE sp_cbo_phongban
	-- Add the parameters for the stored procedure here
	 
AS
BEGIN 
    -- Delete statements for procedure here
	Select MAPB, TENPHG FROM PHONGBAN
END;
go
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>

drop procedure if exists sp_nhanvien_delete
go
CREATE PROCEDURE sp_nhanvien_delete
	-- Add the parameters for the stored procedure here
	@manv char(11) 
AS
BEGIN 
    -- Delete statements for procedure here
	DELETE FROM nhanvien WHERE manv = @manv
END;
go 
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>
drop procedure if exists sp_nhanvien_insert
go
CREATE PROCEDURE sp_nhanvien_insert
	 
	-- Add the parameters for the stored procedure here
	@manv char(11),
	@hotennv nvarchar(30),
	@diachinv nvarchar(100),
	@luong float,
	@sdtnv int,
	@ngaysinh date,
	@mapb char(4),
	@gioitinh char(4)
AS
BEGIN 
    -- Insert statements for procedure here
	-- Đợi 50 milliseconds
	WAITFOR DELAY '00:00:00.050';
	INSERT INTO nhanvien(manv, hotennv, diachinv, luong, sdtnv, ngaysinh,mapb, gioitinh) 
	VALUES (@manv, @hotennv, @diachinv, @luong, @sdtnv, @ngaysinh,@mapb, @gioitinh);
END;
go
 

--exec sp_nhanvien_insert 'nv', 'hoang van dung', '222 dia chi ma', 3214232, 123123,'09-09-2000','pb01', 'nam'
--Select * from nhanvien order by created_date asc where gioitinh = 'nam';
 
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 10:57 CH>
drop procedure if exists sp_nhanvien_select_all
go
CREATE PROCEDURE sp_nhanvien_select_all
AS
BEGIN
    SELECT 
       
        NV.MANV AS NhanVienID,
        PB.MAPB AS PhongBanID,
        NV.HOTENNV AS 'Họ và tên',
        PB.TENPHG AS 'Tên phòng ban'
        
    FROM 
        NHANVIEN NV,
		PHONGBAN PB
    where NV.MAPB = PB.MAPB
	order by nv.created_date desc;
END;
go


-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 10:57 CH>

drop procedure if exists sp_nhanvien_thongke
go
CREATE PROCEDURE sp_nhanvien_thongke
	-- Add the parameters for the stored procedure here
	 
AS
BEGIN 
    -- Insert statements for procedure here
	SELECT cn.TENCN as 'Tên Chi Nhánh', pb.TENPHG as 'Phòng ban',  COUNT(nv.HOTENNV) as 'Số nhân viên'
	FROM nhanvien nv, PHONGBAN pb, CHINHANH cn 
	WHERE pb.MAPB = nv.MAPB AND cn.MACN = pb.MACN
	GROUP BY pb.TENPHG, cn.TENCN;

END;
go

-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 10:57 CH>

drop procedure if exists sp_nhanvien_danhsach_theophongban_chinhanh
go
CREATE PROCEDURE sp_nhanvien_danhsach_theophongban_chinhanh
	-- Add the parameters for the stored procedure here
	 
AS
BEGIN 
    -- Insert statements for procedure here
	SELECT  cn.TENCN as 'Tên Chi Nhánh', pb.TENPHG as 'Phòng ban',
	STUFF((SELECT ', ' + nv.HOTENNV FROM nhanvien nv WHERE pb.MAPB = nv.MAPB AND cn.MACN = pb.MACN FOR XML PATH('')), 1, 2, '') as 'Danh sách nhân viên'
	FROM PHONGBAN pb, CHINHANH cn 
	GROUP BY pb.TENPHG, cn.TENCN, pb.MAPB, cn.MACN, pb.MACN;
END;
go

﻿
-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>

drop procedure if exists sp_nhanvien_select_one
go
CREATE PROCEDURE sp_nhanvien_select_one
	-- Add the parameters for the stored procedure here
	@manv char(11)
	 
AS
BEGIN 
    -- Insert statements for procedure here
	SELECT * from nhanvien where MANV like @manv --like chính xác mã 100%
END;
go

﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>

drop procedure if exists sp_nhanvien_update
go
CREATE PROCEDURE sp_nhanvien_update
	-- Add the parameters for the stored procedure here
	@manv char(11),
	@hotennv nvarchar(30),
	@diachinv nvarchar(100),
	@luong float,
	@sdtnv int,
	@ngaysinh date,
	@mapb char(4),
	@gioitinh nvarchar(10)
AS
BEGIN 
    -- Insert statements for procedure here
	update nhanvien set hotennv = @hotennv, diachinv = @diachinv,luong=@luong,sdtnv=@sdtnv ,ngaysinh=@ngaysinh, mapb = @mapb, gioitinh = @gioitinh where manv = @manv-- chuẩn sql
END;
go
﻿-- ================================================
-- Create Procedure sp_PhongBan_select_all.sql
-- Nhân viên phongban all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vo tu
-- Create date: <10/11/2023>
-- Description:	<vo tu select all>
-- =============================================
drop procedure if exists sp_cbb_chinhanh_select
go
CREATE PROCEDURE sp_cbb_chinhanh_select
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from CHINHANH
END
GO
exec sp_cbb_chinhanh_select
﻿-- ================================================
-- Create Procedure sp_phongban_delete.sql
-- Nhân viên delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vo tu
-- Create date: <10/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_phongban_delete
GO
CREATE PROCEDURE sp_phongban_delete
	-- Add the parameters for the stored procedure here
	@maPB char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM PHONGBAN WHERE MAPB = @maPB
END
GO
﻿-- ================================================
-- Create Procedure sp_nhanvien_insert.sql
-- Nhân viên insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <10/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_phongban_insert
go
CREATE PROCEDURE sp_PhongBan_insert
	-- Add the parameters for the stored procedure here
	@maPB char(11),
	@tenPB nvarchar(30),
	@maCN nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO PHONGBAN VALUES (@maPB, @tenPB, @maCN)
END
GO
﻿-- ================================================
-- Create Procedure sp_PhongBan_select_all.sql
-- Nhân viên phongban all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vo tu
-- Create date: <10/11/2023>
-- Description:	<vo tu select all>
-- =============================================
drop procedure if exists sp_phongban_select_all
go
CREATE PROCEDURE sp_phongban_select_all
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT pb.MAPB, pb.TENPHG, cn.TENCN from PHONGBAN pb, CHINHANH cn
END
GO
exec sp_phongban_select_all
﻿-- ================================================
-- Create Procedure sp_nhanvien_update.sql
-- Nhân viên update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <10/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_phongban_update
go
CREATE PROCEDURE sp_phongban_update
	-- Add the parameters for the stored procedure here
		@maPB char(11),
	@tenPB nvarchar(30),
	@maCN nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update PHONGBAN set TENPHG = @tenPB, MACN = @maCN where MACN = @maCN -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_delete.sql
-- Sản phẩm delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_sanpham_delete
GO
CREATE PROCEDURE sp_sanpham_delete
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM sanpham WHERE MASP = @MASP
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_insert.sql
-- Sản phẩm insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_sanpham_insert
go
CREATE PROCEDURE sp_sanpham_insert
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11),
	@TENSP NVARCHAR(30) ,
	@DONVI NVARCHAR(30),
	@NSX DATE ,
	@HSD DATE ,
	@DONGIA INT ,
	@SLTONKHO INT, 
	@MALOAI CHAR(11), 
	@MANCC CHAR(11), 
	@MAKM char(11)
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO sanpham (MASP,TENSP,DONVI ,NSX  ,HSD  ,DONGIA  ,SLTONKHO , MALOAI , MANCC, MAKM ) 
	VALUES (@MASP,@TENSP,@DONVI ,@NSX  ,@HSD  ,@DONGIA  ,@SLTONKHO , @MALOAI , @MANCC, @MAKM )
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_select_all.SQL
-- Sản phẩm select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Sok Kim Thanh>
-- Create date: <07/11/2023>
-- Description:	<Sản phẩm select all>
-- =============================================
drop procedure if exists sp_sanpham_select_all
go
CREATE PROCEDURE sp_sanpham_select_all
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from sanpham
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_select_all.SQL
-- Sản phẩm select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Sok Kim Thanh>
-- Create date: <07/11/2023>
-- Description:	<Sản phẩm select all>
-- =============================================
drop procedure if exists sp_sanpham_select_all
go
CREATE PROCEDURE sp_sanpham_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from SanPham

	
	
END
GO
exec sp_sanpham_select_all
﻿-- ================================================
-- Create Procedure sp_sanpham_select_one.sql
-- Sản phẩm select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_sanpham_select_one
go
CREATE PROCEDURE sp_sanpham_select_one
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from sanpham where MASP like @MASP --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_update.sql
-- Sản phẩm update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_sanpham_update
go
CREATE PROCEDURE sp_sanpham_update
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11),
	@TENSP NVARCHAR(30) ,
	@DONVI NVARCHAR(30),
	@NSX DATE ,
	@HSD DATE ,
	@DONGIA INT ,
	@SLTONKHO INT, 
	@MALOAI CHAR(11), 
	@MANCC CHAR(11), 
	@MAKM char(11)
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update sanpham set TENSP = @TENSP, DONVI = @DONVI, NSX = @NSX,HSD = @HSD,DONGIA = @DONGIA,SLTONKHO = @SLTONKHO,MALOAI = @MALOAI,MANCC = @MANCC,MAKM = @MAKM where MASP = @MASP -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_chitiethoadon_delete
GO
CREATE PROCEDURE sp_chitiethoadon_delete
	-- Add the parameters for the stored procedure here
	@makm char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM chitiethoadon WHERE MASP = @makm
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_insert
go
CREATE PROCEDURE sp_chitiethoadon_insert
	-- Add the parameters for the stored procedure here
	@mahd char(11) = '', 
    @masp char(11) = '',
	@sl int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO CHITIETHD VALUES (@mahd, @masp, @sl)
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_select_all
go
CREATE PROCEDURE sp_chitiethoadon_select_all
	-- Add the parameters for the stored procedure here
	@makm char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT hd.MAHD,sp.TENSP,ct.SLMUA,sp.DONGIA*ct.SLMUA as "Thành Tiền"
	from CHITIETHD ct, HOADON hd, SANPHAM sp
	where ct.MAHD = hd.MAHD and sp.MASP = ct.MASP;
END
GO
exec sp_chitiethoadon_select_all "HD01"
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
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
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_TongTien
go
CREATE PROCEDURE sp_chitiethoadon_TongTien
	-- Add the parameters for the stored procedure here
	@makm char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	Declare  @TT int = 0;
	select @TT += ct.SLMUA * sp.DONGIA
	from CHITIETHD ct,HOADON hd,SANPHAM sp
	where ct.MAHD = hd.MAHD and sp.MASP = ct.MASP

	Update HOADON
	set TONGTHANHTIEN = @TT
	where MAHD = @makm;
END
GO
exec sp_chitiethoadon_TongTien 'HD01'
select * 
from HOADON
where MAHD='HD01'
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_update
go
CREATE PROCEDURE sp_hinhthuckm_update
	-- Add the parameters for the stored procedure here
	@mahd char(11) = '', 
	@masp char(11) = '',
	@sl int
	as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update CHITIETHD set SLMUA = @sl where MAHD = @mahd and  MASP = @masp -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_chitiethoadon_delete
GO
CREATE PROCEDURE sp_chitiethoadon_delete
	-- Add the parameters for the stored procedure here
	@mahd char(11) ,
	@masp char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM CHITIETHD WHERE MASP = @masp and MAHD = @mahd
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_insert
go
CREATE PROCEDURE sp_chitiethoadon_insert
	-- Add the parameters for the stored procedure here
	@mahd char(11),
	@masp char(11),
	@sl int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO CHITIETHD VALUES (@mahd, @masp, @sl)
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_select_all
go
CREATE PROCEDURE sp_chitiethoadon_select_all
	-- Add the parameters for the stored procedure here
	 @MAHD CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT sp.TENSP,ct.SLMUA, ct.SLMUA * sp.DONGIA as "Thành tiền"
	from CHITIETHD ct,HOADON hd,SANPHAM sp 
	where ct.MAHD = hd.MAHD and ct.MASP=sp.MASP and ct.MAHD = @MAHD

END
GO
exec sp_chitiethoadon_select_all 'HD01'
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_update
go
CREATE PROCEDURE sp_chitiethoadon_update
	-- Add the parameters for the stored procedure here
	@mahd char(11) = '', 
	@masp char(11) = '', 
	@SLmua int
	as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update CHITIETHD set SLMUA = @SLmua where MAHD = @mahd and MASP = @masp -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_danhmuc_delete
GO
CREATE PROCEDURE sp_danhmuc_delete
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM LOAISP WHERE MALOAI = @MALOAI
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_insert
go
CREATE PROCEDURE sp_danhmuc_insert
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11) ,
	@TENLOAI NVARCHAR(30),
	@GHICHU NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO LOAISP VALUES (@MALOAI, @TENLOAI, @GHICHU)
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_select_all
go
CREATE PROCEDURE sp_danhmuc_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from LOAISP
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_select_one
go
CREATE PROCEDURE sp_danhmuc_select_one
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from LOAISP where MALOAI like @MALOAI --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_update
go
CREATE PROCEDURE sp_danhmuc_update
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11),
	@TENLOAI NVARCHAR(30),
	@GHICHU NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update LOAISP set TENLOAI = @TENLOAI, GHICHU = @GHICHU where MALOAI = @MALOAI -- chuẩn sql
END
GO
﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_diadiem_delete
GO
CREATE PROCEDURE sp_diadiem_delete
	-- Add the parameters for the stored procedure here
	@maCN char(4) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM CHINHANH WHERE MACN = @maCN
END
GO
﻿-- ================================================
-- Create Procedure sp_diadiem_insert.sql
-- Nhà cung cấp insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
set dateformat dmy
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_diadiem_insert
go
CREATE PROCEDURE sp_diadiem_insert
	-- Add the parameters for the stored procedure here
	@maCN char(4) = '',
	@tenCN nvarchar(30),
	@diaChi nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO CHINHANH VALUES (@maCN,@tenCN,@diaChi)
END
GO
exec sp_diadiem_insert 'CN05', N'Chi nhánh Đà Nẵng', N'Số 3 Nguyễn Văn Linh, Hải Châu, Đà Nẵng';

select * from CHINHANH

﻿set dateformat dmy
-- ================================================
-- Create Procedure sp_diadiem_select_all.sql
-- hoadon select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<dia diem select all>
-- =============================================
drop procedure if exists sp_diadiem_select_all
go
CREATE PROCEDURE sp_diadiem_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 

    -- Insert statements for procedure here
	SELECT * from CHINHANH
END
GO
exec sp_diadiem_select_all
﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_diaiem_update
go
CREATE PROCEDURE sp_diadiem_update
	-- Add the parameters for the stored procedure here
@maCN char(4) = '',
	@tenCN nvarchar(30),
	@diaChi nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update CHINHANH set TENCN = @tenCN, DIACHICN = @diaChi  where MACN = @maCN -- chuẩn sql
END
GO
--exec sp_diadiem_update 'CN05', N'Chi nhánh Bình Phước', N'Số 3 Nguyễn Văn Linh, Hải Châu, Đà Nẵng';
select * from CHINHANH﻿-- ================================================
-- Create Procedure sp_hinhthuckm_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_hinhthuckm_delete
GO
CREATE PROCEDURE sp_hinhthuckm_delete
	-- Add the parameters for the stored procedure here
	@makm char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM hinhthuckm WHERE MAHT = @makm
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_insert
go
CREATE PROCEDURE sp_hinhthuckm_insert
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
	INSERT INTO hinhthuckm VALUES (@makm, @hinhthuc, @ghichu)
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_select_all
go
CREATE PROCEDURE sp_hinhthuckm_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from hinhthuckm
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_select_one
go
CREATE PROCEDURE sp_hinhthuckm_select_one
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
	SELECT * from hinhthuckm where makm = @makm --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_update
go
CREATE PROCEDURE sp_hinhthuckm_update
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
	update hinhthuckm set TENHINHTHUC = @hinhthuc, ghichu = @ghichu  where MAHT = @makm -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_all.sql
-- Nhà cung cấp select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Nhà cung cấp select all>
-- =============================================
drop procedure if exists sp_cbb_khachhang_select_all
go
CREATE PROCEDURE sp_cbb_khachhang_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT kh.MAKH, kh.HOTENKH from KHACHHANG kh
END
GO
exec sp_cbb_khachhang_select_all






-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
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
drop procedure if exists sp_khachhang_update
go
CREATE PROCEDURE sp_khachhang_update
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

    -- Insert statements for procedure here
	update KHACHHANG set HOTENKH = @tenKH,SDTKH = @sdtKH, DIEMTL = @diemTL where MAKH = @maKH -- chuẩn sql
END
GO



-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
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
drop procedure if exists sp_nhacungcap_insert
go
CREATE PROCEDURE sp_khachhang_insert
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

    -- Insert statements for procedure here
	INSERT INTO KHACHHANG VALUES (@maKH, @tenKH, @sdtKH,@diemTL)
END
GO

-- ================================================
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
	@maKH char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM KHACHHANG WHERE MAKH = @maKH
END
GO

﻿set dateformat dmy
-- ================================================
-- Create Procedure sp_nhanvien_select_all.sql
-- nhan vien select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<nhan vien select all>
-- =============================================
drop procedure if exists sp_nhanvien_select_all
go
CREATE PROCEDURE sp_nhanvien_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 

    -- Insert statements for procedure here
	SELECT nv.MANV,nv.HOTENNV from NHANVIEN nv
END
GO
exec sp_nhanvien_select_all






-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
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
drop procedure if exists sp_hoadon_update
go
CREATE PROCEDURE sp_hoadon_update
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update HOADON set NGAYHOADON = @ngayHD, TONGTHANHTIEN = @tongTien, MANV = @maNV, MAKH =@maKH where MAHD = @maHD -- chuẩn sql
END
GO
--exec sp_hoadon_update'HD03','15/01/2022', 90000,'NV02', 'KH02'


-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
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
drop procedure if exists sp_hoadon_insert
go
CREATE PROCEDURE sp_hoadon_insert
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO HOADON VALUES (@maHD, @ngayHD, @tongTien,@maNV,@maKH)
END
GO
--exec sp_hoadon_insert 'HD03','15/01/2022', 90000,'NV02', 'KH02'

-- ================================================
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
DROP PROCEDURE IF EXISTS sp_hoadon_delete
GO
CREATE PROCEDURE sp_hoadon_delete
	-- Add the parameters for the stored procedure here
	@maHD char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM HOADON WHERE MAHD = @maHD
END
GO

﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_hoadon_delete
GO
CREATE PROCEDURE sp_hoadon_delete
	-- Add the parameters for the stored procedure here
	@maHD char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Delete statements for procedure here
	DELETE FROM HOADON WHERE MAHD = @maHD
	DELETE FROM CHITIETHD WHERE MAHD = @maHD
end
﻿-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
set dateformat dmy
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hoadon_insert
go
CREATE PROCEDURE sp_hoadon_insert
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO HOADON VALUES (@maHD, @ngayHD, @tongTien,@maNV,@maKH)
END
GO
exec sp_hoadon_insert 'HD03','15/01/2022', 90000,'NV02', 'KH02'

select * from NHANVIEN

﻿set dateformat dmy
-- ================================================
-- Create Procedure sp_hoadon_select_all.sql
-- hoadon select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Hóa đơn select all>
-- =============================================
drop procedure if exists sp_hoadon_select_all
go
CREATE PROCEDURE sp_hoadon_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 

    -- Insert statements for procedure here
	SELECT hd.MAHD, hd.NGAYHOADON, hd.TONGTHANHTIEN , nv.HOTENNV, kh.HOTENKH from HOADON hd, NHANVIEN nv, KHACHHANG kh
	where hd.MANV = nv.MANV and hd.MAKH = kh.MAKH
END
GO
exec sp_hoadon_select_all


﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_one.sql
-- Nhà cung cấp select one
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
drop procedure if exists sp_hoadon_select_one
go
CREATE PROCEDURE sp_hoadon_select_one
	-- Add the parameters for the stored procedure here
	@maHD char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT * from HOADON where MAHD  = @maHD --like chính xác mã 100%
END
GO
﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hoadon_update
go
CREATE PROCEDURE sp_hoadon_update
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update HOADON set NGAYHOADON = @ngayHD, TONGTHANHTIEN = @tongTien, MANV = @maNV, MAKH =@maKH where MAHD = @maHD -- chuẩn sql
END
GO
exec sp_hoadon_update'HD03','15/01/2022', 90000,'NV02', 'KH02'﻿-- ================================================
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
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM KHACHHANG WHERE MAKH = @maKH
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
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
drop procedure if exists sp_khachhang_insert
go
CREATE PROCEDURE sp_khachhang_insert
	-- Add the parameters for the stored procedure here
	@maKH char(11),
	@tenKH nvarchar(30),
	@sdtKH int = 0,
	@diemTL int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO KHACHHANG VALUES (@maKH, @tenKH, @sdtKH,@diemTL)
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_all.sql
-- Nhà cung cấp select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Nhà cung cấp select all>
-- =============================================
drop procedure if exists sp_khachhang_select_all
go
CREATE PROCEDURE sp_khachhang_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from KHACHHANG
END
GO
exec sp_khachhang_select_all



﻿-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
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
drop procedure if exists sp_khachhang_update
go
CREATE PROCEDURE sp_khachhang_update
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

    -- Insert statements for procedure here
	update KHACHHANG set HOTENKH = @tenKH,SDTKH = @sdtKH, DIEMTL = @diemTL where MAKH = @maKH -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_one.sql
-- Nhà cung cấp select one
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
drop procedure if exists sp_khachhang_select_one
go
CREATE PROCEDURE sp_khachhang_select_one
	-- Add the parameters for the stored procedure here
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT * from KHACHHANG where  MAKH = @maKH --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_cbo_hinhthuckm
go
CREATE PROCEDURE sp_cbo_hinhthuckm
	-- Add the parameters for the stored procedure here
	--@makm char(11) = '', 
	--@hinhthuc nvarchar(50) = N'',
	--@ghichu nvarchar(100) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MAKM from hinhthuckm-- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_khuyenmai_delete
GO
CREATE PROCEDURE sp_khuyenmai_delete
	-- Add the parameters for the stored procedure here
	@makm char(11) = '', 
	@ngaybd date,
	@ngaykt date,
	@masp char(11) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM khuyenmai WHERE makm = @makm
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_insert
go
CREATE PROCEDURE sp_khuyenmai_insert
	-- Add the parameters for the stored procedure here
	@makm char(11) = '', 
	@ngaybd date,
	@ngaykt date,
	@masp char(11) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO khuyenmai VALUES (@makm, @ngaybd, @ngaykt,@masp)
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_select_all
go
CREATE PROCEDURE sp_khuyenmai_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from KHUYENMAI , HINHTHUCKM
	where KHUYENMAI.MAHT = HINHTHUCKM.MAHT
END
GO
exec sp_khuyenmai_select_all
exec sp_sanpham_select_all
﻿-- ================================================
-- Create Procedure sp_khuyenmai_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_select_one
go
CREATE PROCEDURE sp_khuyenmai_select_one
	-- Add the parameters for the stored procedure here
	@MAKM CHAR(11) ,
	@NGAYBD DATE ,
	@NGAYKT DATE,
	@MAHT char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from khuyenmai where MAKM = @MAKM --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_update
go
CREATE PROCEDURE sp_khuyenmai_update
	-- Add the parameters for the stored procedure here
	@makm char(11) = '', 
	@ngaybd date,
	@ngaykt date,
	@masp char(11) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update khuyenmai set ngaybd = @ngaybd, ngaykt = @ngaykt, masp = @masp  where makm = @makm -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_delete.sql
-- Nhà cung cấp delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_nhacungcap_delete
GO
CREATE PROCEDURE sp_nhacungcap_delete
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM nhacungcap WHERE MANCC = @MANCC
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_nhacungcap_insert
go
CREATE PROCEDURE sp_nhacungcap_insert
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11),
	@TENNCC NVARCHAR(30) ,
	@DIACHINCC NVARCHAR(100),
	@SDTNCC INT   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO nhacungcap VALUES (@@MANCC, @TENNCC, @DIACHINCC,@SDTNCC)
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_all.sql
-- Nhà cung cấp select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Nhà cung cấp select all>
-- =============================================
drop procedure if exists sp_nhacungcap_select_all
go
CREATE PROCEDURE sp_nhacungcap_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from nhacungcap
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_one.sql
-- Nhà cung cấp select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_nhacungcap_select_one
go
CREATE PROCEDURE sp_nhacungcap_select_one
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from nhacungcap where MANCC like @MANCC --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_nhacungcap_update
go
CREATE PROCEDURE sp_nhacungcap_update
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11),
	@TENNCC NVARCHAR(30) ,
	@DIACHINCC NVARCHAR(100),
	@SDTNCC INT   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update nhacungcap set TENNCC = @TENNCC, DIACHINCC = @DIACHINCC,SDTNCC = @SDTNCC where MANCC = @MANCC -- chuẩn sql
END
GO
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023>
drop procedure if exists sp_cbo_phongban
go
CREATE PROCEDURE sp_cbo_phongban
	-- Add the parameters for the stored procedure here
	 
AS
BEGIN 
    -- Delete statements for procedure here
	Select MAPB, TENPHG FROM PHONGBAN
END;
go
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>

drop procedure if exists sp_nhanvien_delete
go
CREATE PROCEDURE sp_nhanvien_delete
	-- Add the parameters for the stored procedure here
	@manv char(11) 
AS
BEGIN 
    -- Delete statements for procedure here
	DELETE FROM nhanvien WHERE manv = @manv
END;
go 
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>
drop procedure if exists sp_nhanvien_insert
go
CREATE PROCEDURE sp_nhanvien_insert
	 
	-- Add the parameters for the stored procedure here
	@manv char(11),
	@hotennv nvarchar(30),
	@diachinv nvarchar(100),
	@luong float,
	@sdtnv int,
	@ngaysinh date,
	@mapb char(4),
	@gioitinh char(4)
AS
BEGIN 
    -- Insert statements for procedure here
	-- Đợi 50 milliseconds
	WAITFOR DELAY '00:00:00.050';
	INSERT INTO nhanvien(manv, hotennv, diachinv, luong, sdtnv, ngaysinh,mapb, gioitinh) 
	VALUES (@manv, @hotennv, @diachinv, @luong, @sdtnv, @ngaysinh,@mapb, @gioitinh);
END;
go
 

--exec sp_nhanvien_insert 'nv', 'hoang van dung', '222 dia chi ma', 3214232, 123123,'09-09-2000','pb01', 'nam'
--Select * from nhanvien order by created_date asc where gioitinh = 'nam';
 
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 10:57 CH>
drop procedure if exists sp_nhanvien_select_all
go
CREATE PROCEDURE sp_nhanvien_select_all
AS
BEGIN
    SELECT 
       
        NV.MANV AS NhanVienID,
        PB.MAPB AS PhongBanID,
        NV.HOTENNV AS 'Họ và tên',
        PB.TENPHG AS 'Tên phòng ban'
        
    FROM 
        NHANVIEN NV,
		PHONGBAN PB
    where NV.MAPB = PB.MAPB
	order by nv.created_date desc;
END;
go

 
﻿
-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>

drop procedure if exists sp_nhanvien_select_one
go
CREATE PROCEDURE sp_nhanvien_select_one
	-- Add the parameters for the stored procedure here
	@manv char(11)
	 
AS
BEGIN 
    -- Insert statements for procedure here
	SELECT * from nhanvien where MANV like @manv --like chính xác mã 100%
END;
go

﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>

drop procedure if exists sp_nhanvien_update
go
CREATE PROCEDURE sp_nhanvien_update
	-- Add the parameters for the stored procedure here
	@manv char(11),
	@hotennv nvarchar(30),
	@diachinv nvarchar(100),
	@luong float,
	@sdtnv int,
	@ngaysinh date,
	@mapb char(4),
	@gioitinh nvarchar(10)
AS
BEGIN 
    -- Insert statements for procedure here
	update nhanvien set hotennv = @hotennv, diachinv = @diachinv,luong=@luong,sdtnv=@sdtnv ,ngaysinh=@ngaysinh, mapb = @mapb, gioitinh = @gioitinh where manv = @manv-- chuẩn sql
END;
go
﻿-- ================================================
-- Create Procedure sp_PhongBan_select_all.sql
-- Nhân viên phongban all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vo tu
-- Create date: <10/11/2023>
-- Description:	<vo tu select all>
-- =============================================
drop procedure if exists sp_cbb_chinhanh_select
go
CREATE PROCEDURE sp_cbb_chinhanh_select
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from CHINHANH
END
GO
exec sp_cbb_chinhanh_select
﻿-- ================================================
-- Create Procedure sp_phongban_delete.sql
-- Nhân viên delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vo tu
-- Create date: <10/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_phongban_delete
GO
CREATE PROCEDURE sp_phongban_delete
	-- Add the parameters for the stored procedure here
	@maPB char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM PHONGBAN WHERE MAPB = @maPB
END
GO
﻿-- ================================================
-- Create Procedure sp_nhanvien_insert.sql
-- Nhân viên insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <10/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_phongban_insert
go
CREATE PROCEDURE sp_PhongBan_insert
	-- Add the parameters for the stored procedure here
	@maPB char(11),
	@tenPB nvarchar(30),
	@maCN nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO PHONGBAN VALUES (@maPB, @tenPB, @maCN)
END
GO
﻿-- ================================================
-- Create Procedure sp_PhongBan_select_all.sql
-- Nhân viên phongban all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vo tu
-- Create date: <10/11/2023>
-- Description:	<vo tu select all>
-- =============================================
drop procedure if exists sp_phongban_select_all
go
CREATE PROCEDURE sp_phongban_select_all
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT pb.MAPB, pb.TENPHG, cn.TENCN from PHONGBAN pb, CHINHANH cn
END
GO
exec sp_phongban_select_all
﻿-- ================================================
-- Create Procedure sp_nhanvien_update.sql
-- Nhân viên update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <10/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_phongban_update
go
CREATE PROCEDURE sp_phongban_update
	-- Add the parameters for the stored procedure here
		@maPB char(11),
	@tenPB nvarchar(30),
	@maCN nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update PHONGBAN set TENPHG = @tenPB, MACN = @maCN where MACN = @maCN -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_delete.sql
-- Sản phẩm delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_sanpham_delete
GO
CREATE PROCEDURE sp_sanpham_delete
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM sanpham WHERE MASP = @MASP
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_insert.sql
-- Sản phẩm insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_sanpham_insert
go
CREATE PROCEDURE sp_sanpham_insert
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11),
	@TENSP NVARCHAR(30) ,
	@DONVI NVARCHAR(30),
	@NSX DATE ,
	@HSD DATE ,
	@DONGIA INT ,
	@SLTONKHO INT, 
	@MALOAI CHAR(11), 
	@MANCC CHAR(11), 
	@MAKM char(11)
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO sanpham (MASP,TENSP,DONVI ,NSX  ,HSD  ,DONGIA  ,SLTONKHO , MALOAI , MANCC, MAKM ) 
	VALUES (@MASP,@TENSP,@DONVI ,@NSX  ,@HSD  ,@DONGIA  ,@SLTONKHO , @MALOAI , @MANCC, @MAKM )
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_select_all.SQL
-- Sản phẩm select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Sok Kim Thanh>
-- Create date: <07/11/2023>
-- Description:	<Sản phẩm select all>
-- =============================================
drop procedure if exists sp_sanpham_select_all
go
CREATE PROCEDURE sp_sanpham_select_all
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from sanpham
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_select_all.SQL
-- Sản phẩm select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Sok Kim Thanh>
-- Create date: <07/11/2023>
-- Description:	<Sản phẩm select all>
-- =============================================
drop procedure if exists sp_sanpham_select_all
go
CREATE PROCEDURE sp_sanpham_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from SanPham

	
	
END
GO
exec sp_sanpham_select_all
﻿-- ================================================
-- Create Procedure sp_sanpham_select_one.sql
-- Sản phẩm select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_sanpham_select_one
go
CREATE PROCEDURE sp_sanpham_select_one
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from sanpham where MASP like @MASP --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_update.sql
-- Sản phẩm update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_sanpham_update
go
CREATE PROCEDURE sp_sanpham_update
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11),
	@TENSP NVARCHAR(30) ,
	@DONVI NVARCHAR(30),
	@NSX DATE ,
	@HSD DATE ,
	@DONGIA INT ,
	@SLTONKHO INT, 
	@MALOAI CHAR(11), 
	@MANCC CHAR(11), 
	@MAKM char(11)
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update sanpham set TENSP = @TENSP, DONVI = @DONVI, NSX = @NSX,HSD = @HSD,DONGIA = @DONGIA,SLTONKHO = @SLTONKHO,MALOAI = @MALOAI,MANCC = @MANCC,MAKM = @MAKM where MASP = @MASP -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_chitiethoadon_delete
GO
CREATE PROCEDURE sp_chitiethoadon_delete
	-- Add the parameters for the stored procedure here
	@makm char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM chitiethoadon WHERE MASP = @makm
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_insert
go
CREATE PROCEDURE sp_chitiethoadon_insert
	-- Add the parameters for the stored procedure here
	@mahd char(11) = '', 
    @masp char(11) = '',
	@sl int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO CHITIETHD VALUES (@mahd, @masp, @sl)
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_select_all
go
CREATE PROCEDURE sp_chitiethoadon_select_all
	-- Add the parameters for the stored procedure here
	@makm char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT hd.MAHD,sp.TENSP,ct.SLMUA,sp.DONGIA*ct.SLMUA as "Thành Tiền"
	from CHITIETHD ct, HOADON hd, SANPHAM sp
	where ct.MAHD = hd.MAHD and sp.MASP = ct.MASP;
END
GO
exec sp_chitiethoadon_select_all "HD01"
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
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
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_TongTien
go
CREATE PROCEDURE sp_chitiethoadon_TongTien
	-- Add the parameters for the stored procedure here
	@makm char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	Declare  @TT int = 0;
	select @TT += ct.SLMUA * sp.DONGIA
	from CHITIETHD ct,HOADON hd,SANPHAM sp
	where ct.MAHD = hd.MAHD and sp.MASP = ct.MASP

	Update HOADON
	set TONGTHANHTIEN = @TT
	where MAHD = @makm;
END
GO
exec sp_chitiethoadon_TongTien 'HD01'
select * 
from HOADON
where MAHD='HD01'
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_update
go
CREATE PROCEDURE sp_hinhthuckm_update
	-- Add the parameters for the stored procedure here
	@mahd char(11) = '', 
	@masp char(11) = '',
	@sl int
	as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update CHITIETHD set SLMUA = @sl where MAHD = @mahd and  MASP = @masp -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_chitiethoadon_delete
GO
CREATE PROCEDURE sp_chitiethoadon_delete
	-- Add the parameters for the stored procedure here
	@mahd char(11) ,
	@masp char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM CHITIETHD WHERE MASP = @masp and MAHD = @mahd
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_insert
go
CREATE PROCEDURE sp_chitiethoadon_insert
	-- Add the parameters for the stored procedure here
	@mahd char(11),
	@masp char(11),
	@sl int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO CHITIETHD VALUES (@mahd, @masp, @sl)
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_select_all
go
CREATE PROCEDURE sp_chitiethoadon_select_all
	-- Add the parameters for the stored procedure here
	 @MAHD CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT sp.TENSP,ct.SLMUA, ct.SLMUA * sp.DONGIA as "Thành tiền"
	from CHITIETHD ct,HOADON hd,SANPHAM sp 
	where ct.MAHD = hd.MAHD and ct.MASP=sp.MASP and ct.MAHD = @MAHD

END
GO
exec sp_chitiethoadon_select_all 'HD01'
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_update
go
CREATE PROCEDURE sp_chitiethoadon_update
	-- Add the parameters for the stored procedure here
	@mahd char(11) = '', 
	@masp char(11) = '', 
	@SLmua int
	as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update CHITIETHD set SLMUA = @SLmua where MAHD = @mahd and MASP = @masp -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_danhmuc_delete
GO
CREATE PROCEDURE sp_danhmuc_delete
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM LOAISP WHERE MALOAI = @MALOAI
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_insert
go
CREATE PROCEDURE sp_danhmuc_insert
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11) ,
	@TENLOAI NVARCHAR(30),
	@GHICHU NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO LOAISP VALUES (@MALOAI, @TENLOAI, @GHICHU)
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_select_all
go
CREATE PROCEDURE sp_danhmuc_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from LOAISP
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_select_one
go
CREATE PROCEDURE sp_danhmuc_select_one
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from LOAISP where MALOAI like @MALOAI --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_update
go
CREATE PROCEDURE sp_danhmuc_update
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11),
	@TENLOAI NVARCHAR(30),
	@GHICHU NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update LOAISP set TENLOAI = @TENLOAI, GHICHU = @GHICHU where MALOAI = @MALOAI -- chuẩn sql
END
GO
﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_diadiem_delete
GO
CREATE PROCEDURE sp_diadiem_delete
	-- Add the parameters for the stored procedure here
	@maCN char(4) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM CHINHANH WHERE MACN = @maCN
END
GO
﻿-- ================================================
-- Create Procedure sp_diadiem_insert.sql
-- Nhà cung cấp insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
set dateformat dmy
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_diadiem_insert
go
CREATE PROCEDURE sp_diadiem_insert
	-- Add the parameters for the stored procedure here
	@maCN char(4) = '',
	@tenCN nvarchar(30),
	@diaChi nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO CHINHANH VALUES (@maCN,@tenCN,@diaChi)
END
GO
exec sp_diadiem_insert 'CN05', N'Chi nhánh Đà Nẵng', N'Số 3 Nguyễn Văn Linh, Hải Châu, Đà Nẵng';

select * from CHINHANH

﻿set dateformat dmy
-- ================================================
-- Create Procedure sp_diadiem_select_all.sql
-- hoadon select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<dia diem select all>
-- =============================================
drop procedure if exists sp_diadiem_select_all
go
CREATE PROCEDURE sp_diadiem_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 

    -- Insert statements for procedure here
	SELECT * from CHINHANH
END
GO
exec sp_diadiem_select_all
﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_diaiem_update
go
CREATE PROCEDURE sp_diadiem_update
	-- Add the parameters for the stored procedure here
@maCN char(4) = '',
	@tenCN nvarchar(30),
	@diaChi nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update CHINHANH set TENCN = @tenCN, DIACHICN = @diaChi  where MACN = @maCN -- chuẩn sql
END
GO
--exec sp_diadiem_update 'CN05', N'Chi nhánh Bình Phước', N'Số 3 Nguyễn Văn Linh, Hải Châu, Đà Nẵng';
select * from CHINHANH﻿-- ================================================
-- Create Procedure sp_hinhthuckm_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_hinhthuckm_delete
GO
CREATE PROCEDURE sp_hinhthuckm_delete
	-- Add the parameters for the stored procedure here
	@makm char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM hinhthuckm WHERE MAHT = @makm
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_insert
go
CREATE PROCEDURE sp_hinhthuckm_insert
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
	INSERT INTO hinhthuckm VALUES (@makm, @hinhthuc, @ghichu)
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_select_all
go
CREATE PROCEDURE sp_hinhthuckm_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from hinhthuckm
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_select_one
go
CREATE PROCEDURE sp_hinhthuckm_select_one
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
	SELECT * from hinhthuckm where makm = @makm --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_update
go
CREATE PROCEDURE sp_hinhthuckm_update
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
	update hinhthuckm set TENHINHTHUC = @hinhthuc, ghichu = @ghichu  where MAHT = @makm -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_all.sql
-- Nhà cung cấp select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Nhà cung cấp select all>
-- =============================================
drop procedure if exists sp_cbb_khachhang_select_all
go
CREATE PROCEDURE sp_cbb_khachhang_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT kh.MAKH, kh.HOTENKH from KHACHHANG kh
END
GO
exec sp_cbb_khachhang_select_all






-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
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
drop procedure if exists sp_khachhang_update
go
CREATE PROCEDURE sp_khachhang_update
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

    -- Insert statements for procedure here
	update KHACHHANG set HOTENKH = @tenKH,SDTKH = @sdtKH, DIEMTL = @diemTL where MAKH = @maKH -- chuẩn sql
END
GO



-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
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
drop procedure if exists sp_nhacungcap_insert
go
CREATE PROCEDURE sp_khachhang_insert
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

    -- Insert statements for procedure here
	INSERT INTO KHACHHANG VALUES (@maKH, @tenKH, @sdtKH,@diemTL)
END
GO

-- ================================================
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
	@maKH char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM KHACHHANG WHERE MAKH = @maKH
END
GO

﻿set dateformat dmy
-- ================================================
-- Create Procedure sp_nhanvien_select_all.sql
-- nhan vien select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<nhan vien select all>
-- =============================================
drop procedure if exists sp_nhanvien_select_all
go
CREATE PROCEDURE sp_nhanvien_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 

    -- Insert statements for procedure here
	SELECT nv.MANV,nv.HOTENNV from NHANVIEN nv
END
GO
exec sp_nhanvien_select_all






-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
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
drop procedure if exists sp_hoadon_update
go
CREATE PROCEDURE sp_hoadon_update
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update HOADON set NGAYHOADON = @ngayHD, TONGTHANHTIEN = @tongTien, MANV = @maNV, MAKH =@maKH where MAHD = @maHD -- chuẩn sql
END
GO
--exec sp_hoadon_update'HD03','15/01/2022', 90000,'NV02', 'KH02'


-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
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
drop procedure if exists sp_hoadon_insert
go
CREATE PROCEDURE sp_hoadon_insert
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO HOADON VALUES (@maHD, @ngayHD, @tongTien,@maNV,@maKH)
END
GO
--exec sp_hoadon_insert 'HD03','15/01/2022', 90000,'NV02', 'KH02'

-- ================================================
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
DROP PROCEDURE IF EXISTS sp_hoadon_delete
GO
CREATE PROCEDURE sp_hoadon_delete
	-- Add the parameters for the stored procedure here
	@maHD char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM HOADON WHERE MAHD = @maHD
END
GO

﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_hoadon_delete
GO
CREATE PROCEDURE sp_hoadon_delete
	-- Add the parameters for the stored procedure here
	@maHD char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Delete statements for procedure here
	DELETE FROM HOADON WHERE MAHD = @maHD
	DELETE FROM CHITIETHD WHERE MAHD = @maHD
end
﻿-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
set dateformat dmy
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hoadon_insert
go
CREATE PROCEDURE sp_hoadon_insert
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO HOADON VALUES (@maHD, @ngayHD, @tongTien,@maNV,@maKH)
END
GO
exec sp_hoadon_insert 'HD03','15/01/2022', 90000,'NV02', 'KH02'

select * from NHANVIEN

﻿set dateformat dmy
-- ================================================
-- Create Procedure sp_hoadon_select_all.sql
-- hoadon select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Hóa đơn select all>
-- =============================================
drop procedure if exists sp_hoadon_select_all
go
CREATE PROCEDURE sp_hoadon_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 

    -- Insert statements for procedure here
	SELECT hd.MAHD, hd.NGAYHOADON, hd.TONGTHANHTIEN , nv.HOTENNV, kh.HOTENKH from HOADON hd, NHANVIEN nv, KHACHHANG kh
	where hd.MANV = nv.MANV and hd.MAKH = kh.MAKH
END
GO
exec sp_hoadon_select_all


﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_one.sql
-- Nhà cung cấp select one
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
drop procedure if exists sp_hoadon_select_one
go
CREATE PROCEDURE sp_hoadon_select_one
	-- Add the parameters for the stored procedure here
	@maHD char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT * from HOADON where MAHD  = @maHD --like chính xác mã 100%
END
GO
﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hoadon_update
go
CREATE PROCEDURE sp_hoadon_update
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update HOADON set NGAYHOADON = @ngayHD, TONGTHANHTIEN = @tongTien, MANV = @maNV, MAKH =@maKH where MAHD = @maHD -- chuẩn sql
END
GO
exec sp_hoadon_update'HD03','15/01/2022', 90000,'NV02', 'KH02'﻿-- ================================================
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
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM KHACHHANG WHERE MAKH = @maKH
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
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
drop procedure if exists sp_khachhang_insert
go
CREATE PROCEDURE sp_khachhang_insert
	-- Add the parameters for the stored procedure here
	@maKH char(11),
	@tenKH nvarchar(30),
	@sdtKH int = 0,
	@diemTL int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO KHACHHANG VALUES (@maKH, @tenKH, @sdtKH,@diemTL)
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_all.sql
-- Nhà cung cấp select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Nhà cung cấp select all>
-- =============================================
drop procedure if exists sp_khachhang_select_all
go
CREATE PROCEDURE sp_khachhang_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from KHACHHANG
END
GO
exec sp_khachhang_select_all



﻿-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
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
drop procedure if exists sp_khachhang_update
go
CREATE PROCEDURE sp_khachhang_update
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

    -- Insert statements for procedure here
	update KHACHHANG set HOTENKH = @tenKH,SDTKH = @sdtKH, DIEMTL = @diemTL where MAKH = @maKH -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_one.sql
-- Nhà cung cấp select one
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
drop procedure if exists sp_khachhang_select_one
go
CREATE PROCEDURE sp_khachhang_select_one
	-- Add the parameters for the stored procedure here
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT * from KHACHHANG where  MAKH = @maKH --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_cbo_hinhthuckm
go
CREATE PROCEDURE sp_cbo_hinhthuckm
	-- Add the parameters for the stored procedure here
	--@makm char(11) = '', 
	--@hinhthuc nvarchar(50) = N'',
	--@ghichu nvarchar(100) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MAKM from hinhthuckm-- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_khuyenmai_delete
GO
CREATE PROCEDURE sp_khuyenmai_delete
	-- Add the parameters for the stored procedure here
	@makm char(11) = '', 
	@ngaybd date,
	@ngaykt date,
	@masp char(11) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM khuyenmai WHERE makm = @makm
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_insert
go
CREATE PROCEDURE sp_khuyenmai_insert
	-- Add the parameters for the stored procedure here
	@makm char(11) = '', 
	@ngaybd date,
	@ngaykt date,
	@masp char(11) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO khuyenmai VALUES (@makm, @ngaybd, @ngaykt,@masp)
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_select_all
go
CREATE PROCEDURE sp_khuyenmai_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from KHUYENMAI , HINHTHUCKM
	where KHUYENMAI.MAHT = HINHTHUCKM.MAHT
END
GO
exec sp_khuyenmai_select_all
exec sp_sanpham_select_all
﻿-- ================================================
-- Create Procedure sp_khuyenmai_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_select_one
go
CREATE PROCEDURE sp_khuyenmai_select_one
	-- Add the parameters for the stored procedure here
	@MAKM CHAR(11) ,
	@NGAYBD DATE ,
	@NGAYKT DATE,
	@MAHT char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from khuyenmai where MAKM = @MAKM --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_update
go
CREATE PROCEDURE sp_khuyenmai_update
	-- Add the parameters for the stored procedure here
	@makm char(11) = '', 
	@ngaybd date,
	@ngaykt date,
	@masp char(11) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update khuyenmai set ngaybd = @ngaybd, ngaykt = @ngaykt, masp = @masp  where makm = @makm -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_delete.sql
-- Nhà cung cấp delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_nhacungcap_delete
GO
CREATE PROCEDURE sp_nhacungcap_delete
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM nhacungcap WHERE MANCC = @MANCC
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_nhacungcap_insert
go
CREATE PROCEDURE sp_nhacungcap_insert
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11),
	@TENNCC NVARCHAR(30) ,
	@DIACHINCC NVARCHAR(100),
	@SDTNCC INT   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO nhacungcap VALUES (@@MANCC, @TENNCC, @DIACHINCC,@SDTNCC)
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_all.sql
-- Nhà cung cấp select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Nhà cung cấp select all>
-- =============================================
drop procedure if exists sp_nhacungcap_select_all
go
CREATE PROCEDURE sp_nhacungcap_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from nhacungcap
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_one.sql
-- Nhà cung cấp select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_nhacungcap_select_one
go
CREATE PROCEDURE sp_nhacungcap_select_one
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from nhacungcap where MANCC like @MANCC --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_nhacungcap_update
go
CREATE PROCEDURE sp_nhacungcap_update
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11),
	@TENNCC NVARCHAR(30) ,
	@DIACHINCC NVARCHAR(100),
	@SDTNCC INT   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update nhacungcap set TENNCC = @TENNCC, DIACHINCC = @DIACHINCC,SDTNCC = @SDTNCC where MANCC = @MANCC -- chuẩn sql
END
GO
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023>
drop procedure if exists sp_cbo_phongban
go
CREATE PROCEDURE sp_cbo_phongban
	-- Add the parameters for the stored procedure here
	 
AS
BEGIN 
    -- Delete statements for procedure here
	Select MAPB, TENPHG FROM PHONGBAN
END;
go
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>

drop procedure if exists sp_nhanvien_delete
go
CREATE PROCEDURE sp_nhanvien_delete
	-- Add the parameters for the stored procedure here
	@manv char(11) 
AS
BEGIN 
    -- Delete statements for procedure here
	DELETE FROM nhanvien WHERE manv = @manv
END;
go 
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>
drop procedure if exists sp_nhanvien_insert
go
CREATE PROCEDURE sp_nhanvien_insert
	 
	-- Add the parameters for the stored procedure here
	@manv char(11),
	@hotennv nvarchar(30),
	@diachinv nvarchar(100),
	@luong float,
	@sdtnv int,
	@ngaysinh date,
	@mapb char(4),
	@gioitinh char(4)
AS
BEGIN 
    -- Insert statements for procedure here
	-- Đợi 50 milliseconds
	WAITFOR DELAY '00:00:00.050';
	INSERT INTO nhanvien(manv, hotennv, diachinv, luong, sdtnv, ngaysinh,mapb, gioitinh) 
	VALUES (@manv, @hotennv, @diachinv, @luong, @sdtnv, @ngaysinh,@mapb, @gioitinh);
END;
go
 

--exec sp_nhanvien_insert 'nv', 'hoang van dung', '222 dia chi ma', 3214232, 123123,'09-09-2000','pb01', 'nam'
--Select * from nhanvien order by created_date asc where gioitinh = 'nam';
 
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 10:57 CH>
drop procedure if exists sp_nhanvien_select_all_all
go
CREATE PROCEDURE sp_nhanvien_select_all_all
AS
BEGIN
    SELECT 
       
        NV.MANV AS NhanVienID,
        PB.MAPB AS PhongBanID,
        NV.HOTENNV AS 'Họ và tên',
        PB.TENPHG AS 'Tên phòng ban'
        
    FROM 
        NHANVIEN NV,
		PHONGBAN PB
    where NV.MAPB = PB.MAPB
	order by nv.created_date desc;
END;
go

 
﻿
-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>

drop procedure if exists sp_nhanvien_select_one
go
CREATE PROCEDURE sp_nhanvien_select_one
	-- Add the parameters for the stored procedure here
	@manv char(11)
	 
AS
BEGIN 
    -- Insert statements for procedure here
	SELECT * from nhanvien where MANV like @manv --like chính xác mã 100%
END;
go

﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>

drop procedure if exists sp_nhanvien_update
go
CREATE PROCEDURE sp_nhanvien_update
	-- Add the parameters for the stored procedure here
	@manv char(11),
	@hotennv nvarchar(30),
	@diachinv nvarchar(100),
	@luong float,
	@sdtnv int,
	@ngaysinh date,
	@mapb char(4),
	@gioitinh nvarchar(10)
AS
BEGIN 
    -- Insert statements for procedure here
	update nhanvien set hotennv = @hotennv, diachinv = @diachinv,luong=@luong,sdtnv=@sdtnv ,ngaysinh=@ngaysinh, mapb = @mapb, gioitinh = @gioitinh where manv = @manv-- chuẩn sql
END;
go
﻿-- ================================================
-- Create Procedure sp_PhongBan_select_all.sql
-- Nhân viên phongban all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vo tu
-- Create date: <10/11/2023>
-- Description:	<vo tu select all>
-- =============================================
drop procedure if exists sp_cbb_chinhanh_select
go
CREATE PROCEDURE sp_cbb_chinhanh_select
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from CHINHANH
END
GO
exec sp_cbb_chinhanh_select
﻿-- ================================================
-- Create Procedure sp_phongban_delete.sql
-- Nhân viên delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vo tu
-- Create date: <10/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_phongban_delete
GO
CREATE PROCEDURE sp_phongban_delete
	-- Add the parameters for the stored procedure here
	@maPB char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM PHONGBAN WHERE MAPB = @maPB
END
GO
﻿-- ================================================
-- Create Procedure sp_nhanvien_insert.sql
-- Nhân viên insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <10/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_phongban_insert
go
CREATE PROCEDURE sp_PhongBan_insert
	-- Add the parameters for the stored procedure here
	@maPB char(11),
	@tenPB nvarchar(30),
	@maCN nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO PHONGBAN VALUES (@maPB, @tenPB, @maCN)
END
GO
﻿-- ================================================
-- Create Procedure sp_PhongBan_select_all.sql
-- Nhân viên phongban all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vo tu
-- Create date: <10/11/2023>
-- Description:	<vo tu select all>
-- =============================================
drop procedure if exists sp_phongban_select_all
go
CREATE PROCEDURE sp_phongban_select_all
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT pb.MAPB, pb.TENPHG, cn.TENCN from PHONGBAN pb, CHINHANH cn
END
GO
exec sp_phongban_select_all
﻿-- ================================================
-- Create Procedure sp_nhanvien_update.sql
-- Nhân viên update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <10/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_phongban_update
go
CREATE PROCEDURE sp_phongban_update
	-- Add the parameters for the stored procedure here
		@maPB char(11),
	@tenPB nvarchar(30),
	@maCN nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update PHONGBAN set TENPHG = @tenPB, MACN = @maCN where MACN = @maCN -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_delete.sql
-- Sản phẩm delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_sanpham_delete
GO
CREATE PROCEDURE sp_sanpham_delete
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM sanpham WHERE MASP = @MASP
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_insert.sql
-- Sản phẩm insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_sanpham_insert
go
CREATE PROCEDURE sp_sanpham_insert
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11),
	@TENSP NVARCHAR(30) ,
	@DONVI NVARCHAR(30),
	@NSX DATE ,
	@HSD DATE ,
	@DONGIA INT ,
	@SLTONKHO INT, 
	@MALOAI CHAR(11), 
	@MANCC CHAR(11), 
	@MAKM char(11)
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO sanpham (MASP,TENSP,DONVI ,NSX  ,HSD  ,DONGIA  ,SLTONKHO , MALOAI , MANCC, MAKM ) 
	VALUES (@MASP,@TENSP,@DONVI ,@NSX  ,@HSD  ,@DONGIA  ,@SLTONKHO , @MALOAI , @MANCC, @MAKM )
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_select_all.SQL
-- Sản phẩm select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Sok Kim Thanh>
-- Create date: <07/11/2023>
-- Description:	<Sản phẩm select all>
-- =============================================
drop procedure if exists sp_sanpham_select_all
go
CREATE PROCEDURE sp_sanpham_select_all
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from sanpham
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_select_all.SQL
-- Sản phẩm select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Sok Kim Thanh>
-- Create date: <07/11/2023>
-- Description:	<Sản phẩm select all>
-- =============================================
drop procedure if exists sp_sanpham_select_all
go
CREATE PROCEDURE sp_sanpham_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from SanPham

	
	
END
GO
exec sp_sanpham_select_all
﻿-- ================================================
-- Create Procedure sp_sanpham_select_one.sql
-- Sản phẩm select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_sanpham_select_one
go
CREATE PROCEDURE sp_sanpham_select_one
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from sanpham where MASP like @MASP --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_update.sql
-- Sản phẩm update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_sanpham_update
go
CREATE PROCEDURE sp_sanpham_update
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11),
	@TENSP NVARCHAR(30) ,
	@DONVI NVARCHAR(30),
	@NSX DATE ,
	@HSD DATE ,
	@DONGIA INT ,
	@SLTONKHO INT, 
	@MALOAI CHAR(11), 
	@MANCC CHAR(11), 
	@MAKM char(11)
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update sanpham set TENSP = @TENSP, DONVI = @DONVI, NSX = @NSX,HSD = @HSD,DONGIA = @DONGIA,SLTONKHO = @SLTONKHO,MALOAI = @MALOAI,MANCC = @MANCC,MAKM = @MAKM where MASP = @MASP -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_chitiethoadon_delete
GO
CREATE PROCEDURE sp_chitiethoadon_delete
	-- Add the parameters for the stored procedure here
	@makm char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM chitiethoadon WHERE MASP = @makm
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_insert
go
CREATE PROCEDURE sp_chitiethoadon_insert
	-- Add the parameters for the stored procedure here
	@mahd char(11) = '', 
    @masp char(11) = '',
	@sl int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO CHITIETHD VALUES (@mahd, @masp, @sl)
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_select_all
go
CREATE PROCEDURE sp_chitiethoadon_select_all
	-- Add the parameters for the stored procedure here
	@makm char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT hd.MAHD,sp.TENSP,ct.SLMUA,sp.DONGIA*ct.SLMUA as "Thành Tiền"
	from CHITIETHD ct, HOADON hd, SANPHAM sp
	where ct.MAHD = hd.MAHD and sp.MASP = ct.MASP;
END
GO
exec sp_chitiethoadon_select_all "HD01"
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
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
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_TongTien
go
CREATE PROCEDURE sp_chitiethoadon_TongTien
	-- Add the parameters for the stored procedure here
	@makm char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	Declare  @TT int = 0;
	select @TT += ct.SLMUA * sp.DONGIA
	from CHITIETHD ct,HOADON hd,SANPHAM sp
	where ct.MAHD = hd.MAHD and sp.MASP = ct.MASP

	Update HOADON
	set TONGTHANHTIEN = @TT
	where MAHD = @makm;
END
GO
exec sp_chitiethoadon_TongTien 'HD01'
select * 
from HOADON
where MAHD='HD01'
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_update
go
CREATE PROCEDURE sp_hinhthuckm_update
	-- Add the parameters for the stored procedure here
	@mahd char(11) = '', 
	@masp char(11) = '',
	@sl int
	as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update CHITIETHD set SLMUA = @sl where MAHD = @mahd and  MASP = @masp -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_chitiethoadon_delete
GO
CREATE PROCEDURE sp_chitiethoadon_delete
	-- Add the parameters for the stored procedure here
	@mahd char(11) ,
	@masp char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM CHITIETHD WHERE MASP = @masp and MAHD = @mahd
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_insert
go
CREATE PROCEDURE sp_chitiethoadon_insert
	-- Add the parameters for the stored procedure here
	@mahd char(11),
	@masp char(11),
	@sl int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO CHITIETHD VALUES (@mahd, @masp, @sl)
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_select_all
go
CREATE PROCEDURE sp_chitiethoadon_select_all
	-- Add the parameters for the stored procedure here
	 @MAHD CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT sp.TENSP,ct.SLMUA, ct.SLMUA * sp.DONGIA as "Thành tiền"
	from CHITIETHD ct,HOADON hd,SANPHAM sp 
	where ct.MAHD = hd.MAHD and ct.MASP=sp.MASP and ct.MAHD = @MAHD

END
GO
exec sp_chitiethoadon_select_all 'HD01'
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_update
go
CREATE PROCEDURE sp_chitiethoadon_update
	-- Add the parameters for the stored procedure here
	@mahd char(11) = '', 
	@masp char(11) = '', 
	@SLmua int
	as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update CHITIETHD set SLMUA = @SLmua where MAHD = @mahd and MASP = @masp -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_danhmuc_delete
GO
CREATE PROCEDURE sp_danhmuc_delete
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM LOAISP WHERE MALOAI = @MALOAI
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_insert
go
CREATE PROCEDURE sp_danhmuc_insert
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11) ,
	@TENLOAI NVARCHAR(30),
	@GHICHU NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO LOAISP VALUES (@MALOAI, @TENLOAI, @GHICHU)
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_select_all
go
CREATE PROCEDURE sp_danhmuc_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from LOAISP
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_select_one
go
CREATE PROCEDURE sp_danhmuc_select_one
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from LOAISP where MALOAI like @MALOAI --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_update
go
CREATE PROCEDURE sp_danhmuc_update
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11),
	@TENLOAI NVARCHAR(30),
	@GHICHU NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update LOAISP set TENLOAI = @TENLOAI, GHICHU = @GHICHU where MALOAI = @MALOAI -- chuẩn sql
END
GO
﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_diadiem_delete
GO
CREATE PROCEDURE sp_diadiem_delete
	-- Add the parameters for the stored procedure here
	@maCN char(4) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM CHINHANH WHERE MACN = @maCN
END
GO
﻿-- ================================================
-- Create Procedure sp_diadiem_insert.sql
-- Nhà cung cấp insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
set dateformat dmy
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_diadiem_insert
go
CREATE PROCEDURE sp_diadiem_insert
	-- Add the parameters for the stored procedure here
	@maCN char(4) = '',
	@tenCN nvarchar(30),
	@diaChi nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO CHINHANH VALUES (@maCN,@tenCN,@diaChi)
END
GO
exec sp_diadiem_insert 'CN05', N'Chi nhánh Đà Nẵng', N'Số 3 Nguyễn Văn Linh, Hải Châu, Đà Nẵng';

select * from CHINHANH

﻿set dateformat dmy
-- ================================================
-- Create Procedure sp_diadiem_select_all.sql
-- hoadon select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<dia diem select all>
-- =============================================
drop procedure if exists sp_diadiem_select_all
go
CREATE PROCEDURE sp_diadiem_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 

    -- Insert statements for procedure here
	SELECT * from CHINHANH
END
GO
exec sp_diadiem_select_all
﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_diaiem_update
go
CREATE PROCEDURE sp_diadiem_update
	-- Add the parameters for the stored procedure here
@maCN char(4) = '',
	@tenCN nvarchar(30),
	@diaChi nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update CHINHANH set TENCN = @tenCN, DIACHICN = @diaChi  where MACN = @maCN -- chuẩn sql
END
GO
--exec sp_diadiem_update 'CN05', N'Chi nhánh Bình Phước', N'Số 3 Nguyễn Văn Linh, Hải Châu, Đà Nẵng';
select * from CHINHANH﻿-- ================================================
-- Create Procedure sp_hinhthuckm_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_hinhthuckm_delete
GO
CREATE PROCEDURE sp_hinhthuckm_delete
	-- Add the parameters for the stored procedure here
	@makm char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM hinhthuckm WHERE MAHT = @makm
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_insert
go
CREATE PROCEDURE sp_hinhthuckm_insert
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
	INSERT INTO hinhthuckm VALUES (@makm, @hinhthuc, @ghichu)
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_select_all
go
CREATE PROCEDURE sp_hinhthuckm_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from hinhthuckm
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_select_one
go
CREATE PROCEDURE sp_hinhthuckm_select_one
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
	SELECT * from hinhthuckm where makm = @makm --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_update
go
CREATE PROCEDURE sp_hinhthuckm_update
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
	update hinhthuckm set TENHINHTHUC = @hinhthuc, ghichu = @ghichu  where MAHT = @makm -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_all.sql
-- Nhà cung cấp select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Nhà cung cấp select all>
-- =============================================
drop procedure if exists sp_cbb_khachhang_select_all
go
CREATE PROCEDURE sp_cbb_khachhang_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT kh.MAKH, kh.HOTENKH from KHACHHANG kh
END
GO
exec sp_cbb_khachhang_select_all






-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
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
drop procedure if exists sp_khachhang_update
go
CREATE PROCEDURE sp_khachhang_update
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

    -- Insert statements for procedure here
	update KHACHHANG set HOTENKH = @tenKH,SDTKH = @sdtKH, DIEMTL = @diemTL where MAKH = @maKH -- chuẩn sql
END
GO



-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
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
drop procedure if exists sp_nhacungcap_insert
go
CREATE PROCEDURE sp_khachhang_insert
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

    -- Insert statements for procedure here
	INSERT INTO KHACHHANG VALUES (@maKH, @tenKH, @sdtKH,@diemTL)
END
GO

-- ================================================
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
	@maKH char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM KHACHHANG WHERE MAKH = @maKH
END
GO

﻿set dateformat dmy
-- ================================================
-- Create Procedure sp_nhanvien_select_all.sql
-- nhan vien select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<nhan vien select all>
-- =============================================
drop procedure if exists sp_nhanvien_select_all
go
CREATE PROCEDURE sp_nhanvien_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 

    -- Insert statements for procedure here
	SELECT nv.MANV,nv.HOTENNV from NHANVIEN nv
END
GO
exec sp_nhanvien_select_all






-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
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
drop procedure if exists sp_hoadon_update
go
CREATE PROCEDURE sp_hoadon_update
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update HOADON set NGAYHOADON = @ngayHD, TONGTHANHTIEN = @tongTien, MANV = @maNV, MAKH =@maKH where MAHD = @maHD -- chuẩn sql
END
GO
--exec sp_hoadon_update'HD03','15/01/2022', 90000,'NV02', 'KH02'


-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
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
drop procedure if exists sp_hoadon_insert
go
CREATE PROCEDURE sp_hoadon_insert
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO HOADON VALUES (@maHD, @ngayHD, @tongTien,@maNV,@maKH)
END
GO
--exec sp_hoadon_insert 'HD03','15/01/2022', 90000,'NV02', 'KH02'

-- ================================================
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
DROP PROCEDURE IF EXISTS sp_hoadon_delete
GO
CREATE PROCEDURE sp_hoadon_delete
	-- Add the parameters for the stored procedure here
	@maHD char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM HOADON WHERE MAHD = @maHD
END
GO

﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_hoadon_delete
GO
CREATE PROCEDURE sp_hoadon_delete
	-- Add the parameters for the stored procedure here
	@maHD char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Delete statements for procedure here
	DELETE FROM HOADON WHERE MAHD = @maHD
	DELETE FROM CHITIETHD WHERE MAHD = @maHD
end
﻿-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
set dateformat dmy
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hoadon_insert
go
CREATE PROCEDURE sp_hoadon_insert
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO HOADON VALUES (@maHD, @ngayHD, @tongTien,@maNV,@maKH)
END
GO
exec sp_hoadon_insert 'HD03','15/01/2022', 90000,'NV02', 'KH02'

select * from NHANVIEN

﻿set dateformat dmy
-- ================================================
-- Create Procedure sp_hoadon_select_all.sql
-- hoadon select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Hóa đơn select all>
-- =============================================
drop procedure if exists sp_hoadon_select_all
go
CREATE PROCEDURE sp_hoadon_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 

    -- Insert statements for procedure here
	SELECT hd.MAHD, hd.NGAYHOADON, hd.TONGTHANHTIEN , nv.HOTENNV, kh.HOTENKH from HOADON hd, NHANVIEN nv, KHACHHANG kh
	where hd.MANV = nv.MANV and hd.MAKH = kh.MAKH
END
GO
exec sp_hoadon_select_all


﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_one.sql
-- Nhà cung cấp select one
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
drop procedure if exists sp_hoadon_select_one
go
CREATE PROCEDURE sp_hoadon_select_one
	-- Add the parameters for the stored procedure here
	@maHD char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT * from HOADON where MAHD  = @maHD --like chính xác mã 100%
END
GO
﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hoadon_update
go
CREATE PROCEDURE sp_hoadon_update
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update HOADON set NGAYHOADON = @ngayHD, TONGTHANHTIEN = @tongTien, MANV = @maNV, MAKH =@maKH where MAHD = @maHD -- chuẩn sql
END
GO
exec sp_hoadon_update'HD03','15/01/2022', 90000,'NV02', 'KH02'﻿-- ================================================
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
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM KHACHHANG WHERE MAKH = @maKH
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
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
drop procedure if exists sp_khachhang_insert
go
CREATE PROCEDURE sp_khachhang_insert
	-- Add the parameters for the stored procedure here
	@maKH char(11),
	@tenKH nvarchar(30),
	@sdtKH int = 0,
	@diemTL int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO KHACHHANG VALUES (@maKH, @tenKH, @sdtKH,@diemTL)
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_all.sql
-- Nhà cung cấp select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Nhà cung cấp select all>
-- =============================================
drop procedure if exists sp_khachhang_select_all
go
CREATE PROCEDURE sp_khachhang_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from KHACHHANG
END
GO
exec sp_khachhang_select_all



﻿-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
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
drop procedure if exists sp_khachhang_update
go
CREATE PROCEDURE sp_khachhang_update
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

    -- Insert statements for procedure here
	update KHACHHANG set HOTENKH = @tenKH,SDTKH = @sdtKH, DIEMTL = @diemTL where MAKH = @maKH -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_one.sql
-- Nhà cung cấp select one
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
drop procedure if exists sp_khachhang_select_one
go
CREATE PROCEDURE sp_khachhang_select_one
	-- Add the parameters for the stored procedure here
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT * from KHACHHANG where  MAKH = @maKH --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_cbo_hinhthuckm
go
CREATE PROCEDURE sp_cbo_hinhthuckm
	-- Add the parameters for the stored procedure here
	--@makm char(11) = '', 
	--@hinhthuc nvarchar(50) = N'',
	--@ghichu nvarchar(100) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MAKM from hinhthuckm-- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_khuyenmai_delete
GO
CREATE PROCEDURE sp_khuyenmai_delete
	-- Add the parameters for the stored procedure here
	@makm char(11) = '', 
	@ngaybd date,
	@ngaykt date,
	@masp char(11) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM khuyenmai WHERE makm = @makm
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_insert
go
CREATE PROCEDURE sp_khuyenmai_insert
	-- Add the parameters for the stored procedure here
	@makm char(11) = '', 
	@ngaybd date,
	@ngaykt date,
	@masp char(11) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO khuyenmai VALUES (@makm, @ngaybd, @ngaykt,@masp)
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_select_all
go
CREATE PROCEDURE sp_khuyenmai_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from KHUYENMAI , HINHTHUCKM
	where KHUYENMAI.MAHT = HINHTHUCKM.MAHT
END
GO
exec sp_khuyenmai_select_all
exec sp_sanpham_select_all
﻿-- ================================================
-- Create Procedure sp_khuyenmai_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_select_one
go
CREATE PROCEDURE sp_khuyenmai_select_one
	-- Add the parameters for the stored procedure here
	@MAKM CHAR(11) ,
	@NGAYBD DATE ,
	@NGAYKT DATE,
	@MAHT char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from khuyenmai where MAKM = @MAKM --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_update
go
CREATE PROCEDURE sp_khuyenmai_update
	-- Add the parameters for the stored procedure here
	@makm char(11) = '', 
	@ngaybd date,
	@ngaykt date,
	@masp char(11) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update khuyenmai set ngaybd = @ngaybd, ngaykt = @ngaykt, masp = @masp  where makm = @makm -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_delete.sql
-- Nhà cung cấp delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_nhacungcap_delete
GO
CREATE PROCEDURE sp_nhacungcap_delete
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM nhacungcap WHERE MANCC = @MANCC
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_nhacungcap_insert
go
CREATE PROCEDURE sp_nhacungcap_insert
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11),
	@TENNCC NVARCHAR(30) ,
	@DIACHINCC NVARCHAR(100),
	@SDTNCC INT   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO nhacungcap VALUES (@@MANCC, @TENNCC, @DIACHINCC,@SDTNCC)
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_all.sql
-- Nhà cung cấp select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Nhà cung cấp select all>
-- =============================================
drop procedure if exists sp_nhacungcap_select_all
go
CREATE PROCEDURE sp_nhacungcap_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from nhacungcap
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_one.sql
-- Nhà cung cấp select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_nhacungcap_select_one
go
CREATE PROCEDURE sp_nhacungcap_select_one
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from nhacungcap where MANCC like @MANCC --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_nhacungcap_update
go
CREATE PROCEDURE sp_nhacungcap_update
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11),
	@TENNCC NVARCHAR(30) ,
	@DIACHINCC NVARCHAR(100),
	@SDTNCC INT   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update nhacungcap set TENNCC = @TENNCC, DIACHINCC = @DIACHINCC,SDTNCC = @SDTNCC where MANCC = @MANCC -- chuẩn sql
END
GO
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023>
drop procedure if exists sp_cbo_phongban
go
CREATE PROCEDURE sp_cbo_phongban
	-- Add the parameters for the stored procedure here
	 
AS
BEGIN 
    -- Delete statements for procedure here
	Select MAPB, TENPHG FROM PHONGBAN
END;
go
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>

drop procedure if exists sp_nhanvien_delete
go
CREATE PROCEDURE sp_nhanvien_delete
	-- Add the parameters for the stored procedure here
	@manv char(11) 
AS
BEGIN 
    -- Delete statements for procedure here
	DELETE FROM nhanvien WHERE manv = @manv
END;
go 
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>
drop procedure if exists sp_nhanvien_insert
go
CREATE PROCEDURE sp_nhanvien_insert
	 
	-- Add the parameters for the stored procedure here
	@manv char(11),
	@hotennv nvarchar(30),
	@diachinv nvarchar(100),
	@luong float,
	@sdtnv int,
	@ngaysinh date,
	@mapb char(4),
	@gioitinh char(4)
AS
BEGIN 
    -- Insert statements for procedure here
	-- Đợi 50 milliseconds
	WAITFOR DELAY '00:00:00.050';
	INSERT INTO nhanvien(manv, hotennv, diachinv, luong, sdtnv, ngaysinh,mapb, gioitinh) 
	VALUES (@manv, @hotennv, @diachinv, @luong, @sdtnv, @ngaysinh,@mapb, @gioitinh);
END;
go
 

--exec sp_nhanvien_insert 'nv', 'hoang van dung', '222 dia chi ma', 3214232, 123123,'09-09-2000','pb01', 'nam'
--Select * from nhanvien order by created_date asc where gioitinh = 'nam';
 
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 10:57 CH>
drop procedure if exists sp_nhanvien_select_all_all
go
CREATE PROCEDURE sp_nhanvien_select_all_all
AS
BEGIN
    SELECT 
       
        NV.MANV AS NhanVienID,
        PB.MAPB AS PhongBanID,
        NV.HOTENNV AS 'Họ và tên',
        PB.TENPHG AS 'Tên phòng ban'
        
    FROM 
        NHANVIEN NV,
		PHONGBAN PB
    where NV.MAPB = PB.MAPB
	order by nv.created_date desc;
END;
go

 
﻿
-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>

drop procedure if exists sp_nhanvien_select_one
go
CREATE PROCEDURE sp_nhanvien_select_one
	-- Add the parameters for the stored procedure here
	@manv char(11)
	 
AS
BEGIN 
    -- Insert statements for procedure here
	SELECT * from nhanvien where MANV like @manv --like chính xác mã 100%
END;
go

﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>

drop procedure if exists sp_nhanvien_update
go
CREATE PROCEDURE sp_nhanvien_update
	-- Add the parameters for the stored procedure here
	@manv char(11),
	@hotennv nvarchar(30),
	@diachinv nvarchar(100),
	@luong float,
	@sdtnv int,
	@ngaysinh date,
	@mapb char(4),
	@gioitinh nvarchar(10)
AS
BEGIN 
    -- Insert statements for procedure here
	update nhanvien set hotennv = @hotennv, diachinv = @diachinv,luong=@luong,sdtnv=@sdtnv ,ngaysinh=@ngaysinh, mapb = @mapb, gioitinh = @gioitinh where manv = @manv-- chuẩn sql
END;
go
﻿-- ================================================
-- Create Procedure sp_PhongBan_select_all.sql
-- Nhân viên phongban all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vo tu
-- Create date: <10/11/2023>
-- Description:	<vo tu select all>
-- =============================================
drop procedure if exists sp_cbb_chinhanh_select
go
CREATE PROCEDURE sp_cbb_chinhanh_select
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from CHINHANH
END
GO
exec sp_cbb_chinhanh_select
﻿-- ================================================
-- Create Procedure sp_phongban_delete.sql
-- Nhân viên delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vo tu
-- Create date: <10/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_phongban_delete
GO
CREATE PROCEDURE sp_phongban_delete
	-- Add the parameters for the stored procedure here
	@maPB char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM PHONGBAN WHERE MAPB = @maPB
END
GO
﻿-- ================================================
-- Create Procedure sp_nhanvien_insert.sql
-- Nhân viên insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <10/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_phongban_insert
go
CREATE PROCEDURE sp_PhongBan_insert
	-- Add the parameters for the stored procedure here
	@maPB char(11),
	@tenPB nvarchar(30),
	@maCN nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO PHONGBAN VALUES (@maPB, @tenPB, @maCN)
END
GO
﻿-- ================================================
-- Create Procedure sp_PhongBan_select_all.sql
-- Nhân viên phongban all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vo tu
-- Create date: <10/11/2023>
-- Description:	<vo tu select all>
-- =============================================
drop procedure if exists sp_phongban_select_all
go
CREATE PROCEDURE sp_phongban_select_all
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT pb.MAPB, pb.TENPHG, cn.TENCN from PHONGBAN pb, CHINHANH cn
END
GO
exec sp_phongban_select_all
﻿-- ================================================
-- Create Procedure sp_nhanvien_update.sql
-- Nhân viên update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <10/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_phongban_update
go
CREATE PROCEDURE sp_phongban_update
	-- Add the parameters for the stored procedure here
		@maPB char(11),
	@tenPB nvarchar(30),
	@maCN nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update PHONGBAN set TENPHG = @tenPB, MACN = @maCN where MACN = @maCN -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_delete.sql
-- Sản phẩm delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_sanpham_delete
GO
CREATE PROCEDURE sp_sanpham_delete
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM sanpham WHERE MASP = @MASP
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_insert.sql
-- Sản phẩm insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_sanpham_insert
go
CREATE PROCEDURE sp_sanpham_insert
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11),
	@TENSP NVARCHAR(30) ,
	@DONVI NVARCHAR(30),
	@NSX DATE ,
	@HSD DATE ,
	@DONGIA INT ,
	@SLTONKHO INT, 
	@MALOAI CHAR(11), 
	@MANCC CHAR(11), 
	@MAKM char(11)
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO sanpham (MASP,TENSP,DONVI ,NSX  ,HSD  ,DONGIA  ,SLTONKHO , MALOAI , MANCC, MAKM ) 
	VALUES (@MASP,@TENSP,@DONVI ,@NSX  ,@HSD  ,@DONGIA  ,@SLTONKHO , @MALOAI , @MANCC, @MAKM )
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_select_all.SQL
-- Sản phẩm select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Sok Kim Thanh>
-- Create date: <07/11/2023>
-- Description:	<Sản phẩm select all>
-- =============================================
drop procedure if exists sp_sanpham_select_all
go
CREATE PROCEDURE sp_sanpham_select_all
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from sanpham
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_select_all.SQL
-- Sản phẩm select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Sok Kim Thanh>
-- Create date: <07/11/2023>
-- Description:	<Sản phẩm select all>
-- =============================================
drop procedure if exists sp_sanpham_select_all
go
CREATE PROCEDURE sp_sanpham_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from SanPham

	
	
END
GO
exec sp_sanpham_select_all
﻿-- ================================================
-- Create Procedure sp_sanpham_select_one.sql
-- Sản phẩm select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_sanpham_select_one
go
CREATE PROCEDURE sp_sanpham_select_one
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from sanpham where MASP like @MASP --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_update.sql
-- Sản phẩm update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_sanpham_update
go
CREATE PROCEDURE sp_sanpham_update
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11),
	@TENSP NVARCHAR(30) ,
	@DONVI NVARCHAR(30),
	@NSX DATE ,
	@HSD DATE ,
	@DONGIA INT ,
	@SLTONKHO INT, 
	@MALOAI CHAR(11), 
	@MANCC CHAR(11), 
	@MAKM char(11)
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update sanpham set TENSP = @TENSP, DONVI = @DONVI, NSX = @NSX,HSD = @HSD,DONGIA = @DONGIA,SLTONKHO = @SLTONKHO,MALOAI = @MALOAI,MANCC = @MANCC,MAKM = @MAKM where MASP = @MASP -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_chitiethoadon_delete
GO
CREATE PROCEDURE sp_chitiethoadon_delete
	-- Add the parameters for the stored procedure here
	@makm char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM chitiethoadon WHERE MASP = @makm
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_insert
go
CREATE PROCEDURE sp_chitiethoadon_insert
	-- Add the parameters for the stored procedure here
	@mahd char(11) = '', 
    @masp char(11) = '',
	@sl int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO CHITIETHD VALUES (@mahd, @masp, @sl)
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_select_all
go
CREATE PROCEDURE sp_chitiethoadon_select_all
	-- Add the parameters for the stored procedure here
	@makm char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT hd.MAHD,sp.TENSP,ct.SLMUA,sp.DONGIA*ct.SLMUA as "Thành Tiền"
	from CHITIETHD ct, HOADON hd, SANPHAM sp
	where ct.MAHD = hd.MAHD and sp.MASP = ct.MASP;
END
GO
exec sp_chitiethoadon_select_all "HD01"
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
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
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_TongTien
go
CREATE PROCEDURE sp_chitiethoadon_TongTien
	-- Add the parameters for the stored procedure here
	@makm char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	Declare  @TT int = 0;
	select @TT += ct.SLMUA * sp.DONGIA
	from CHITIETHD ct,HOADON hd,SANPHAM sp
	where ct.MAHD = hd.MAHD and sp.MASP = ct.MASP

	Update HOADON
	set TONGTHANHTIEN = @TT
	where MAHD = @makm;
END
GO
exec sp_chitiethoadon_TongTien 'HD01'
select * 
from HOADON
where MAHD='HD01'
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_update
go
CREATE PROCEDURE sp_hinhthuckm_update
	-- Add the parameters for the stored procedure here
	@mahd char(11) = '', 
	@masp char(11) = '',
	@sl int
	as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update CHITIETHD set SLMUA = @sl where MAHD = @mahd and  MASP = @masp -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_chitiethoadon_delete
GO
CREATE PROCEDURE sp_chitiethoadon_delete
	-- Add the parameters for the stored procedure here
	@mahd char(11) ,
	@masp char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM CHITIETHD WHERE MASP = @masp and MAHD = @mahd
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_insert
go
CREATE PROCEDURE sp_chitiethoadon_insert
	-- Add the parameters for the stored procedure here
	@mahd char(11),
	@masp char(11),
	@sl int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO CHITIETHD VALUES (@mahd, @masp, @sl)
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_select_all
go
CREATE PROCEDURE sp_chitiethoadon_select_all
	-- Add the parameters for the stored procedure here
	 @MAHD CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT sp.TENSP,ct.SLMUA, ct.SLMUA * sp.DONGIA as "Thành tiền"
	from CHITIETHD ct,HOADON hd,SANPHAM sp 
	where ct.MAHD = hd.MAHD and ct.MASP=sp.MASP and ct.MAHD = @MAHD

END
GO
exec sp_chitiethoadon_select_all 'HD01'
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_update
go
CREATE PROCEDURE sp_chitiethoadon_update
	-- Add the parameters for the stored procedure here
	@mahd char(11) = '', 
	@masp char(11) = '', 
	@SLmua int
	as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update CHITIETHD set SLMUA = @SLmua where MAHD = @mahd and MASP = @masp -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_danhmuc_delete
GO
CREATE PROCEDURE sp_danhmuc_delete
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM LOAISP WHERE MALOAI = @MALOAI
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_insert
go
CREATE PROCEDURE sp_danhmuc_insert
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11) ,
	@TENLOAI NVARCHAR(30),
	@GHICHU NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO LOAISP VALUES (@MALOAI, @TENLOAI, @GHICHU)
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_select_all
go
CREATE PROCEDURE sp_danhmuc_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from LOAISP
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_select_one
go
CREATE PROCEDURE sp_danhmuc_select_one
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from LOAISP where MALOAI like @MALOAI --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_update
go
CREATE PROCEDURE sp_danhmuc_update
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11),
	@TENLOAI NVARCHAR(30),
	@GHICHU NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update LOAISP set TENLOAI = @TENLOAI, GHICHU = @GHICHU where MALOAI = @MALOAI -- chuẩn sql
END
GO
﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_diadiem_delete
GO
CREATE PROCEDURE sp_diadiem_delete
	-- Add the parameters for the stored procedure here
	@maCN char(4) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM CHINHANH WHERE MACN = @maCN
END
GO
﻿-- ================================================
-- Create Procedure sp_diadiem_insert.sql
-- Nhà cung cấp insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
set dateformat dmy
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_diadiem_insert
go
CREATE PROCEDURE sp_diadiem_insert
	-- Add the parameters for the stored procedure here
	@maCN char(4) = '',
	@tenCN nvarchar(30),
	@diaChi nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO CHINHANH VALUES (@maCN,@tenCN,@diaChi)
END
GO
exec sp_diadiem_insert 'CN05', N'Chi nhánh Đà Nẵng', N'Số 3 Nguyễn Văn Linh, Hải Châu, Đà Nẵng';

select * from CHINHANH

﻿set dateformat dmy
-- ================================================
-- Create Procedure sp_diadiem_select_all.sql
-- hoadon select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<dia diem select all>
-- =============================================
drop procedure if exists sp_diadiem_select_all
go
CREATE PROCEDURE sp_diadiem_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 

    -- Insert statements for procedure here
	SELECT * from CHINHANH
END
GO
exec sp_diadiem_select_all
﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_diaiem_update
go
CREATE PROCEDURE sp_diadiem_update
	-- Add the parameters for the stored procedure here
@maCN char(4) = '',
	@tenCN nvarchar(30),
	@diaChi nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update CHINHANH set TENCN = @tenCN, DIACHICN = @diaChi  where MACN = @maCN -- chuẩn sql
END
GO
--exec sp_diadiem_update 'CN05', N'Chi nhánh Bình Phước', N'Số 3 Nguyễn Văn Linh, Hải Châu, Đà Nẵng';
select * from CHINHANH﻿-- ================================================
-- Create Procedure sp_hinhthuckm_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_hinhthuckm_delete
GO
CREATE PROCEDURE sp_hinhthuckm_delete
	-- Add the parameters for the stored procedure here
	@makm char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM hinhthuckm WHERE MAHT = @makm
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_insert
go
CREATE PROCEDURE sp_hinhthuckm_insert
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
	INSERT INTO hinhthuckm VALUES (@makm, @hinhthuc, @ghichu)
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_select_all
go
CREATE PROCEDURE sp_hinhthuckm_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from hinhthuckm
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_select_one
go
CREATE PROCEDURE sp_hinhthuckm_select_one
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
	SELECT * from hinhthuckm where makm = @makm --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_update
go
CREATE PROCEDURE sp_hinhthuckm_update
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
	update hinhthuckm set TENHINHTHUC = @hinhthuc, ghichu = @ghichu  where MAHT = @makm -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_all.sql
-- Nhà cung cấp select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Nhà cung cấp select all>
-- =============================================
drop procedure if exists sp_cbb_khachhang_select_all
go
CREATE PROCEDURE sp_cbb_khachhang_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT kh.MAKH, kh.HOTENKH from KHACHHANG kh
END
GO
exec sp_cbb_khachhang_select_all






-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
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
drop procedure if exists sp_khachhang_update
go
CREATE PROCEDURE sp_khachhang_update
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

    -- Insert statements for procedure here
	update KHACHHANG set HOTENKH = @tenKH,SDTKH = @sdtKH, DIEMTL = @diemTL where MAKH = @maKH -- chuẩn sql
END
GO



-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
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
drop procedure if exists sp_nhacungcap_insert
go
CREATE PROCEDURE sp_khachhang_insert
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

    -- Insert statements for procedure here
	INSERT INTO KHACHHANG VALUES (@maKH, @tenKH, @sdtKH,@diemTL)
END
GO

-- ================================================
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
	@maKH char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM KHACHHANG WHERE MAKH = @maKH
END
GO

﻿set dateformat dmy
-- ================================================
-- Create Procedure sp_nhanvien_select_all.sql
-- nhan vien select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<nhan vien select all>
-- =============================================
drop procedure if exists sp_nhanvien_select_all
go
CREATE PROCEDURE sp_nhanvien_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 

    -- Insert statements for procedure here
	SELECT nv.MANV,nv.HOTENNV from NHANVIEN nv
END
GO
exec sp_nhanvien_select_all






-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
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
drop procedure if exists sp_hoadon_update
go
CREATE PROCEDURE sp_hoadon_update
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update HOADON set NGAYHOADON = @ngayHD, TONGTHANHTIEN = @tongTien, MANV = @maNV, MAKH =@maKH where MAHD = @maHD -- chuẩn sql
END
GO
--exec sp_hoadon_update'HD03','15/01/2022', 90000,'NV02', 'KH02'


-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
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
drop procedure if exists sp_hoadon_insert
go
CREATE PROCEDURE sp_hoadon_insert
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO HOADON VALUES (@maHD, @ngayHD, @tongTien,@maNV,@maKH)
END
GO
--exec sp_hoadon_insert 'HD03','15/01/2022', 90000,'NV02', 'KH02'

-- ================================================
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
DROP PROCEDURE IF EXISTS sp_hoadon_delete
GO
CREATE PROCEDURE sp_hoadon_delete
	-- Add the parameters for the stored procedure here
	@maHD char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM HOADON WHERE MAHD = @maHD
END
GO

﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_hoadon_delete
GO
CREATE PROCEDURE sp_hoadon_delete
	-- Add the parameters for the stored procedure here
	@maHD char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Delete statements for procedure here
	DELETE FROM HOADON WHERE MAHD = @maHD
	DELETE FROM CHITIETHD WHERE MAHD = @maHD
end
﻿-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
set dateformat dmy
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hoadon_insert
go
CREATE PROCEDURE sp_hoadon_insert
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO HOADON VALUES (@maHD, @ngayHD, @tongTien,@maNV,@maKH)
END
GO
exec sp_hoadon_insert 'HD03','15/01/2022', 90000,'NV02', 'KH02'

select * from NHANVIEN

﻿set dateformat dmy
-- ================================================
-- Create Procedure sp_hoadon_select_all.sql
-- hoadon select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Hóa đơn select all>
-- =============================================
drop procedure if exists sp_hoadon_select_all
go
CREATE PROCEDURE sp_hoadon_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 

    -- Insert statements for procedure here
	SELECT hd.MAHD, hd.NGAYHOADON, hd.TONGTHANHTIEN , nv.HOTENNV, kh.HOTENKH from HOADON hd, NHANVIEN nv, KHACHHANG kh
	where hd.MANV = nv.MANV and hd.MAKH = kh.MAKH
END
GO
exec sp_hoadon_select_all


﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_one.sql
-- Nhà cung cấp select one
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
drop procedure if exists sp_hoadon_select_one
go
CREATE PROCEDURE sp_hoadon_select_one
	-- Add the parameters for the stored procedure here
	@maHD char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT * from HOADON where MAHD  = @maHD --like chính xác mã 100%
END
GO
﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hoadon_update
go
CREATE PROCEDURE sp_hoadon_update
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update HOADON set NGAYHOADON = @ngayHD, TONGTHANHTIEN = @tongTien, MANV = @maNV, MAKH =@maKH where MAHD = @maHD -- chuẩn sql
END
GO
exec sp_hoadon_update'HD03','15/01/2022', 90000,'NV02', 'KH02'﻿-- ================================================
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
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM KHACHHANG WHERE MAKH = @maKH
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
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
drop procedure if exists sp_khachhang_insert
go
CREATE PROCEDURE sp_khachhang_insert
	-- Add the parameters for the stored procedure here
	@maKH char(11),
	@tenKH nvarchar(30),
	@sdtKH int = 0,
	@diemTL int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO KHACHHANG VALUES (@maKH, @tenKH, @sdtKH,@diemTL)
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_all.sql
-- Nhà cung cấp select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Nhà cung cấp select all>
-- =============================================
drop procedure if exists sp_khachhang_select_all
go
CREATE PROCEDURE sp_khachhang_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from KHACHHANG
END
GO
exec sp_khachhang_select_all



﻿-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
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
drop procedure if exists sp_khachhang_update
go
CREATE PROCEDURE sp_khachhang_update
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

    -- Insert statements for procedure here
	update KHACHHANG set HOTENKH = @tenKH,SDTKH = @sdtKH, DIEMTL = @diemTL where MAKH = @maKH -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_one.sql
-- Nhà cung cấp select one
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
drop procedure if exists sp_khachhang_select_one
go
CREATE PROCEDURE sp_khachhang_select_one
	-- Add the parameters for the stored procedure here
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT * from KHACHHANG where  MAKH = @maKH --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_cbo_hinhthuckm
go
CREATE PROCEDURE sp_cbo_hinhthuckm
	-- Add the parameters for the stored procedure here
	--@makm char(11) = '', 
	--@hinhthuc nvarchar(50) = N'',
	--@ghichu nvarchar(100) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MAKM from hinhthuckm-- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_khuyenmai_delete
GO
CREATE PROCEDURE sp_khuyenmai_delete
	-- Add the parameters for the stored procedure here
	@makm char(11) = '', 
	@ngaybd date,
	@ngaykt date,
	@masp char(11) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM khuyenmai WHERE makm = @makm
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_insert
go
CREATE PROCEDURE sp_khuyenmai_insert
	-- Add the parameters for the stored procedure here
	@makm char(11) = '', 
	@ngaybd date,
	@ngaykt date,
	@masp char(11) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO khuyenmai VALUES (@makm, @ngaybd, @ngaykt,@masp)
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_select_all
go
CREATE PROCEDURE sp_khuyenmai_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from KHUYENMAI , HINHTHUCKM
	where KHUYENMAI.MAHT = HINHTHUCKM.MAHT
END
GO
exec sp_khuyenmai_select_all
exec sp_sanpham_select_all
﻿-- ================================================
-- Create Procedure sp_khuyenmai_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_select_one
go
CREATE PROCEDURE sp_khuyenmai_select_one
	-- Add the parameters for the stored procedure here
	@MAKM CHAR(11) ,
	@NGAYBD DATE ,
	@NGAYKT DATE,
	@MAHT char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from khuyenmai where MAKM = @MAKM --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_update
go
CREATE PROCEDURE sp_khuyenmai_update
	-- Add the parameters for the stored procedure here
	@makm char(11) = '', 
	@ngaybd date,
	@ngaykt date,
	@masp char(11) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update khuyenmai set ngaybd = @ngaybd, ngaykt = @ngaykt, masp = @masp  where makm = @makm -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_delete.sql
-- Nhà cung cấp delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_nhacungcap_delete
GO
CREATE PROCEDURE sp_nhacungcap_delete
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM nhacungcap WHERE MANCC = @MANCC
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_nhacungcap_insert
go
CREATE PROCEDURE sp_nhacungcap_insert
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11),
	@TENNCC NVARCHAR(30) ,
	@DIACHINCC NVARCHAR(100),
	@SDTNCC INT   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO nhacungcap VALUES (@@MANCC, @TENNCC, @DIACHINCC,@SDTNCC)
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_all.sql
-- Nhà cung cấp select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Nhà cung cấp select all>
-- =============================================
drop procedure if exists sp_nhacungcap_select_all
go
CREATE PROCEDURE sp_nhacungcap_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from nhacungcap
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_one.sql
-- Nhà cung cấp select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_nhacungcap_select_one
go
CREATE PROCEDURE sp_nhacungcap_select_one
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from nhacungcap where MANCC like @MANCC --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_nhacungcap_update
go
CREATE PROCEDURE sp_nhacungcap_update
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11),
	@TENNCC NVARCHAR(30) ,
	@DIACHINCC NVARCHAR(100),
	@SDTNCC INT   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update nhacungcap set TENNCC = @TENNCC, DIACHINCC = @DIACHINCC,SDTNCC = @SDTNCC where MANCC = @MANCC -- chuẩn sql
END
GO
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023>
drop procedure if exists sp_cbo_phongban
go
CREATE PROCEDURE sp_cbo_phongban
	-- Add the parameters for the stored procedure here
	 
AS
BEGIN 
    -- Delete statements for procedure here
	Select MAPB, TENPHG FROM PHONGBAN
END;
go
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>

drop procedure if exists sp_nhanvien_delete
go
CREATE PROCEDURE sp_nhanvien_delete
	-- Add the parameters for the stored procedure here
	@manv char(11) 
AS
BEGIN 
    -- Delete statements for procedure here
	DELETE FROM nhanvien WHERE manv = @manv
END;
go 
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>
drop procedure if exists sp_nhanvien_insert
go
CREATE PROCEDURE sp_nhanvien_insert
	 
	-- Add the parameters for the stored procedure here
	@manv char(11),
	@hotennv nvarchar(30),
	@diachinv nvarchar(100),
	@luong float,
	@sdtnv int,
	@ngaysinh date,
	@mapb char(4),
	@gioitinh char(4)
AS
BEGIN 
    -- Insert statements for procedure here
	-- Đợi 50 milliseconds
	WAITFOR DELAY '00:00:00.050';
	INSERT INTO nhanvien(manv, hotennv, diachinv, luong, sdtnv, ngaysinh,mapb, gioitinh) 
	VALUES (@manv, @hotennv, @diachinv, @luong, @sdtnv, @ngaysinh,@mapb, @gioitinh);
END;
go
 

--exec sp_nhanvien_insert 'nv', 'hoang van dung', '222 dia chi ma', 3214232, 123123,'09-09-2000','pb01', 'nam'
--Select * from nhanvien order by created_date asc where gioitinh = 'nam';
 
﻿
-- Author:		Sok Kim Thanh
-- Create date: <10/12/2023 9:33 SA>

drop procedure if exists sp_nhanvien_search
go
CREATE PROCEDURE sp_nhanvien_search
	-- Add the parameters for the stored procedure here
	@keyword nvarchar(100)
	 
AS
BEGIN 
    -- Insert statements for procedure here
	SELECT * from nhanvien where HOTENNV like '%' + @keyword + '%'--like chính xác mã 100%
END;
go

--select * from nhanvien
--exec sp_nhanvien_search 'b' --test ok﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 10:57 CH>
drop procedure if exists sp_nhanvien_select_all_all
go
CREATE PROCEDURE sp_nhanvien_select_all_all
AS
BEGIN
    SELECT 
       
        NV.MANV AS NhanVienID,
        PB.MAPB AS PhongBanID,
        NV.HOTENNV AS 'Họ và tên',
        PB.TENPHG AS 'Tên phòng ban'
        
    FROM 
        NHANVIEN NV,
		PHONGBAN PB
    where NV.MAPB = PB.MAPB
	order by nv.created_date desc;
END;
go

 
﻿
-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>

drop procedure if exists sp_nhanvien_select_one
go
CREATE PROCEDURE sp_nhanvien_select_one
	-- Add the parameters for the stored procedure here
	@manv char(11)
	 
AS
BEGIN 
    -- Insert statements for procedure here
	SELECT * from nhanvien where MANV like @manv --like chính xác mã 100%
END;
go

﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>

drop procedure if exists sp_nhanvien_update
go
CREATE PROCEDURE sp_nhanvien_update
	-- Add the parameters for the stored procedure here
	@manv char(11),
	@hotennv nvarchar(30),
	@diachinv nvarchar(100),
	@luong float,
	@sdtnv int,
	@ngaysinh date,
	@mapb char(4),
	@gioitinh nvarchar(10)
AS
BEGIN 
    -- Insert statements for procedure here
	update nhanvien set hotennv = @hotennv, diachinv = @diachinv,luong=@luong,sdtnv=@sdtnv ,ngaysinh=@ngaysinh, mapb = @mapb, gioitinh = @gioitinh where manv = @manv-- chuẩn sql
END;
go
﻿-- ================================================
-- Create Procedure sp_PhongBan_select_all.sql
-- Nhân viên phongban all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vo tu
-- Create date: <10/11/2023>
-- Description:	<vo tu select all>
-- =============================================
drop procedure if exists sp_cbb_chinhanh_select
go
CREATE PROCEDURE sp_cbb_chinhanh_select
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from CHINHANH
END
GO
exec sp_cbb_chinhanh_select
﻿-- ================================================
-- Create Procedure sp_phongban_delete.sql
-- Nhân viên delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vo tu
-- Create date: <10/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_phongban_delete
GO
CREATE PROCEDURE sp_phongban_delete
	-- Add the parameters for the stored procedure here
	@maPB char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM PHONGBAN WHERE MAPB = @maPB
END
GO
﻿-- ================================================
-- Create Procedure sp_nhanvien_insert.sql
-- Nhân viên insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <10/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_phongban_insert
go
CREATE PROCEDURE sp_PhongBan_insert
	-- Add the parameters for the stored procedure here
	@maPB char(11),
	@tenPB nvarchar(30),
	@maCN nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO PHONGBAN VALUES (@maPB, @tenPB, @maCN)
END
GO
﻿-- ================================================
-- Create Procedure sp_PhongBan_select_all.sql
-- Nhân viên phongban all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vo tu
-- Create date: <10/11/2023>
-- Description:	<vo tu select all>
-- =============================================
drop procedure if exists sp_phongban_select_all
go
CREATE PROCEDURE sp_phongban_select_all
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT pb.MAPB, pb.TENPHG, cn.TENCN from PHONGBAN pb, CHINHANH cn
END
GO
exec sp_phongban_select_all
﻿-- ================================================
-- Create Procedure sp_nhanvien_update.sql
-- Nhân viên update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <10/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_phongban_update
go
CREATE PROCEDURE sp_phongban_update
	-- Add the parameters for the stored procedure here
		@maPB char(11),
	@tenPB nvarchar(30),
	@maCN nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update PHONGBAN set TENPHG = @tenPB, MACN = @maCN where MACN = @maCN -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_delete.sql
-- Sản phẩm delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_sanpham_delete
GO
CREATE PROCEDURE sp_sanpham_delete
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM sanpham WHERE MASP = @MASP
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_insert.sql
-- Sản phẩm insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_sanpham_insert
go
CREATE PROCEDURE sp_sanpham_insert
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11),
	@TENSP NVARCHAR(30) ,
	@DONVI NVARCHAR(30),
	@NSX DATE ,
	@HSD DATE ,
	@DONGIA INT ,
	@SLTONKHO INT, 
	@MALOAI CHAR(11), 
	@MANCC CHAR(11), 
	@MAKM char(11)
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO sanpham (MASP,TENSP,DONVI ,NSX  ,HSD  ,DONGIA  ,SLTONKHO , MALOAI , MANCC, MAKM ) 
	VALUES (@MASP,@TENSP,@DONVI ,@NSX  ,@HSD  ,@DONGIA  ,@SLTONKHO , @MALOAI , @MANCC, @MAKM )
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_select_all.SQL
-- Sản phẩm select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Sok Kim Thanh>
-- Create date: <07/11/2023>
-- Description:	<Sản phẩm select all>
-- =============================================
drop procedure if exists sp_sanpham_select_all
go
CREATE PROCEDURE sp_sanpham_select_all
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from sanpham
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_select_all.SQL
-- Sản phẩm select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Sok Kim Thanh>
-- Create date: <07/11/2023>
-- Description:	<Sản phẩm select all>
-- =============================================
drop procedure if exists sp_sanpham_select_all
go
CREATE PROCEDURE sp_sanpham_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from SanPham

	
	
END
GO
exec sp_sanpham_select_all
﻿-- ================================================
-- Create Procedure sp_sanpham_select_one.sql
-- Sản phẩm select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_sanpham_select_one
go
CREATE PROCEDURE sp_sanpham_select_one
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from sanpham where MASP like @MASP --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_update.sql
-- Sản phẩm update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_sanpham_update
go
CREATE PROCEDURE sp_sanpham_update
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11),
	@TENSP NVARCHAR(30) ,
	@DONVI NVARCHAR(30),
	@NSX DATE ,
	@HSD DATE ,
	@DONGIA INT ,
	@SLTONKHO INT, 
	@MALOAI CHAR(11), 
	@MANCC CHAR(11), 
	@MAKM char(11)
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update sanpham set TENSP = @TENSP, DONVI = @DONVI, NSX = @NSX,HSD = @HSD,DONGIA = @DONGIA,SLTONKHO = @SLTONKHO,MALOAI = @MALOAI,MANCC = @MANCC,MAKM = @MAKM where MASP = @MASP -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_chitiethoadon_delete
GO
CREATE PROCEDURE sp_chitiethoadon_delete
	-- Add the parameters for the stored procedure here
	@makm char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM chitiethoadon WHERE MASP = @makm
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_insert
go
CREATE PROCEDURE sp_chitiethoadon_insert
	-- Add the parameters for the stored procedure here
	@mahd char(11) = '', 
    @masp char(11) = '',
	@sl int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO CHITIETHD VALUES (@mahd, @masp, @sl)
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_select_all
go
CREATE PROCEDURE sp_chitiethoadon_select_all
	-- Add the parameters for the stored procedure here
	@makm char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT hd.MAHD,sp.TENSP,ct.SLMUA,sp.DONGIA*ct.SLMUA as "Thành Tiền"
	from CHITIETHD ct, HOADON hd, SANPHAM sp
	where ct.MAHD = hd.MAHD and sp.MASP = ct.MASP;
END
GO
exec sp_chitiethoadon_select_all "HD01"
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
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
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_TongTien
go
CREATE PROCEDURE sp_chitiethoadon_TongTien
	-- Add the parameters for the stored procedure here
	@makm char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	Declare  @TT int = 0;
	select @TT += ct.SLMUA * sp.DONGIA
	from CHITIETHD ct,HOADON hd,SANPHAM sp
	where ct.MAHD = hd.MAHD and sp.MASP = ct.MASP

	Update HOADON
	set TONGTHANHTIEN = @TT
	where MAHD = @makm;
END
GO
exec sp_chitiethoadon_TongTien 'HD01'
select * 
from HOADON
where MAHD='HD01'
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_update
go
CREATE PROCEDURE sp_hinhthuckm_update
	-- Add the parameters for the stored procedure here
	@mahd char(11) = '', 
	@masp char(11) = '',
	@sl int
	as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update CHITIETHD set SLMUA = @sl where MAHD = @mahd and  MASP = @masp -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_chitiethoadon_delete
GO
CREATE PROCEDURE sp_chitiethoadon_delete
	-- Add the parameters for the stored procedure here
	@mahd char(11) ,
	@masp char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM CHITIETHD WHERE MASP = @masp and MAHD = @mahd
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_insert
go
CREATE PROCEDURE sp_chitiethoadon_insert
	-- Add the parameters for the stored procedure here
	@mahd char(11),
	@masp char(11),
	@sl int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO CHITIETHD VALUES (@mahd, @masp, @sl)
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_select_all
go
CREATE PROCEDURE sp_chitiethoadon_select_all
	-- Add the parameters for the stored procedure here
	 @MAHD CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT sp.TENSP,ct.SLMUA, ct.SLMUA * sp.DONGIA as "Thành tiền"
	from CHITIETHD ct,HOADON hd,SANPHAM sp 
	where ct.MAHD = hd.MAHD and ct.MASP=sp.MASP and ct.MAHD = @MAHD

END
GO
exec sp_chitiethoadon_select_all 'HD01'
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_update
go
CREATE PROCEDURE sp_chitiethoadon_update
	-- Add the parameters for the stored procedure here
	@mahd char(11) = '', 
	@masp char(11) = '', 
	@SLmua int
	as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update CHITIETHD set SLMUA = @SLmua where MAHD = @mahd and MASP = @masp -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_danhmuc_delete
GO
CREATE PROCEDURE sp_danhmuc_delete
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM LOAISP WHERE MALOAI = @MALOAI
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_insert
go
CREATE PROCEDURE sp_danhmuc_insert
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11) ,
	@TENLOAI NVARCHAR(30),
	@GHICHU NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO LOAISP VALUES (@MALOAI, @TENLOAI, @GHICHU)
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_select_all
go
CREATE PROCEDURE sp_danhmuc_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from LOAISP
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_select_one
go
CREATE PROCEDURE sp_danhmuc_select_one
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from LOAISP where MALOAI like @MALOAI --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_update
go
CREATE PROCEDURE sp_danhmuc_update
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11),
	@TENLOAI NVARCHAR(30),
	@GHICHU NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update LOAISP set TENLOAI = @TENLOAI, GHICHU = @GHICHU where MALOAI = @MALOAI -- chuẩn sql
END
GO
﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_diadiem_delete
GO
CREATE PROCEDURE sp_diadiem_delete
	-- Add the parameters for the stored procedure here
	@maCN char(4) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM CHINHANH WHERE MACN = @maCN
END
GO
﻿-- ================================================
-- Create Procedure sp_diadiem_insert.sql
-- Nhà cung cấp insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
set dateformat dmy
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_diadiem_insert
go
CREATE PROCEDURE sp_diadiem_insert
	-- Add the parameters for the stored procedure here
	@maCN char(4) = '',
	@tenCN nvarchar(30),
	@diaChi nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO CHINHANH VALUES (@maCN,@tenCN,@diaChi)
END
GO
exec sp_diadiem_insert 'CN05', N'Chi nhánh Đà Nẵng', N'Số 3 Nguyễn Văn Linh, Hải Châu, Đà Nẵng';

select * from CHINHANH

﻿set dateformat dmy
-- ================================================
-- Create Procedure sp_diadiem_select_all.sql
-- hoadon select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<dia diem select all>
-- =============================================
drop procedure if exists sp_diadiem_select_all
go
CREATE PROCEDURE sp_diadiem_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 

    -- Insert statements for procedure here
	SELECT * from CHINHANH
END
GO
exec sp_diadiem_select_all
﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_diaiem_update
go
CREATE PROCEDURE sp_diadiem_update
	-- Add the parameters for the stored procedure here
@maCN char(4) = '',
	@tenCN nvarchar(30),
	@diaChi nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update CHINHANH set TENCN = @tenCN, DIACHICN = @diaChi  where MACN = @maCN -- chuẩn sql
END
GO
--exec sp_diadiem_update 'CN05', N'Chi nhánh Bình Phước', N'Số 3 Nguyễn Văn Linh, Hải Châu, Đà Nẵng';
select * from CHINHANH﻿-- ================================================
-- Create Procedure sp_hinhthuckm_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_hinhthuckm_delete
GO
CREATE PROCEDURE sp_hinhthuckm_delete
	-- Add the parameters for the stored procedure here
	@makm char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM hinhthuckm WHERE MAHT = @makm
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_insert
go
CREATE PROCEDURE sp_hinhthuckm_insert
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
	INSERT INTO hinhthuckm VALUES (@makm, @hinhthuc, @ghichu)
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_select_all
go
CREATE PROCEDURE sp_hinhthuckm_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from hinhthuckm
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_select_one
go
CREATE PROCEDURE sp_hinhthuckm_select_one
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
	SELECT * from hinhthuckm where makm = @makm --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_update
go
CREATE PROCEDURE sp_hinhthuckm_update
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
	update hinhthuckm set TENHINHTHUC = @hinhthuc, ghichu = @ghichu  where MAHT = @makm -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_all.sql
-- Nhà cung cấp select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Nhà cung cấp select all>
-- =============================================
drop procedure if exists sp_cbb_khachhang_select_all
go
CREATE PROCEDURE sp_cbb_khachhang_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT kh.MAKH, kh.HOTENKH from KHACHHANG kh
END
GO
exec sp_cbb_khachhang_select_all






-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
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
drop procedure if exists sp_khachhang_update
go
CREATE PROCEDURE sp_khachhang_update
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

    -- Insert statements for procedure here
	update KHACHHANG set HOTENKH = @tenKH,SDTKH = @sdtKH, DIEMTL = @diemTL where MAKH = @maKH -- chuẩn sql
END
GO



-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
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
drop procedure if exists sp_nhacungcap_insert
go
CREATE PROCEDURE sp_khachhang_insert
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

    -- Insert statements for procedure here
	INSERT INTO KHACHHANG VALUES (@maKH, @tenKH, @sdtKH,@diemTL)
END
GO

-- ================================================
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
	@maKH char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM KHACHHANG WHERE MAKH = @maKH
END
GO

﻿set dateformat dmy
-- ================================================
-- Create Procedure sp_nhanvien_select_all.sql
-- nhan vien select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<nhan vien select all>
-- =============================================
drop procedure if exists sp_nhanvien_select_all
go
CREATE PROCEDURE sp_nhanvien_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 

    -- Insert statements for procedure here
	SELECT nv.MANV,nv.HOTENNV from NHANVIEN nv
END
GO
exec sp_nhanvien_select_all






-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
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
drop procedure if exists sp_hoadon_update
go
CREATE PROCEDURE sp_hoadon_update
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update HOADON set NGAYHOADON = @ngayHD, TONGTHANHTIEN = @tongTien, MANV = @maNV, MAKH =@maKH where MAHD = @maHD -- chuẩn sql
END
GO
--exec sp_hoadon_update'HD03','15/01/2022', 90000,'NV02', 'KH02'


-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
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
drop procedure if exists sp_hoadon_insert
go
CREATE PROCEDURE sp_hoadon_insert
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO HOADON VALUES (@maHD, @ngayHD, @tongTien,@maNV,@maKH)
END
GO
--exec sp_hoadon_insert 'HD03','15/01/2022', 90000,'NV02', 'KH02'

-- ================================================
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
DROP PROCEDURE IF EXISTS sp_hoadon_delete
GO
CREATE PROCEDURE sp_hoadon_delete
	-- Add the parameters for the stored procedure here
	@maHD char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM HOADON WHERE MAHD = @maHD
END
GO

﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_hoadon_delete
GO
CREATE PROCEDURE sp_hoadon_delete
	-- Add the parameters for the stored procedure here
	@maHD char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Delete statements for procedure here
	DELETE FROM HOADON WHERE MAHD = @maHD
	DELETE FROM CHITIETHD WHERE MAHD = @maHD
end
﻿-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
set dateformat dmy
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hoadon_insert
go
CREATE PROCEDURE sp_hoadon_insert
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO HOADON VALUES (@maHD, @ngayHD, @tongTien,@maNV,@maKH)
END
GO
exec sp_hoadon_insert 'HD03','15/01/2022', 90000,'NV02', 'KH02'

select * from NHANVIEN

﻿set dateformat dmy
-- ================================================
-- Create Procedure sp_hoadon_select_all.sql
-- hoadon select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Hóa đơn select all>
-- =============================================
drop procedure if exists sp_hoadon_select_all
go
CREATE PROCEDURE sp_hoadon_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 

    -- Insert statements for procedure here
	SELECT hd.MAHD, hd.NGAYHOADON, hd.TONGTHANHTIEN , nv.HOTENNV, kh.HOTENKH from HOADON hd, NHANVIEN nv, KHACHHANG kh
	where hd.MANV = nv.MANV and hd.MAKH = kh.MAKH
END
GO
exec sp_hoadon_select_all


﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_one.sql
-- Nhà cung cấp select one
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
drop procedure if exists sp_hoadon_select_one
go
CREATE PROCEDURE sp_hoadon_select_one
	-- Add the parameters for the stored procedure here
	@maHD char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT * from HOADON where MAHD  = @maHD --like chính xác mã 100%
END
GO
﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hoadon_update
go
CREATE PROCEDURE sp_hoadon_update
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update HOADON set NGAYHOADON = @ngayHD, TONGTHANHTIEN = @tongTien, MANV = @maNV, MAKH =@maKH where MAHD = @maHD -- chuẩn sql
END
GO
exec sp_hoadon_update'HD03','15/01/2022', 90000,'NV02', 'KH02'﻿-- ================================================
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
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM KHACHHANG WHERE MAKH = @maKH
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
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
drop procedure if exists sp_khachhang_insert
go
CREATE PROCEDURE sp_khachhang_insert
	-- Add the parameters for the stored procedure here
	@maKH char(11),
	@tenKH nvarchar(30),
	@sdtKH int = 0,
	@diemTL int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO KHACHHANG VALUES (@maKH, @tenKH, @sdtKH,@diemTL)
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_all.sql
-- Nhà cung cấp select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Nhà cung cấp select all>
-- =============================================
drop procedure if exists sp_khachhang_select_all
go
CREATE PROCEDURE sp_khachhang_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from KHACHHANG
END
GO
exec sp_khachhang_select_all



﻿-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
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
drop procedure if exists sp_khachhang_update
go
CREATE PROCEDURE sp_khachhang_update
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

    -- Insert statements for procedure here
	update KHACHHANG set HOTENKH = @tenKH,SDTKH = @sdtKH, DIEMTL = @diemTL where MAKH = @maKH -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_one.sql
-- Nhà cung cấp select one
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
drop procedure if exists sp_khachhang_select_one
go
CREATE PROCEDURE sp_khachhang_select_one
	-- Add the parameters for the stored procedure here
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT * from KHACHHANG where  MAKH = @maKH --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_cbo_hinhthuckm
go
CREATE PROCEDURE sp_cbo_hinhthuckm
	-- Add the parameters for the stored procedure here
	--@makm char(11) = '', 
	--@hinhthuc nvarchar(50) = N'',
	--@ghichu nvarchar(100) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MAKM from hinhthuckm-- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_khuyenmai_delete
GO
CREATE PROCEDURE sp_khuyenmai_delete
	-- Add the parameters for the stored procedure here
	@makm char(11) = '', 
	@ngaybd date,
	@ngaykt date,
	@masp char(11) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM khuyenmai WHERE makm = @makm
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_insert
go
CREATE PROCEDURE sp_khuyenmai_insert
	-- Add the parameters for the stored procedure here
	@makm char(11) = '', 
	@ngaybd date,
	@ngaykt date,
	@masp char(11) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO khuyenmai VALUES (@makm, @ngaybd, @ngaykt,@masp)
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_select_all
go
CREATE PROCEDURE sp_khuyenmai_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from KHUYENMAI , HINHTHUCKM
	where KHUYENMAI.MAHT = HINHTHUCKM.MAHT
END
GO
exec sp_khuyenmai_select_all
exec sp_sanpham_select_all
﻿-- ================================================
-- Create Procedure sp_khuyenmai_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_select_one
go
CREATE PROCEDURE sp_khuyenmai_select_one
	-- Add the parameters for the stored procedure here
	@MAKM CHAR(11) ,
	@NGAYBD DATE ,
	@NGAYKT DATE,
	@MAHT char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from khuyenmai where MAKM = @MAKM --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_update
go
CREATE PROCEDURE sp_khuyenmai_update
	-- Add the parameters for the stored procedure here
	@makm char(11) = '', 
	@ngaybd date,
	@ngaykt date,
	@masp char(11) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update khuyenmai set ngaybd = @ngaybd, ngaykt = @ngaykt, masp = @masp  where makm = @makm -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_delete.sql
-- Nhà cung cấp delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- update date: 10-12-2023
-- =============================================
DROP PROCEDURE IF EXISTS sp_nhacungcap_delete
GO
CREATE PROCEDURE sp_nhacungcap_delete
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM nhacungcap WHERE MANCC = @MANCC
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- update date: 10-12-2023
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_nhacungcap_insert
go
CREATE PROCEDURE sp_nhacungcap_insert
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11),
	@TENNCC NVARCHAR(30) ,
	@DIACHINCC NVARCHAR(100),
	@SDTNCC INT   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO nhacungcap VALUES (@MANCC, @TENNCC, @DIACHINCC,@SDTNCC)
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_all.sql
-- Nhà cung cấp select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- update date: 10-12-2023
-- =============================================
drop procedure if exists sp_nhacungcap_select_all
go
CREATE PROCEDURE sp_nhacungcap_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from nhacungcap
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_one.sql
-- Nhà cung cấp select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- update date: 10-12-2023
-- =============================================
drop procedure if exists sp_nhacungcap_select_one
go
CREATE PROCEDURE sp_nhacungcap_select_one
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from nhacungcap where MANCC like @MANCC --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- update date: 10-12-2023
-- =============================================
drop procedure if exists sp_nhacungcap_update
go
CREATE PROCEDURE sp_nhacungcap_update
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11),
	@TENNCC NVARCHAR(30) ,
	@DIACHINCC NVARCHAR(100),
	@SDTNCC INT   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update nhacungcap set TENNCC = @TENNCC, DIACHINCC = @DIACHINCC,SDTNCC = @SDTNCC where MANCC = @MANCC -- chuẩn sql
END
GO
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023>
drop procedure if exists sp_cbo_phongban
go
CREATE PROCEDURE sp_cbo_phongban
	-- Add the parameters for the stored procedure here
	 
AS
BEGIN 
    -- Delete statements for procedure here
	Select MAPB, TENPHG FROM PHONGBAN
END;
go
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>

drop procedure if exists sp_nhanvien_delete
go
CREATE PROCEDURE sp_nhanvien_delete
	-- Add the parameters for the stored procedure here
	@manv char(11) 
AS
BEGIN 
    -- Delete statements for procedure here
	DELETE FROM nhanvien WHERE manv = @manv
END;
go 
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>
drop procedure if exists sp_nhanvien_insert
go
CREATE PROCEDURE sp_nhanvien_insert
	 
	-- Add the parameters for the stored procedure here
	@manv char(11),
	@hotennv nvarchar(30),
	@diachinv nvarchar(100),
	@luong float,
	@sdtnv int,
	@ngaysinh date,
	@mapb char(4),
	@gioitinh char(4)
AS
BEGIN 
    -- Insert statements for procedure here
	-- Đợi 50 milliseconds
	WAITFOR DELAY '00:00:00.050';
	INSERT INTO nhanvien(manv, hotennv, diachinv, luong, sdtnv, ngaysinh,mapb, gioitinh) 
	VALUES (@manv, @hotennv, @diachinv, @luong, @sdtnv, @ngaysinh,@mapb, @gioitinh);
END;
go
 

--exec sp_nhanvien_insert 'nv', 'hoang van dung', '222 dia chi ma', 3214232, 123123,'09-09-2000','pb01', 'nam'
--Select * from nhanvien order by created_date asc where gioitinh = 'nam';
 
﻿
-- Author:		Sok Kim Thanh
-- Create date: <10/12/2023 9:33 SA>

drop procedure if exists sp_nhanvien_search
go
CREATE PROCEDURE sp_nhanvien_search
	-- Add the parameters for the stored procedure here
	@keyword nvarchar(100)
	 
AS
BEGIN 
    -- Insert statements for procedure here
	SELECT * from nhanvien where HOTENNV like '%' + @keyword + '%'--like chính xác mã 100%
END;
go

--select * from nhanvien
--exec sp_nhanvien_search 'b' --test ok﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 10:57 CH>
drop procedure if exists sp_nhanvien_select_all_all
go
CREATE PROCEDURE sp_nhanvien_select_all_all
AS
BEGIN
    SELECT 
       
        NV.MANV AS NhanVienID,
        PB.MAPB AS PhongBanID,
        NV.HOTENNV AS 'Họ và tên',
        PB.TENPHG AS 'Tên phòng ban'
        
    FROM 
        NHANVIEN NV,
		PHONGBAN PB
    where NV.MAPB = PB.MAPB
	order by nv.created_date desc;
END;
go

 
﻿
-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>

drop procedure if exists sp_nhanvien_select_one
go
CREATE PROCEDURE sp_nhanvien_select_one
	-- Add the parameters for the stored procedure here
	@manv char(11)
	 
AS
BEGIN 
    -- Insert statements for procedure here
	SELECT * from nhanvien where MANV like @manv --like chính xác mã 100%
END;
go

﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>

drop procedure if exists sp_nhanvien_update
go
CREATE PROCEDURE sp_nhanvien_update
	-- Add the parameters for the stored procedure here
	@manv char(11),
	@hotennv nvarchar(30),
	@diachinv nvarchar(100),
	@luong float,
	@sdtnv int,
	@ngaysinh date,
	@mapb char(4),
	@gioitinh nvarchar(10)
AS
BEGIN 
    -- Insert statements for procedure here
	update nhanvien set hotennv = @hotennv, diachinv = @diachinv,luong=@luong,sdtnv=@sdtnv ,ngaysinh=@ngaysinh, mapb = @mapb, gioitinh = @gioitinh where manv = @manv-- chuẩn sql
END;
go
﻿-- ================================================
-- Create Procedure sp_PhongBan_select_all.sql
-- Nhân viên phongban all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vo tu
-- Create date: <10/11/2023>
-- Description:	<vo tu select all>
-- =============================================
drop procedure if exists sp_cbb_chinhanh_select
go
CREATE PROCEDURE sp_cbb_chinhanh_select
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from CHINHANH
END
GO
exec sp_cbb_chinhanh_select
﻿-- ================================================
-- Create Procedure sp_phongban_delete.sql
-- Nhân viên delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vo tu
-- Create date: <10/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_phongban_delete
GO
CREATE PROCEDURE sp_phongban_delete
	-- Add the parameters for the stored procedure here
	@maPB char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM PHONGBAN WHERE MAPB = @maPB
END
GO
﻿-- ================================================
-- Create Procedure sp_nhanvien_insert.sql
-- Nhân viên insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <10/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_phongban_insert
go
CREATE PROCEDURE sp_PhongBan_insert
	-- Add the parameters for the stored procedure here
	@maPB char(11),
	@tenPB nvarchar(30),
	@maCN nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO PHONGBAN VALUES (@maPB, @tenPB, @maCN)
END
GO
﻿-- ================================================
-- Create Procedure sp_PhongBan_select_all.sql
-- Nhân viên phongban all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vo tu
-- Create date: <10/11/2023>
-- Description:	<vo tu select all>
-- =============================================
drop procedure if exists sp_phongban_select_all
go
CREATE PROCEDURE sp_phongban_select_all
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT pb.MAPB, pb.TENPHG, cn.TENCN from PHONGBAN pb, CHINHANH cn
END
GO
exec sp_phongban_select_all
﻿-- ================================================
-- Create Procedure sp_nhanvien_update.sql
-- Nhân viên update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <10/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_phongban_update
go
CREATE PROCEDURE sp_phongban_update
	-- Add the parameters for the stored procedure here
		@maPB char(11),
	@tenPB nvarchar(30),
	@maCN nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update PHONGBAN set TENPHG = @tenPB, MACN = @maCN where MACN = @maCN -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_delete.sql
-- Sản phẩm delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_sanpham_delete
GO
CREATE PROCEDURE sp_sanpham_delete
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM sanpham WHERE MASP = @MASP
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_insert.sql
-- Sản phẩm insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_sanpham_insert
go
CREATE PROCEDURE sp_sanpham_insert
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11),
	@TENSP NVARCHAR(30) ,
	@DONVI NVARCHAR(30),
	@NSX DATE ,
	@HSD DATE ,
	@DONGIA INT ,
	@SLTONKHO INT, 
	@MALOAI CHAR(11), 
	@MANCC CHAR(11), 
	@MAKM char(11)
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO sanpham (MASP,TENSP,DONVI ,NSX  ,HSD  ,DONGIA  ,SLTONKHO , MALOAI , MANCC, MAKM ) 
	VALUES (@MASP,@TENSP,@DONVI ,@NSX  ,@HSD  ,@DONGIA  ,@SLTONKHO , @MALOAI , @MANCC, @MAKM )
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_select_all.SQL
-- Sản phẩm select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Sok Kim Thanh>
-- Create date: <07/11/2023>
-- Description:	<Sản phẩm select all>
-- =============================================
drop procedure if exists sp_sanpham_select_all
go
CREATE PROCEDURE sp_sanpham_select_all
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from sanpham
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_select_all.SQL
-- Sản phẩm select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Sok Kim Thanh>
-- Create date: <07/11/2023>
-- Description:	<Sản phẩm select all>
-- =============================================
drop procedure if exists sp_sanpham_select_all
go
CREATE PROCEDURE sp_sanpham_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from SanPham

	
	
END
GO
exec sp_sanpham_select_all
﻿-- ================================================
-- Create Procedure sp_sanpham_select_one.sql
-- Sản phẩm select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_sanpham_select_one
go
CREATE PROCEDURE sp_sanpham_select_one
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from sanpham where MASP like @MASP --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_update.sql
-- Sản phẩm update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_sanpham_update
go
CREATE PROCEDURE sp_sanpham_update
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11),
	@TENSP NVARCHAR(30) ,
	@DONVI NVARCHAR(30),
	@NSX DATE ,
	@HSD DATE ,
	@DONGIA INT ,
	@SLTONKHO INT, 
	@MALOAI CHAR(11), 
	@MANCC CHAR(11), 
	@MAKM char(11)
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update sanpham set TENSP = @TENSP, DONVI = @DONVI, NSX = @NSX,HSD = @HSD,DONGIA = @DONGIA,SLTONKHO = @SLTONKHO,MALOAI = @MALOAI,MANCC = @MANCC,MAKM = @MAKM where MASP = @MASP -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_chitiethoadon_delete
GO
CREATE PROCEDURE sp_chitiethoadon_delete
	-- Add the parameters for the stored procedure here
	@makm char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM chitiethoadon WHERE MASP = @makm
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_insert
go
CREATE PROCEDURE sp_chitiethoadon_insert
	-- Add the parameters for the stored procedure here
	@mahd char(11) = '', 
    @masp char(11) = '',
	@sl int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO CHITIETHD VALUES (@mahd, @masp, @sl)
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_select_all
go
CREATE PROCEDURE sp_chitiethoadon_select_all
	-- Add the parameters for the stored procedure here
	@makm char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT hd.MAHD,sp.TENSP,ct.SLMUA,sp.DONGIA*ct.SLMUA as "Thành Tiền"
	from CHITIETHD ct, HOADON hd, SANPHAM sp
	where ct.MAHD = hd.MAHD and sp.MASP = ct.MASP;
END
GO
exec sp_chitiethoadon_select_all "HD01"
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
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
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_TongTien
go
CREATE PROCEDURE sp_chitiethoadon_TongTien
	-- Add the parameters for the stored procedure here
	@makm char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	Declare  @TT int = 0;
	select @TT += ct.SLMUA * sp.DONGIA
	from CHITIETHD ct,HOADON hd,SANPHAM sp
	where ct.MAHD = hd.MAHD and sp.MASP = ct.MASP

	Update HOADON
	set TONGTHANHTIEN = @TT
	where MAHD = @makm;
END
GO
exec sp_chitiethoadon_TongTien 'HD01'
select * 
from HOADON
where MAHD='HD01'
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_update
go
CREATE PROCEDURE sp_hinhthuckm_update
	-- Add the parameters for the stored procedure here
	@mahd char(11) = '', 
	@masp char(11) = '',
	@sl int
	as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update CHITIETHD set SLMUA = @sl where MAHD = @mahd and  MASP = @masp -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_chitiethoadon_delete
GO
CREATE PROCEDURE sp_chitiethoadon_delete
	-- Add the parameters for the stored procedure here
	@mahd char(11) ,
	@masp char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM CHITIETHD WHERE MASP = @masp and MAHD = @mahd
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_insert
go
CREATE PROCEDURE sp_chitiethoadon_insert
	-- Add the parameters for the stored procedure here
	@mahd char(11),
	@masp char(11),
	@sl int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO CHITIETHD VALUES (@mahd, @masp, @sl)
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_select_all
go
CREATE PROCEDURE sp_chitiethoadon_select_all
	-- Add the parameters for the stored procedure here
	 @MAHD CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT sp.TENSP,ct.SLMUA, ct.SLMUA * sp.DONGIA as "Thành tiền"
	from CHITIETHD ct,HOADON hd,SANPHAM sp 
	where ct.MAHD = hd.MAHD and ct.MASP=sp.MASP and ct.MAHD = @MAHD

END
GO
exec sp_chitiethoadon_select_all 'HD01'
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_update
go
CREATE PROCEDURE sp_chitiethoadon_update
	-- Add the parameters for the stored procedure here
	@mahd char(11) = '', 
	@masp char(11) = '', 
	@SLmua int
	as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update CHITIETHD set SLMUA = @SLmua where MAHD = @mahd and MASP = @masp -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_danhmuc_delete
GO
CREATE PROCEDURE sp_danhmuc_delete
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM LOAISP WHERE MALOAI = @MALOAI
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_insert
go
CREATE PROCEDURE sp_danhmuc_insert
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11) ,
	@TENLOAI NVARCHAR(30),
	@GHICHU NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO LOAISP VALUES (@MALOAI, @TENLOAI, @GHICHU)
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_select_all
go
CREATE PROCEDURE sp_danhmuc_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from LOAISP
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_select_one
go
CREATE PROCEDURE sp_danhmuc_select_one
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from LOAISP where MALOAI like @MALOAI --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_update
go
CREATE PROCEDURE sp_danhmuc_update
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11),
	@TENLOAI NVARCHAR(30),
	@GHICHU NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update LOAISP set TENLOAI = @TENLOAI, GHICHU = @GHICHU where MALOAI = @MALOAI -- chuẩn sql
END
GO
﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_diadiem_delete
GO
CREATE PROCEDURE sp_diadiem_delete
	-- Add the parameters for the stored procedure here
	@maCN char(4) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM CHINHANH WHERE MACN = @maCN
END
GO
﻿-- ================================================
-- Create Procedure sp_diadiem_insert.sql
-- Nhà cung cấp insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
set dateformat dmy
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_diadiem_insert
go
CREATE PROCEDURE sp_diadiem_insert
	-- Add the parameters for the stored procedure here
	@maCN char(4) = '',
	@tenCN nvarchar(30),
	@diaChi nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO CHINHANH VALUES (@maCN,@tenCN,@diaChi)
END
GO
exec sp_diadiem_insert 'CN05', N'Chi nhánh Đà Nẵng', N'Số 3 Nguyễn Văn Linh, Hải Châu, Đà Nẵng';

select * from CHINHANH

﻿set dateformat dmy
-- ================================================
-- Create Procedure sp_diadiem_select_all.sql
-- hoadon select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<dia diem select all>
-- =============================================
drop procedure if exists sp_diadiem_select_all
go
CREATE PROCEDURE sp_diadiem_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 

    -- Insert statements for procedure here
	SELECT * from CHINHANH
END
GO
exec sp_diadiem_select_all
﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_diaiem_update
go
CREATE PROCEDURE sp_diadiem_update
	-- Add the parameters for the stored procedure here
@maCN char(4) = '',
	@tenCN nvarchar(30),
	@diaChi nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update CHINHANH set TENCN = @tenCN, DIACHICN = @diaChi  where MACN = @maCN -- chuẩn sql
END
GO
--exec sp_diadiem_update 'CN05', N'Chi nhánh Bình Phước', N'Số 3 Nguyễn Văn Linh, Hải Châu, Đà Nẵng';
select * from CHINHANH﻿-- ================================================
-- Create Procedure sp_hinhthuckm_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_hinhthuckm_delete
GO
CREATE PROCEDURE sp_hinhthuckm_delete
	-- Add the parameters for the stored procedure here
	@makm char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM hinhthuckm WHERE MAHT = @makm
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_insert
go
CREATE PROCEDURE sp_hinhthuckm_insert
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
	INSERT INTO hinhthuckm VALUES (@makm, @hinhthuc, @ghichu)
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_select_all
go
CREATE PROCEDURE sp_hinhthuckm_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from hinhthuckm
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_select_one
go
CREATE PROCEDURE sp_hinhthuckm_select_one
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
	SELECT * from hinhthuckm where makm = @makm --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_update
go
CREATE PROCEDURE sp_hinhthuckm_update
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
	update hinhthuckm set TENHINHTHUC = @hinhthuc, ghichu = @ghichu  where MAHT = @makm -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_all.sql
-- Nhà cung cấp select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Nhà cung cấp select all>
-- =============================================
drop procedure if exists sp_cbb_khachhang_select_all
go
CREATE PROCEDURE sp_cbb_khachhang_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT kh.MAKH, kh.HOTENKH from KHACHHANG kh
END
GO
exec sp_cbb_khachhang_select_all






-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
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
drop procedure if exists sp_khachhang_update
go
CREATE PROCEDURE sp_khachhang_update
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

    -- Insert statements for procedure here
	update KHACHHANG set HOTENKH = @tenKH,SDTKH = @sdtKH, DIEMTL = @diemTL where MAKH = @maKH -- chuẩn sql
END
GO



-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
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
drop procedure if exists sp_nhacungcap_insert
go
CREATE PROCEDURE sp_khachhang_insert
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

    -- Insert statements for procedure here
	INSERT INTO KHACHHANG VALUES (@maKH, @tenKH, @sdtKH,@diemTL)
END
GO

-- ================================================
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
	@maKH char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM KHACHHANG WHERE MAKH = @maKH
END
GO

﻿set dateformat dmy
-- ================================================
-- Create Procedure sp_nhanvien_select_all.sql
-- nhan vien select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<nhan vien select all>
-- =============================================
drop procedure if exists sp_nhanvien_select_all
go
CREATE PROCEDURE sp_nhanvien_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 

    -- Insert statements for procedure here
	SELECT nv.MANV,nv.HOTENNV from NHANVIEN nv
END
GO
exec sp_nhanvien_select_all






-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
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
drop procedure if exists sp_hoadon_update
go
CREATE PROCEDURE sp_hoadon_update
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update HOADON set NGAYHOADON = @ngayHD, TONGTHANHTIEN = @tongTien, MANV = @maNV, MAKH =@maKH where MAHD = @maHD -- chuẩn sql
END
GO
--exec sp_hoadon_update'HD03','15/01/2022', 90000,'NV02', 'KH02'


-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
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
drop procedure if exists sp_hoadon_insert
go
CREATE PROCEDURE sp_hoadon_insert
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO HOADON VALUES (@maHD, @ngayHD, @tongTien,@maNV,@maKH)
END
GO
--exec sp_hoadon_insert 'HD03','15/01/2022', 90000,'NV02', 'KH02'

-- ================================================
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
DROP PROCEDURE IF EXISTS sp_hoadon_delete
GO
CREATE PROCEDURE sp_hoadon_delete
	-- Add the parameters for the stored procedure here
	@maHD char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM HOADON WHERE MAHD = @maHD
END
GO

﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_hoadon_delete
GO
CREATE PROCEDURE sp_hoadon_delete
	-- Add the parameters for the stored procedure here
	@maHD char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Delete statements for procedure here
	DELETE FROM HOADON WHERE MAHD = @maHD
	DELETE FROM CHITIETHD WHERE MAHD = @maHD
end
﻿-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
set dateformat dmy
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hoadon_insert
go
CREATE PROCEDURE sp_hoadon_insert
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO HOADON VALUES (@maHD, @ngayHD, @tongTien,@maNV,@maKH)
END
GO
exec sp_hoadon_insert 'HD03','15/01/2022', 90000,'NV02', 'KH02'

select * from NHANVIEN

﻿set dateformat dmy
-- ================================================
-- Create Procedure sp_hoadon_select_all.sql
-- hoadon select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Hóa đơn select all>
-- =============================================
drop procedure if exists sp_hoadon_select_all
go
CREATE PROCEDURE sp_hoadon_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 

    -- Insert statements for procedure here
	SELECT hd.MAHD, hd.NGAYHOADON, hd.TONGTHANHTIEN , nv.HOTENNV, kh.HOTENKH from HOADON hd, NHANVIEN nv, KHACHHANG kh
	where hd.MANV = nv.MANV and hd.MAKH = kh.MAKH
END
GO
exec sp_hoadon_select_all


﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_one.sql
-- Nhà cung cấp select one
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
drop procedure if exists sp_hoadon_select_one
go
CREATE PROCEDURE sp_hoadon_select_one
	-- Add the parameters for the stored procedure here
	@maHD char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT * from HOADON where MAHD  = @maHD --like chính xác mã 100%
END
GO
﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hoadon_update
go
CREATE PROCEDURE sp_hoadon_update
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update HOADON set NGAYHOADON = @ngayHD, TONGTHANHTIEN = @tongTien, MANV = @maNV, MAKH =@maKH where MAHD = @maHD -- chuẩn sql
END
GO
exec sp_hoadon_update'HD03','15/01/2022', 90000,'NV02', 'KH02'﻿-- ================================================
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
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM KHACHHANG WHERE MAKH = @maKH
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
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
drop procedure if exists sp_khachhang_insert
go
CREATE PROCEDURE sp_khachhang_insert
	-- Add the parameters for the stored procedure here
	@maKH char(11),
	@tenKH nvarchar(30),
	@sdtKH int = 0,
	@diemTL int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO KHACHHANG VALUES (@maKH, @tenKH, @sdtKH,@diemTL)
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_all.sql
-- Nhà cung cấp select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Nhà cung cấp select all>
-- =============================================
drop procedure if exists sp_khachhang_select_all
go
CREATE PROCEDURE sp_khachhang_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from KHACHHANG
END
GO
exec sp_khachhang_select_all



﻿-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
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
drop procedure if exists sp_khachhang_update
go
CREATE PROCEDURE sp_khachhang_update
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

    -- Insert statements for procedure here
	update KHACHHANG set HOTENKH = @tenKH,SDTKH = @sdtKH, DIEMTL = @diemTL where MAKH = @maKH -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_one.sql
-- Nhà cung cấp select one
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
drop procedure if exists sp_khachhang_select_one
go
CREATE PROCEDURE sp_khachhang_select_one
	-- Add the parameters for the stored procedure here
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT * from KHACHHANG where  MAKH = @maKH --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_cbo_hinhthuckm
go
CREATE PROCEDURE sp_cbo_hinhthuckm
	-- Add the parameters for the stored procedure here
	--@makm char(11) = '', 
	--@hinhthuc nvarchar(50) = N'',
	--@ghichu nvarchar(100) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MAKM from hinhthuckm-- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_khuyenmai_delete
GO
CREATE PROCEDURE sp_khuyenmai_delete
	-- Add the parameters for the stored procedure here
	@makm char(11) = '', 
	@ngaybd date,
	@ngaykt date,
	@masp char(11) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM khuyenmai WHERE makm = @makm
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_insert
go
CREATE PROCEDURE sp_khuyenmai_insert
	-- Add the parameters for the stored procedure here
	@makm char(11) = '', 
	@ngaybd date,
	@ngaykt date,
	@masp char(11) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO khuyenmai VALUES (@makm, @ngaybd, @ngaykt,@masp)
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_select_all
go
CREATE PROCEDURE sp_khuyenmai_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from KHUYENMAI , HINHTHUCKM
	where KHUYENMAI.MAHT = HINHTHUCKM.MAHT
END
GO
exec sp_khuyenmai_select_all
exec sp_sanpham_select_all
﻿-- ================================================
-- Create Procedure sp_khuyenmai_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_select_one
go
CREATE PROCEDURE sp_khuyenmai_select_one
	-- Add the parameters for the stored procedure here
	@MAKM CHAR(11) ,
	@NGAYBD DATE ,
	@NGAYKT DATE,
	@MAHT char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from khuyenmai where MAKM = @MAKM --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_update
go
CREATE PROCEDURE sp_khuyenmai_update
	-- Add the parameters for the stored procedure here
	@makm char(11) = '', 
	@ngaybd date,
	@ngaykt date,
	@masp char(11) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update khuyenmai set ngaybd = @ngaybd, ngaykt = @ngaykt, masp = @masp  where makm = @makm -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_delete.sql
-- Nhà cung cấp delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- update date: 10-12-2023
-- =============================================
DROP PROCEDURE IF EXISTS sp_nhacungcap_delete
GO
CREATE PROCEDURE sp_nhacungcap_delete
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM nhacungcap WHERE MANCC = @MANCC
END
GO
﻿-- ================================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- update date: 10-12-2023
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert 
-- =============================================
drop procedure if exists sp_nhacungcap_insert
go
CREATE PROCEDURE sp_nhacungcap_insert
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11),
	@TENNCC NVARCHAR(30) ,
	@DIACHINCC NVARCHAR(100),
	@SDTNCC INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO NHACUNGCAP(MANCC,TENNCC,DIACHINCC,SDTNCC) VALUES (@MANCC, @TENNCC, @DIACHINCC,@SDTNCC)
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_all.sql
-- Nhà cung cấp select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- update date: 10-12-2023
-- =============================================
drop procedure if exists sp_nhacungcap_select_all
go
CREATE PROCEDURE sp_nhacungcap_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from nhacungcap order by created_date desc
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_one.sql
-- Nhà cung cấp select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- update date: 10-12-2023
-- =============================================
drop procedure if exists sp_nhacungcap_select_one
go
CREATE PROCEDURE sp_nhacungcap_select_one
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from nhacungcap where MANCC like @MANCC --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- update date: 10-12-2023
-- =============================================
drop procedure if exists sp_nhacungcap_update
go
CREATE PROCEDURE sp_nhacungcap_update
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11),
	@TENNCC NVARCHAR(30) ,
	@DIACHINCC NVARCHAR(100),
	@SDTNCC INT   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update nhacungcap set TENNCC = @TENNCC, DIACHINCC = @DIACHINCC,SDTNCC = @SDTNCC where MANCC = @MANCC -- chuẩn sql
END
GO
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023>
drop procedure if exists sp_cbo_phongban
go
CREATE PROCEDURE sp_cbo_phongban
	-- Add the parameters for the stored procedure here
	 
AS
BEGIN 
    -- Delete statements for procedure here
	Select MAPB, TENPHG FROM PHONGBAN
END;
go
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>

drop procedure if exists sp_nhanvien_delete
go
CREATE PROCEDURE sp_nhanvien_delete
	-- Add the parameters for the stored procedure here
	@manv char(11) 
AS
BEGIN 
    -- Delete statements for procedure here
	DELETE FROM nhanvien WHERE manv = @manv
END;
go 
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>
drop procedure if exists sp_nhanvien_insert
go
CREATE PROCEDURE sp_nhanvien_insert
	 
	-- Add the parameters for the stored procedure here
	@manv char(11),
	@hotennv nvarchar(30),
	@diachinv nvarchar(100),
	@luong float,
	@sdtnv int,
	@ngaysinh date,
	@mapb char(4),
	@gioitinh char(4)
AS
BEGIN 
    -- Insert statements for procedure here
	-- Đợi 50 milliseconds
	WAITFOR DELAY '00:00:00.050';
	INSERT INTO nhanvien(manv, hotennv, diachinv, luong, sdtnv, ngaysinh,mapb, gioitinh) 
	VALUES (@manv, @hotennv, @diachinv, @luong, @sdtnv, @ngaysinh,@mapb, @gioitinh);
END;
go
 

--exec sp_nhanvien_insert 'nv', 'hoang van dung', '222 dia chi ma', 3214232, 123123,'09-09-2000','pb01', 'nam'
--Select * from nhanvien order by created_date asc where gioitinh = 'nam';
 
﻿
-- Author:		Sok Kim Thanh
-- Create date: <10/12/2023 9:33 SA>

drop procedure if exists sp_nhanvien_search
go
CREATE PROCEDURE sp_nhanvien_search
	-- Add the parameters for the stored procedure here
	@keyword nvarchar(100)
	 
AS
BEGIN 
    -- Insert statements for procedure here
	SELECT * from nhanvien where HOTENNV like '%' + @keyword + '%'--like chính xác mã 100%
END;
go

--select * from nhanvien
--exec sp_nhanvien_search 'b' --test ok﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 10:57 CH>
drop procedure if exists sp_nhanvien_select_all_all
go
CREATE PROCEDURE sp_nhanvien_select_all_all
AS
BEGIN
    SELECT 
       
        NV.MANV AS NhanVienID,
        PB.MAPB AS PhongBanID,
        NV.HOTENNV AS 'Họ và tên',
        PB.TENPHG AS 'Tên phòng ban'
        
    FROM 
        NHANVIEN NV,
		PHONGBAN PB
    where NV.MAPB = PB.MAPB
	order by nv.created_date desc;
END;
go

 
﻿
-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>

drop procedure if exists sp_nhanvien_select_one
go
CREATE PROCEDURE sp_nhanvien_select_one
	-- Add the parameters for the stored procedure here
	@manv char(11)
	 
AS
BEGIN 
    -- Insert statements for procedure here
	SELECT * from nhanvien where MANV like @manv --like chính xác mã 100%
END;
go

﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>

drop procedure if exists sp_nhanvien_update
go
CREATE PROCEDURE sp_nhanvien_update
	-- Add the parameters for the stored procedure here
	@manv char(11),
	@hotennv nvarchar(30),
	@diachinv nvarchar(100),
	@luong float,
	@sdtnv int,
	@ngaysinh date,
	@mapb char(4),
	@gioitinh nvarchar(10)
AS
BEGIN 
    -- Insert statements for procedure here
	update nhanvien set hotennv = @hotennv, diachinv = @diachinv,luong=@luong,sdtnv=@sdtnv ,ngaysinh=@ngaysinh, mapb = @mapb, gioitinh = @gioitinh where manv = @manv-- chuẩn sql
END;
go
﻿-- ================================================
-- Create Procedure sp_PhongBan_select_all.sql
-- Nhân viên phongban all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vo tu
-- Create date: <10/11/2023>
-- Description:	<vo tu select all>
-- =============================================
drop procedure if exists sp_cbb_chinhanh_select
go
CREATE PROCEDURE sp_cbb_chinhanh_select
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from CHINHANH
END
GO
exec sp_cbb_chinhanh_select
﻿-- ================================================
-- Create Procedure sp_phongban_delete.sql
-- Nhân viên delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vo tu
-- Create date: <10/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_phongban_delete
GO
CREATE PROCEDURE sp_phongban_delete
	-- Add the parameters for the stored procedure here
	@maPB char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM PHONGBAN WHERE MAPB = @maPB
END
GO
﻿-- ================================================
-- Create Procedure sp_nhanvien_insert.sql
-- Nhân viên insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <10/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_phongban_insert
go
CREATE PROCEDURE sp_PhongBan_insert
	-- Add the parameters for the stored procedure here
	@maPB char(11),
	@tenPB nvarchar(30),
	@maCN nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO PHONGBAN VALUES (@maPB, @tenPB, @maCN)
END
GO
﻿-- ================================================
-- Create Procedure sp_PhongBan_select_all.sql
-- Nhân viên phongban all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vo tu
-- Create date: <10/11/2023>
-- Description:	<vo tu select all>
-- =============================================
drop procedure if exists sp_phongban_select_all
go
CREATE PROCEDURE sp_phongban_select_all
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT pb.MAPB, pb.TENPHG, cn.TENCN from PHONGBAN pb, CHINHANH cn
END
GO
exec sp_phongban_select_all
﻿-- ================================================
-- Create Procedure sp_nhanvien_update.sql
-- Nhân viên update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <10/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_phongban_update
go
CREATE PROCEDURE sp_phongban_update
	-- Add the parameters for the stored procedure here
		@maPB char(11),
	@tenPB nvarchar(30),
	@maCN nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update PHONGBAN set TENPHG = @tenPB, MACN = @maCN where MACN = @maCN -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_delete.sql
-- Sản phẩm delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_sanpham_delete
GO
CREATE PROCEDURE sp_sanpham_delete
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM sanpham WHERE MASP = @MASP
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_insert.sql
-- Sản phẩm insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_sanpham_insert
go
CREATE PROCEDURE sp_sanpham_insert
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11),
	@TENSP NVARCHAR(30) ,
	@DONVI NVARCHAR(30),
	@NSX DATE ,
	@HSD DATE ,
	@DONGIA INT ,
	@SLTONKHO INT, 
	@MALOAI CHAR(11), 
	@MANCC CHAR(11), 
	@MAKM char(11)
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO sanpham (MASP,TENSP,DONVI ,NSX  ,HSD  ,DONGIA  ,SLTONKHO , MALOAI , MANCC, MAKM ) 
	VALUES (@MASP,@TENSP,@DONVI ,@NSX  ,@HSD  ,@DONGIA  ,@SLTONKHO , @MALOAI , @MANCC, @MAKM )
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_select_all.SQL
-- Sản phẩm select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Sok Kim Thanh>
-- Create date: <07/11/2023>
-- Description:	<Sản phẩm select all>
-- =============================================
drop procedure if exists sp_sanpham_select_all
go
CREATE PROCEDURE sp_sanpham_select_all
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from sanpham
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_select_all.SQL
-- Sản phẩm select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Sok Kim Thanh>
-- Create date: <07/11/2023>
-- Description:	<Sản phẩm select all>
-- =============================================
drop procedure if exists sp_sanpham_select_all
go
CREATE PROCEDURE sp_sanpham_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from SanPham

	
	
END
GO
exec sp_sanpham_select_all
﻿-- ================================================
-- Create Procedure sp_sanpham_select_one.sql
-- Sản phẩm select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_sanpham_select_one
go
CREATE PROCEDURE sp_sanpham_select_one
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from sanpham where MASP like @MASP --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_update.sql
-- Sản phẩm update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_sanpham_update
go
CREATE PROCEDURE sp_sanpham_update
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11),
	@TENSP NVARCHAR(30) ,
	@DONVI NVARCHAR(30),
	@NSX DATE ,
	@HSD DATE ,
	@DONGIA INT ,
	@SLTONKHO INT, 
	@MALOAI CHAR(11), 
	@MANCC CHAR(11), 
	@MAKM char(11)
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update sanpham set TENSP = @TENSP, DONVI = @DONVI, NSX = @NSX,HSD = @HSD,DONGIA = @DONGIA,SLTONKHO = @SLTONKHO,MALOAI = @MALOAI,MANCC = @MANCC,MAKM = @MAKM where MASP = @MASP -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_chitiethoadon_delete
GO
CREATE PROCEDURE sp_chitiethoadon_delete
	-- Add the parameters for the stored procedure here
	@makm char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM chitiethoadon WHERE MASP = @makm
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_insert
go
CREATE PROCEDURE sp_chitiethoadon_insert
	-- Add the parameters for the stored procedure here
	@mahd char(11) = '', 
    @masp char(11) = '',
	@sl int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO CHITIETHD VALUES (@mahd, @masp, @sl)
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_select_all
go
CREATE PROCEDURE sp_chitiethoadon_select_all
	-- Add the parameters for the stored procedure here
	@makm char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT hd.MAHD,sp.TENSP,ct.SLMUA,sp.DONGIA*ct.SLMUA as "Thành Tiền"
	from CHITIETHD ct, HOADON hd, SANPHAM sp
	where ct.MAHD = hd.MAHD and sp.MASP = ct.MASP;
END
GO
exec sp_chitiethoadon_select_all "HD01"
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
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
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_TongTien
go
CREATE PROCEDURE sp_chitiethoadon_TongTien
	-- Add the parameters for the stored procedure here
	@makm char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	Declare  @TT int = 0;
	select @TT += ct.SLMUA * sp.DONGIA
	from CHITIETHD ct,HOADON hd,SANPHAM sp
	where ct.MAHD = hd.MAHD and sp.MASP = ct.MASP

	Update HOADON
	set TONGTHANHTIEN = @TT
	where MAHD = @makm;
END
GO
exec sp_chitiethoadon_TongTien 'HD01'
select * 
from HOADON
where MAHD='HD01'
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_update
go
CREATE PROCEDURE sp_hinhthuckm_update
	-- Add the parameters for the stored procedure here
	@mahd char(11) = '', 
	@masp char(11) = '',
	@sl int
	as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update CHITIETHD set SLMUA = @sl where MAHD = @mahd and  MASP = @masp -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_chitiethoadon_delete
GO
CREATE PROCEDURE sp_chitiethoadon_delete
	-- Add the parameters for the stored procedure here
	@mahd char(11) ,
	@masp char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM CHITIETHD WHERE MASP = @masp and MAHD = @mahd
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_insert
go
CREATE PROCEDURE sp_chitiethoadon_insert
	-- Add the parameters for the stored procedure here
	@mahd char(11),
	@masp char(11),
	@sl int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO CHITIETHD VALUES (@mahd, @masp, @sl)
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_select_all
go
CREATE PROCEDURE sp_chitiethoadon_select_all
	-- Add the parameters for the stored procedure here
	 @MAHD CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT sp.TENSP,ct.SLMUA, ct.SLMUA * sp.DONGIA as "Thành tiền"
	from CHITIETHD ct,HOADON hd,SANPHAM sp 
	where ct.MAHD = hd.MAHD and ct.MASP=sp.MASP and ct.MAHD = @MAHD

END
GO
exec sp_chitiethoadon_select_all 'HD01'
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_update
go
CREATE PROCEDURE sp_chitiethoadon_update
	-- Add the parameters for the stored procedure here
	@mahd char(11) = '', 
	@masp char(11) = '', 
	@SLmua int
	as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update CHITIETHD set SLMUA = @SLmua where MAHD = @mahd and MASP = @masp -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_danhmuc_delete
GO
CREATE PROCEDURE sp_danhmuc_delete
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM LOAISP WHERE MALOAI = @MALOAI
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_insert
go
CREATE PROCEDURE sp_danhmuc_insert
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11) ,
	@TENLOAI NVARCHAR(30),
	@GHICHU NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO LOAISP VALUES (@MALOAI, @TENLOAI, @GHICHU)
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_select_all
go
CREATE PROCEDURE sp_danhmuc_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from LOAISP
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_select_one
go
CREATE PROCEDURE sp_danhmuc_select_one
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from LOAISP where MALOAI like @MALOAI --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_update
go
CREATE PROCEDURE sp_danhmuc_update
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11),
	@TENLOAI NVARCHAR(30),
	@GHICHU NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update LOAISP set TENLOAI = @TENLOAI, GHICHU = @GHICHU where MALOAI = @MALOAI -- chuẩn sql
END
GO
﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_diadiem_delete
GO
CREATE PROCEDURE sp_diadiem_delete
	-- Add the parameters for the stored procedure here
	@maCN char(4) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM CHINHANH WHERE MACN = @maCN
END
GO
﻿-- ================================================
-- Create Procedure sp_diadiem_insert.sql
-- Nhà cung cấp insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
set dateformat dmy
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_diadiem_insert
go
CREATE PROCEDURE sp_diadiem_insert
	-- Add the parameters for the stored procedure here
	@maCN char(4) = '',
	@tenCN nvarchar(30),
	@diaChi nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO CHINHANH VALUES (@maCN,@tenCN,@diaChi)
END
GO
exec sp_diadiem_insert 'CN05', N'Chi nhánh Đà Nẵng', N'Số 3 Nguyễn Văn Linh, Hải Châu, Đà Nẵng';

select * from CHINHANH

﻿set dateformat dmy
-- ================================================
-- Create Procedure sp_diadiem_select_all.sql
-- hoadon select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<dia diem select all>
-- =============================================
drop procedure if exists sp_diadiem_select_all
go
CREATE PROCEDURE sp_diadiem_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 

    -- Insert statements for procedure here
	SELECT * from CHINHANH
END
GO
exec sp_diadiem_select_all
﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_diaiem_update
go
CREATE PROCEDURE sp_diadiem_update
	-- Add the parameters for the stored procedure here
@maCN char(4) = '',
	@tenCN nvarchar(30),
	@diaChi nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update CHINHANH set TENCN = @tenCN, DIACHICN = @diaChi  where MACN = @maCN -- chuẩn sql
END
GO
--exec sp_diadiem_update 'CN05', N'Chi nhánh Bình Phước', N'Số 3 Nguyễn Văn Linh, Hải Châu, Đà Nẵng';
select * from CHINHANH﻿-- ================================================
-- Create Procedure sp_hinhthuckm_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_hinhthuckm_delete
GO
CREATE PROCEDURE sp_hinhthuckm_delete
	-- Add the parameters for the stored procedure here
	@makm char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM hinhthuckm WHERE MAHT = @makm
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_insert
go
CREATE PROCEDURE sp_hinhthuckm_insert
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
	INSERT INTO hinhthuckm VALUES (@makm, @hinhthuc, @ghichu)
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_select_all
go
CREATE PROCEDURE sp_hinhthuckm_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from hinhthuckm
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_select_one
go
CREATE PROCEDURE sp_hinhthuckm_select_one
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
	SELECT * from hinhthuckm where makm = @makm --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_update
go
CREATE PROCEDURE sp_hinhthuckm_update
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
	update hinhthuckm set TENHINHTHUC = @hinhthuc, ghichu = @ghichu  where MAHT = @makm -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_all.sql
-- Nhà cung cấp select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Nhà cung cấp select all>
-- =============================================
drop procedure if exists sp_cbb_khachhang_select_all
go
CREATE PROCEDURE sp_cbb_khachhang_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT kh.MAKH, kh.HOTENKH from KHACHHANG kh
END
GO
exec sp_cbb_khachhang_select_all






-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
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
drop procedure if exists sp_khachhang_update
go
CREATE PROCEDURE sp_khachhang_update
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

    -- Insert statements for procedure here
	update KHACHHANG set HOTENKH = @tenKH,SDTKH = @sdtKH, DIEMTL = @diemTL where MAKH = @maKH -- chuẩn sql
END
GO



-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
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
drop procedure if exists sp_nhacungcap_insert
go
CREATE PROCEDURE sp_khachhang_insert
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

    -- Insert statements for procedure here
	INSERT INTO KHACHHANG VALUES (@maKH, @tenKH, @sdtKH,@diemTL)
END
GO

-- ================================================
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
	@maKH char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM KHACHHANG WHERE MAKH = @maKH
END
GO

﻿set dateformat dmy
-- ================================================
-- Create Procedure sp_nhanvien_select_all.sql
-- nhan vien select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<nhan vien select all>
-- =============================================
drop procedure if exists sp_nhanvien_select_all
go
CREATE PROCEDURE sp_nhanvien_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 

    -- Insert statements for procedure here
	SELECT nv.MANV,nv.HOTENNV from NHANVIEN nv
END
GO
exec sp_nhanvien_select_all






-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
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
drop procedure if exists sp_hoadon_update
go
CREATE PROCEDURE sp_hoadon_update
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update HOADON set NGAYHOADON = @ngayHD, TONGTHANHTIEN = @tongTien, MANV = @maNV, MAKH =@maKH where MAHD = @maHD -- chuẩn sql
END
GO
--exec sp_hoadon_update'HD03','15/01/2022', 90000,'NV02', 'KH02'


-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
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
drop procedure if exists sp_hoadon_insert
go
CREATE PROCEDURE sp_hoadon_insert
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO HOADON VALUES (@maHD, @ngayHD, @tongTien,@maNV,@maKH)
END
GO
--exec sp_hoadon_insert 'HD03','15/01/2022', 90000,'NV02', 'KH02'

-- ================================================
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
DROP PROCEDURE IF EXISTS sp_hoadon_delete
GO
CREATE PROCEDURE sp_hoadon_delete
	-- Add the parameters for the stored procedure here
	@maHD char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM HOADON WHERE MAHD = @maHD
END
GO

﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_hoadon_delete
GO
CREATE PROCEDURE sp_hoadon_delete
	-- Add the parameters for the stored procedure here
	@maHD char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Delete statements for procedure here
	DELETE FROM HOADON WHERE MAHD = @maHD
	DELETE FROM CHITIETHD WHERE MAHD = @maHD
end
﻿-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
set dateformat dmy
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hoadon_insert
go
CREATE PROCEDURE sp_hoadon_insert
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO HOADON VALUES (@maHD, @ngayHD, @tongTien,@maNV,@maKH)
END
GO
exec sp_hoadon_insert 'HD03','15/01/2022', 90000,'NV02', 'KH02'

select * from NHANVIEN

﻿set dateformat dmy
-- ================================================
-- Create Procedure sp_hoadon_select_all.sql
-- hoadon select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Hóa đơn select all>
-- =============================================
drop procedure if exists sp_hoadon_select_all
go
CREATE PROCEDURE sp_hoadon_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 

    -- Insert statements for procedure here
	SELECT hd.MAHD, hd.NGAYHOADON, hd.TONGTHANHTIEN , nv.HOTENNV, kh.HOTENKH from HOADON hd, NHANVIEN nv, KHACHHANG kh
	where hd.MANV = nv.MANV and hd.MAKH = kh.MAKH
END
GO
exec sp_hoadon_select_all


﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_one.sql
-- Nhà cung cấp select one
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
drop procedure if exists sp_hoadon_select_one
go
CREATE PROCEDURE sp_hoadon_select_one
	-- Add the parameters for the stored procedure here
	@maHD char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT * from HOADON where MAHD  = @maHD --like chính xác mã 100%
END
GO
﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hoadon_update
go
CREATE PROCEDURE sp_hoadon_update
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update HOADON set NGAYHOADON = @ngayHD, TONGTHANHTIEN = @tongTien, MANV = @maNV, MAKH =@maKH where MAHD = @maHD -- chuẩn sql
END
GO
exec sp_hoadon_update'HD03','15/01/2022', 90000,'NV02', 'KH02'﻿-- ================================================
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
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM KHACHHANG WHERE MAKH = @maKH
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
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
drop procedure if exists sp_khachhang_insert
go
CREATE PROCEDURE sp_khachhang_insert
	-- Add the parameters for the stored procedure here
	@maKH char(11),
	@tenKH nvarchar(30),
	@sdtKH int = 0,
	@diemTL int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO KHACHHANG VALUES (@maKH, @tenKH, @sdtKH,@diemTL)
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_all.sql
-- Nhà cung cấp select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Nhà cung cấp select all>
-- =============================================
drop procedure if exists sp_khachhang_select_all
go
CREATE PROCEDURE sp_khachhang_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from KHACHHANG
END
GO
exec sp_khachhang_select_all



﻿-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
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
drop procedure if exists sp_khachhang_update
go
CREATE PROCEDURE sp_khachhang_update
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

    -- Insert statements for procedure here
	update KHACHHANG set HOTENKH = @tenKH,SDTKH = @sdtKH, DIEMTL = @diemTL where MAKH = @maKH -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_one.sql
-- Nhà cung cấp select one
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
drop procedure if exists sp_khachhang_select_one
go
CREATE PROCEDURE sp_khachhang_select_one
	-- Add the parameters for the stored procedure here
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT * from KHACHHANG where  MAKH = @maKH --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_cbo_hinhthuckm
go
CREATE PROCEDURE sp_cbo_hinhthuckm
	-- Add the parameters for the stored procedure here
	--@makm char(11) = '', 
	--@hinhthuc nvarchar(50) = N'',
	--@ghichu nvarchar(100) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MAKM from hinhthuckm-- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_khuyenmai_delete
GO
CREATE PROCEDURE sp_khuyenmai_delete
	-- Add the parameters for the stored procedure here
	@makm char(11) = '', 
	@ngaybd date,
	@ngaykt date,
	@masp char(11) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM khuyenmai WHERE makm = @makm
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_insert
go
CREATE PROCEDURE sp_khuyenmai_insert
	-- Add the parameters for the stored procedure here
	@makm char(11) = '', 
	@ngaybd date,
	@ngaykt date,
	@masp char(11) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO khuyenmai VALUES (@makm, @ngaybd, @ngaykt,@masp)
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_select_all
go
CREATE PROCEDURE sp_khuyenmai_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from KHUYENMAI , HINHTHUCKM
	where KHUYENMAI.MAHT = HINHTHUCKM.MAHT
END
GO
exec sp_khuyenmai_select_all
exec sp_sanpham_select_all
﻿-- ================================================
-- Create Procedure sp_khuyenmai_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_select_one
go
CREATE PROCEDURE sp_khuyenmai_select_one
	-- Add the parameters for the stored procedure here
	@MAKM CHAR(11) ,
	@NGAYBD DATE ,
	@NGAYKT DATE,
	@MAHT char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from khuyenmai where MAKM = @MAKM --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_update
go
CREATE PROCEDURE sp_khuyenmai_update
	-- Add the parameters for the stored procedure here
	@makm char(11) = '', 
	@ngaybd date,
	@ngaykt date,
	@masp char(11) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update khuyenmai set ngaybd = @ngaybd, ngaykt = @ngaykt, masp = @masp  where makm = @makm -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_delete.sql
-- Nhà cung cấp delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- update date: 10-12-2023
-- =============================================
DROP PROCEDURE IF EXISTS sp_nhacungcap_delete
GO
CREATE PROCEDURE sp_nhacungcap_delete
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM nhacungcap WHERE MANCC = @MANCC
END
GO
--exec sp_nhacungcap_delete 'ncc04'-- khoa nay dang duoc su dung khong the delete
--select * from chitietcc﻿-- ================================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- update date: 10-12-2023
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert 
-- =============================================
drop procedure if exists sp_nhacungcap_insert
go
CREATE PROCEDURE sp_nhacungcap_insert
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11),
	@TENNCC NVARCHAR(30) ,
	@DIACHINCC NVARCHAR(100),
	@SDTNCC INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO NHACUNGCAP(MANCC,TENNCC,DIACHINCC,SDTNCC) VALUES (@MANCC, @TENNCC, @DIACHINCC,@SDTNCC)
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_all.sql
-- Nhà cung cấp select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- update date: 10-12-2023
-- =============================================
drop procedure if exists sp_nhacungcap_select_all
go
CREATE PROCEDURE sp_nhacungcap_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ncc.*, sp.*,ccct.* from nhacungcap ncc, sanpham sp, CHITIETCC ccct 
	where ncc.MANCC = ccct.MANCC and sp.MASP = ccct.MASP
	order by ncc.created_date_ncc desc
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_one.sql
-- Nhà cung cấp select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- update date: 10-12-2023
-- =============================================
drop procedure if exists sp_nhacungcap_select_one
go
CREATE PROCEDURE sp_nhacungcap_select_one
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from nhacungcap where MANCC like @MANCC --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- update date: 10-12-2023
-- =============================================
drop procedure if exists sp_nhacungcap_update
go
CREATE PROCEDURE sp_nhacungcap_update
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11),
	@TENNCC NVARCHAR(30) ,
	@DIACHINCC NVARCHAR(100),
	@SDTNCC INT   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update nhacungcap set TENNCC = @TENNCC, DIACHINCC = @DIACHINCC,SDTNCC = @SDTNCC where MANCC = @MANCC -- chuẩn sql
END
GO
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023>
drop procedure if exists sp_cbo_phongban
go
CREATE PROCEDURE sp_cbo_phongban
	-- Add the parameters for the stored procedure here
	 
AS
BEGIN 
    -- Delete statements for procedure here
	Select MAPB, TENPHG FROM PHONGBAN
END;
go
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>

drop procedure if exists sp_nhanvien_delete
go
CREATE PROCEDURE sp_nhanvien_delete
	-- Add the parameters for the stored procedure here
	@manv char(11) 
AS
BEGIN 
    -- Delete statements for procedure here
	DELETE FROM nhanvien WHERE manv = @manv
END;
go 
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>
drop procedure if exists sp_nhanvien_insert
go
CREATE PROCEDURE sp_nhanvien_insert
	 
	-- Add the parameters for the stored procedure here
	@manv char(11),
	@hotennv nvarchar(30),
	@diachinv nvarchar(100),
	@luong float,
	@sdtnv int,
	@ngaysinh date,
	@mapb char(4),
	@gioitinh char(4)
AS
BEGIN 
    -- Insert statements for procedure here
	-- Đợi 50 milliseconds
	WAITFOR DELAY '00:00:00.050';
	INSERT INTO nhanvien(manv, hotennv, diachinv, luong, sdtnv, ngaysinh,mapb, gioitinh) 
	VALUES (@manv, @hotennv, @diachinv, @luong, @sdtnv, @ngaysinh,@mapb, @gioitinh);
END;
go
 

--exec sp_nhanvien_insert 'nv', 'hoang van dung', '222 dia chi ma', 3214232, 123123,'09-09-2000','pb01', 'nam'
--Select * from nhanvien order by created_date asc where gioitinh = 'nam';
 
﻿
-- Author:		Sok Kim Thanh
-- Create date: <10/12/2023 9:33 SA>

drop procedure if exists sp_nhanvien_search
go
CREATE PROCEDURE sp_nhanvien_search
	-- Add the parameters for the stored procedure here
	@keyword nvarchar(100)
	 
AS
BEGIN 
    -- Insert statements for procedure here
	SELECT * from nhanvien where HOTENNV like '%' + @keyword + '%'--like chính xác mã 100%
END;
go

--select * from nhanvien
--exec sp_nhanvien_search 'b' --test ok﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 10:57 CH>
drop procedure if exists sp_nhanvien_select_all_all
go
CREATE PROCEDURE sp_nhanvien_select_all_all
AS
BEGIN
    SELECT 
       
        NV.MANV AS NhanVienID,
        PB.MAPB AS PhongBanID,
        NV.HOTENNV AS 'Họ và tên',
        PB.TENPHG AS 'Tên phòng ban'
        
    FROM 
        NHANVIEN NV,
		PHONGBAN PB
    where NV.MAPB = PB.MAPB
	order by nv.created_date_nv desc;
END;
go

 
﻿
-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>

drop procedure if exists sp_nhanvien_select_one
go
CREATE PROCEDURE sp_nhanvien_select_one
	-- Add the parameters for the stored procedure here
	@manv char(11)
	 
AS
BEGIN 
    -- Insert statements for procedure here
	SELECT * from nhanvien where MANV like @manv --like chính xác mã 100%
END;
go

﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>

drop procedure if exists sp_nhanvien_update
go
CREATE PROCEDURE sp_nhanvien_update
	-- Add the parameters for the stored procedure here
	@manv char(11),
	@hotennv nvarchar(30),
	@diachinv nvarchar(100),
	@luong float,
	@sdtnv int,
	@ngaysinh date,
	@mapb char(4),
	@gioitinh nvarchar(10)
AS
BEGIN 
    -- Insert statements for procedure here
	update nhanvien set hotennv = @hotennv, diachinv = @diachinv,luong=@luong,sdtnv=@sdtnv ,ngaysinh=@ngaysinh, mapb = @mapb, gioitinh = @gioitinh where manv = @manv-- chuẩn sql
END;
go
﻿-- ================================================
-- Create Procedure sp_PhongBan_select_all.sql
-- Nhân viên phongban all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vo tu
-- Create date: <10/11/2023>
-- Description:	<vo tu select all>
-- =============================================
drop procedure if exists sp_cbb_chinhanh_select
go
CREATE PROCEDURE sp_cbb_chinhanh_select
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from CHINHANH
END
GO
exec sp_cbb_chinhanh_select
﻿-- ================================================
-- Create Procedure sp_phongban_delete.sql
-- Nhân viên delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vo tu
-- Create date: <10/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_phongban_delete
GO
CREATE PROCEDURE sp_phongban_delete
	-- Add the parameters for the stored procedure here
	@maPB char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM PHONGBAN WHERE MAPB = @maPB
END
GO
﻿-- ================================================
-- Create Procedure sp_nhanvien_insert.sql
-- Nhân viên insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <10/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_phongban_insert
go
CREATE PROCEDURE sp_PhongBan_insert
	-- Add the parameters for the stored procedure here
	@maPB char(11),
	@tenPB nvarchar(30),
	@maCN nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO PHONGBAN VALUES (@maPB, @tenPB, @maCN)
END
GO
﻿-- ================================================
-- Create Procedure sp_PhongBan_select_all.sql
-- Nhân viên phongban all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vo tu
-- Create date: <10/11/2023>
-- Description:	<vo tu select all>
-- =============================================
drop procedure if exists sp_phongban_select_all
go
CREATE PROCEDURE sp_phongban_select_all
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT pb.MAPB, pb.TENPHG, cn.TENCN from PHONGBAN pb, CHINHANH cn
END
GO
exec sp_phongban_select_all
﻿-- ================================================
-- Create Procedure sp_nhanvien_update.sql
-- Nhân viên update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <10/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_phongban_update
go
CREATE PROCEDURE sp_phongban_update
	-- Add the parameters for the stored procedure here
		@maPB char(11),
	@tenPB nvarchar(30),
	@maCN nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update PHONGBAN set TENPHG = @tenPB, MACN = @maCN where MACN = @maCN -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_delete.sql
-- Sản phẩm delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_sanpham_delete
GO
CREATE PROCEDURE sp_sanpham_delete
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM sanpham WHERE MASP = @MASP
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_insert.sql
-- Sản phẩm insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_sanpham_insert
go
CREATE PROCEDURE sp_sanpham_insert
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11),
	@TENSP NVARCHAR(30) ,
	@DONVI NVARCHAR(30),
	@NSX DATE ,
	@HSD DATE ,
	@DONGIA INT ,
	@SLTONKHO INT, 
	@MALOAI CHAR(11), 
	@MANCC CHAR(11), 
	@MAKM char(11)
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO sanpham (MASP,TENSP,DONVI ,NSX  ,HSD  ,DONGIA  ,SLTONKHO , MALOAI , MANCC, MAKM ) 
	VALUES (@MASP,@TENSP,@DONVI ,@NSX  ,@HSD  ,@DONGIA  ,@SLTONKHO , @MALOAI , @MANCC, @MAKM )
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_select_all.SQL
-- Sản phẩm select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Sok Kim Thanh>
-- Create date: <07/11/2023>
-- Description:	<Sản phẩm select all>
-- =============================================
drop procedure if exists sp_sanpham_select_all
go
CREATE PROCEDURE sp_sanpham_select_all
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from sanpham
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_select_all.SQL
-- Sản phẩm select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Sok Kim Thanh>
-- Create date: <07/11/2023>
-- Description:	<Sản phẩm select all>
-- =============================================
drop procedure if exists sp_sanpham_select_all
go
CREATE PROCEDURE sp_sanpham_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from SanPham

	
	
END
GO
exec sp_sanpham_select_all
﻿-- ================================================
-- Create Procedure sp_sanpham_select_one.sql
-- Sản phẩm select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_sanpham_select_one
go
CREATE PROCEDURE sp_sanpham_select_one
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from sanpham where MASP like @MASP --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_update.sql
-- Sản phẩm update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_sanpham_update
go
CREATE PROCEDURE sp_sanpham_update
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11),
	@TENSP NVARCHAR(30) ,
	@DONVI NVARCHAR(30),
	@NSX DATE ,
	@HSD DATE ,
	@DONGIA INT ,
	@SLTONKHO INT, 
	@MALOAI CHAR(11), 
	@MANCC CHAR(11), 
	@MAKM char(11)
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update sanpham set TENSP = @TENSP, DONVI = @DONVI, NSX = @NSX,HSD = @HSD,DONGIA = @DONGIA,SLTONKHO = @SLTONKHO,MALOAI = @MALOAI,MANCC = @MANCC,MAKM = @MAKM where MASP = @MASP -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_chitiethoadon_delete
GO
CREATE PROCEDURE sp_chitiethoadon_delete
	-- Add the parameters for the stored procedure here
	@makm char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM chitiethoadon WHERE MASP = @makm
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_insert
go
CREATE PROCEDURE sp_chitiethoadon_insert
	-- Add the parameters for the stored procedure here
	@mahd char(11) = '', 
    @masp char(11) = '',
	@sl int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO CHITIETHD VALUES (@mahd, @masp, @sl)
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_select_all
go
CREATE PROCEDURE sp_chitiethoadon_select_all
	-- Add the parameters for the stored procedure here
	@makm char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT hd.MAHD,sp.TENSP,ct.SLMUA,sp.DONGIA*ct.SLMUA as "Thành Tiền"
	from CHITIETHD ct, HOADON hd, SANPHAM sp
	where ct.MAHD = hd.MAHD and sp.MASP = ct.MASP;
END
GO
exec sp_chitiethoadon_select_all "HD01"
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
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
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_TongTien
go
CREATE PROCEDURE sp_chitiethoadon_TongTien
	-- Add the parameters for the stored procedure here
	@makm char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	Declare  @TT int = 0;
	select @TT += ct.SLMUA * sp.DONGIA
	from CHITIETHD ct,HOADON hd,SANPHAM sp
	where ct.MAHD = hd.MAHD and sp.MASP = ct.MASP

	Update HOADON
	set TONGTHANHTIEN = @TT
	where MAHD = @makm;
END
GO
exec sp_chitiethoadon_TongTien 'HD01'
select * 
from HOADON
where MAHD='HD01'
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_update
go
CREATE PROCEDURE sp_hinhthuckm_update
	-- Add the parameters for the stored procedure here
	@mahd char(11) = '', 
	@masp char(11) = '',
	@sl int
	as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update CHITIETHD set SLMUA = @sl where MAHD = @mahd and  MASP = @masp -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_chitiethoadon_delete
GO
CREATE PROCEDURE sp_chitiethoadon_delete
	-- Add the parameters for the stored procedure here
	@mahd char(11) ,
	@masp char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM CHITIETHD WHERE MASP = @masp and MAHD = @mahd
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_insert
go
CREATE PROCEDURE sp_chitiethoadon_insert
	-- Add the parameters for the stored procedure here
	@mahd char(11),
	@masp char(11),
	@sl int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO CHITIETHD VALUES (@mahd, @masp, @sl)
END
GO
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_select_all
go
CREATE PROCEDURE sp_chitiethoadon_select_all
	-- Add the parameters for the stored procedure here
	 @MAHD CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT sp.TENSP,ct.SLMUA, ct.SLMUA * sp.DONGIA as "Thành tiền"
	from CHITIETHD ct,HOADON hd,SANPHAM sp 
	where ct.MAHD = hd.MAHD and ct.MASP=sp.MASP and ct.MAHD = @MAHD

END
GO
exec sp_chitiethoadon_select_all 'HD01'
﻿-- ================================================
-- Create Procedure sp_chitiethoadon_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_chitiethoadon_update
go
CREATE PROCEDURE sp_chitiethoadon_update
	-- Add the parameters for the stored procedure here
	@mahd char(11) = '', 
	@masp char(11) = '', 
	@SLmua int
	as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update CHITIETHD set SLMUA = @SLmua where MAHD = @mahd and MASP = @masp -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_danhmuc_delete
GO
CREATE PROCEDURE sp_danhmuc_delete
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM LOAISP WHERE MALOAI = @MALOAI
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_insert
go
CREATE PROCEDURE sp_danhmuc_insert
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11) ,
	@TENLOAI NVARCHAR(30),
	@GHICHU NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO LOAISP VALUES (@MALOAI, @TENLOAI, @GHICHU)
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_select_all
go
CREATE PROCEDURE sp_danhmuc_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from LOAISP
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_select_one
go
CREATE PROCEDURE sp_danhmuc_select_one
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from LOAISP where MALOAI like @MALOAI --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_danhmuc_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_danhmuc_update
go
CREATE PROCEDURE sp_danhmuc_update
	-- Add the parameters for the stored procedure here
	@MALOAI CHAR(11),
	@TENLOAI NVARCHAR(30),
	@GHICHU NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update LOAISP set TENLOAI = @TENLOAI, GHICHU = @GHICHU where MALOAI = @MALOAI -- chuẩn sql
END
GO
﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_diadiem_delete
GO
CREATE PROCEDURE sp_diadiem_delete
	-- Add the parameters for the stored procedure here
	@maCN char(4) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM CHINHANH WHERE MACN = @maCN
END
GO
﻿-- ================================================
-- Create Procedure sp_diadiem_insert.sql
-- Nhà cung cấp insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
set dateformat dmy
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_diadiem_insert
go
CREATE PROCEDURE sp_diadiem_insert
	-- Add the parameters for the stored procedure here
	@maCN char(4) = '',
	@tenCN nvarchar(30),
	@diaChi nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO CHINHANH VALUES (@maCN,@tenCN,@diaChi)
END
GO
exec sp_diadiem_insert 'CN05', N'Chi nhánh Đà Nẵng', N'Số 3 Nguyễn Văn Linh, Hải Châu, Đà Nẵng';

select * from CHINHANH

﻿set dateformat dmy
-- ================================================
-- Create Procedure sp_diadiem_select_all.sql
-- hoadon select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<dia diem select all>
-- =============================================
drop procedure if exists sp_diadiem_select_all
go
CREATE PROCEDURE sp_diadiem_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 

    -- Insert statements for procedure here
	SELECT * from CHINHANH
END
GO
exec sp_diadiem_select_all
﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_diaiem_update
go
CREATE PROCEDURE sp_diadiem_update
	-- Add the parameters for the stored procedure here
@maCN char(4) = '',
	@tenCN nvarchar(30),
	@diaChi nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update CHINHANH set TENCN = @tenCN, DIACHICN = @diaChi  where MACN = @maCN -- chuẩn sql
END
GO
--exec sp_diadiem_update 'CN05', N'Chi nhánh Bình Phước', N'Số 3 Nguyễn Văn Linh, Hải Châu, Đà Nẵng';
select * from CHINHANH﻿-- ================================================
-- Create Procedure sp_hinhthuckm_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_hinhthuckm_delete
GO
CREATE PROCEDURE sp_hinhthuckm_delete
	-- Add the parameters for the stored procedure here
	@makm char(11) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM hinhthuckm WHERE MAHT = @makm
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_insert
go
CREATE PROCEDURE sp_hinhthuckm_insert
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
	INSERT INTO hinhthuckm VALUES (@makm, @hinhthuc, @ghichu)
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_select_all
go
CREATE PROCEDURE sp_hinhthuckm_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from hinhthuckm
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_select_one
go
CREATE PROCEDURE sp_hinhthuckm_select_one
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
	SELECT * from hinhthuckm where makm = @makm --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_hinhthuckm_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hinhthuckm_update
go
CREATE PROCEDURE sp_hinhthuckm_update
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
	update hinhthuckm set TENHINHTHUC = @hinhthuc, ghichu = @ghichu  where MAHT = @makm -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_all.sql
-- Nhà cung cấp select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Nhà cung cấp select all>
-- =============================================
drop procedure if exists sp_cbb_khachhang_select_all
go
CREATE PROCEDURE sp_cbb_khachhang_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT kh.MAKH, kh.HOTENKH from KHACHHANG kh
END
GO
exec sp_cbb_khachhang_select_all






-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
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
drop procedure if exists sp_khachhang_update
go
CREATE PROCEDURE sp_khachhang_update
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

    -- Insert statements for procedure here
	update KHACHHANG set HOTENKH = @tenKH,SDTKH = @sdtKH, DIEMTL = @diemTL where MAKH = @maKH -- chuẩn sql
END
GO



-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
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
drop procedure if exists sp_nhacungcap_insert
go
CREATE PROCEDURE sp_khachhang_insert
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

    -- Insert statements for procedure here
	INSERT INTO KHACHHANG VALUES (@maKH, @tenKH, @sdtKH,@diemTL)
END
GO

-- ================================================
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
	@maKH char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM KHACHHANG WHERE MAKH = @maKH
END
GO

﻿set dateformat dmy
-- ================================================
-- Create Procedure sp_nhanvien_select_all.sql
-- nhan vien select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<nhan vien select all>
-- =============================================
drop procedure if exists sp_nhanvien_select_all
go
CREATE PROCEDURE sp_nhanvien_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 

    -- Insert statements for procedure here
	SELECT nv.MANV,nv.HOTENNV from NHANVIEN nv
END
GO
exec sp_nhanvien_select_all






-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
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
drop procedure if exists sp_hoadon_update
go
CREATE PROCEDURE sp_hoadon_update
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update HOADON set NGAYHOADON = @ngayHD, TONGTHANHTIEN = @tongTien, MANV = @maNV, MAKH =@maKH where MAHD = @maHD -- chuẩn sql
END
GO
--exec sp_hoadon_update'HD03','15/01/2022', 90000,'NV02', 'KH02'


-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
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
drop procedure if exists sp_hoadon_insert
go
CREATE PROCEDURE sp_hoadon_insert
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO HOADON VALUES (@maHD, @ngayHD, @tongTien,@maNV,@maKH)
END
GO
--exec sp_hoadon_insert 'HD03','15/01/2022', 90000,'NV02', 'KH02'

-- ================================================
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
DROP PROCEDURE IF EXISTS sp_hoadon_delete
GO
CREATE PROCEDURE sp_hoadon_delete
	-- Add the parameters for the stored procedure here
	@maHD char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM HOADON WHERE MAHD = @maHD
END
GO

﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_hoadon_delete
GO
CREATE PROCEDURE sp_hoadon_delete
	-- Add the parameters for the stored procedure here
	@maHD char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Delete statements for procedure here
	DELETE FROM HOADON WHERE MAHD = @maHD
	DELETE FROM CHITIETHD WHERE MAHD = @maHD
end
﻿-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
set dateformat dmy
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hoadon_insert
go
CREATE PROCEDURE sp_hoadon_insert
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO HOADON VALUES (@maHD, @ngayHD, @tongTien,@maNV,@maKH)
END
GO
exec sp_hoadon_insert 'HD03','15/01/2022', 90000,'NV02', 'KH02'

select * from NHANVIEN

﻿set dateformat dmy
-- ================================================
-- Create Procedure sp_hoadon_select_all.sql
-- hoadon select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Hóa đơn select all>
-- =============================================
drop procedure if exists sp_hoadon_select_all
go
CREATE PROCEDURE sp_hoadon_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 

    -- Insert statements for procedure here
	SELECT hd.MAHD, hd.NGAYHOADON, hd.TONGTHANHTIEN , nv.HOTENNV, kh.HOTENKH from HOADON hd, NHANVIEN nv, KHACHHANG kh
	where hd.MANV = nv.MANV and hd.MAKH = kh.MAKH
END
GO
exec sp_hoadon_select_all


﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_one.sql
-- Nhà cung cấp select one
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
drop procedure if exists sp_hoadon_select_one
go
CREATE PROCEDURE sp_hoadon_select_one
	-- Add the parameters for the stored procedure here
	@maHD char(11) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT * from HOADON where MAHD  = @maHD --like chính xác mã 100%
END
GO
﻿-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_hoadon_update
go
CREATE PROCEDURE sp_hoadon_update
	-- Add the parameters for the stored procedure here
	@maHD char(11) = '', 
	@ngayHD date,
	@tongTien decimal,
	@maNV char(11),
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update HOADON set NGAYHOADON = @ngayHD, TONGTHANHTIEN = @tongTien, MANV = @maNV, MAKH =@maKH where MAHD = @maHD -- chuẩn sql
END
GO
exec sp_hoadon_update'HD03','15/01/2022', 90000,'NV02', 'KH02'﻿-- ================================================
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
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM KHACHHANG WHERE MAKH = @maKH
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert
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
drop procedure if exists sp_khachhang_insert
go
CREATE PROCEDURE sp_khachhang_insert
	-- Add the parameters for the stored procedure here
	@maKH char(11),
	@tenKH nvarchar(30),
	@sdtKH int = 0,
	@diemTL int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO KHACHHANG VALUES (@maKH, @tenKH, @sdtKH,@diemTL)
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_all.sql
-- Nhà cung cấp select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vo Tu
-- Create date: <13/11/2023>
-- Description:	<Nhà cung cấp select all>
-- =============================================
drop procedure if exists sp_khachhang_select_all
go
CREATE PROCEDURE sp_khachhang_select_all
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from KHACHHANG
END
GO
exec sp_khachhang_select_all



﻿-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
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
drop procedure if exists sp_khachhang_update
go
CREATE PROCEDURE sp_khachhang_update
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

    -- Insert statements for procedure here
	update KHACHHANG set HOTENKH = @tenKH,SDTKH = @sdtKH, DIEMTL = @diemTL where MAKH = @maKH -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_one.sql
-- Nhà cung cấp select one
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
drop procedure if exists sp_khachhang_select_one
go
CREATE PROCEDURE sp_khachhang_select_one
	-- Add the parameters for the stored procedure here
	@maKH char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT * from KHACHHANG where  MAKH = @maKH --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_cbo_hinhthuckm
go
CREATE PROCEDURE sp_cbo_hinhthuckm
	-- Add the parameters for the stored procedure here
	--@makm char(11) = '', 
	--@hinhthuc nvarchar(50) = N'',
	--@ghichu nvarchar(100) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MAKM from hinhthuckm-- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_delete.sql
-- Danh mục delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_khuyenmai_delete
GO
CREATE PROCEDURE sp_khuyenmai_delete
	-- Add the parameters for the stored procedure here
	@makm char(11) = '', 
	@ngaybd date,
	@ngaykt date,
	@masp char(11) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM khuyenmai WHERE makm = @makm
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_insert.sql
-- Danh mục insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_insert
go
CREATE PROCEDURE sp_khuyenmai_insert
	-- Add the parameters for the stored procedure here
	@makm char(11) = '', 
	@ngaybd date,
	@ngaykt date,
	@masp char(11) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO khuyenmai VALUES (@makm, @ngaybd, @ngaykt,@masp)
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_select_all.sql
-- Danh mục select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_select_all
go
CREATE PROCEDURE sp_khuyenmai_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from KHUYENMAI , HINHTHUCKM
	where KHUYENMAI.MAHT = HINHTHUCKM.MAHT
END
GO
exec sp_khuyenmai_select_all
exec sp_sanpham_select_all
﻿-- ================================================
-- Create Procedure sp_khuyenmai_select_one.sql
-- Danh mục select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_select_one
go
CREATE PROCEDURE sp_khuyenmai_select_one
	-- Add the parameters for the stored procedure here
	@MAKM CHAR(11) ,
	@NGAYBD DATE ,
	@NGAYKT DATE,
	@MAHT char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from khuyenmai where MAKM = @MAKM --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_khuyenmai_update.sql
-- Danh mục update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_khuyenmai_update
go
CREATE PROCEDURE sp_khuyenmai_update
	-- Add the parameters for the stored procedure here
	@makm char(11) = '', 
	@ngaybd date,
	@ngaykt date,
	@masp char(11) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update khuyenmai set ngaybd = @ngaybd, ngaykt = @ngaykt, masp = @masp  where makm = @makm -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_delete.sql
-- Nhà cung cấp delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- update date: 10-12-2023
-- =============================================
DROP PROCEDURE IF EXISTS sp_nhacungcap_delete
GO
CREATE PROCEDURE sp_nhacungcap_delete
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM nhacungcap WHERE MANCC = @MANCC
END
GO
--exec sp_nhacungcap_delete 'ncc04'-- khoa nay dang duoc su dung khong the delete
--select * from chitietcc﻿-- ================================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- update date: 10-12-2023
-- Create Procedure sp_nhacungcap_insert.sql
-- Nhà cung cấp insert 
-- =============================================
drop procedure if exists sp_nhacungcap_insert
go
CREATE PROCEDURE sp_nhacungcap_insert
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11),
	@TENNCC NVARCHAR(30) ,
	@DIACHINCC NVARCHAR(100),
	@SDTNCC INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO NHACUNGCAP(MANCC,TENNCC,DIACHINCC,SDTNCC) VALUES (@MANCC, @TENNCC, @DIACHINCC,@SDTNCC)
END
GO

--exec sp_nhacungcap_insert 'ncc005', 'Hoang CC', 'ly thai to q3', 123123
--exec sp_nhacungcap_select_all
--select * from nhacungcap﻿-- ================================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- update date: 10-12-2023
-- Create Procedure sp_nhacungcap_select_all
-- ================================================
 
drop procedure if exists sp_nhacungcap_select_all
go
CREATE PROCEDURE sp_nhacungcap_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from nhacungcap
END
GO
-- ================================================
-- Author:		Sok Kim Thanh
-- Create date: <10/12/2023>
-- Create Procedure sp_nhacungcap_cu_select_all
-- ================================================
drop procedure if exists sp_nhacungcap_cu_select_all
go
CREATE PROCEDURE sp_nhacungcap_cu_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ncc.MANCC, ncc.TENNCC, sp.TENSP,ccct.SLCUNGCCAP from nhacungcap ncc, sanpham sp, CHITIETCC ccct 
	where ncc.MANCC = ccct.MANCC and sp.MASP = ccct.MASP
	order by ncc.created_date_ncc desc
END
GO
-- ================================================
-- Author:		Sok Kim Thanh
-- Create date: <10/12/2023>
-- Create Procedure sp_nhacungcap_moi_select_all
-- ================================================
drop procedure if exists sp_nhacungcap_moi_select_all
go
CREATE PROCEDURE sp_nhacungcap_moi_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from NHACUNGCAP ncc where MANCC not in(
	SELECT ncc.MANCC from nhacungcap ncc, sanpham sp, CHITIETCC ccct 
	where ncc.MANCC = ccct.MANCC and sp.MASP = ccct.MASP group by ncc.MANCC)
	order by created_date_ncc desc
END
GO﻿-- ================================================
-- Create Procedure sp_nhacungcap_select_one.sql
-- Nhà cung cấp select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- update date: 10-12-2023
-- =============================================
drop procedure if exists sp_nhacungcap_select_one
go
CREATE PROCEDURE sp_nhacungcap_select_one
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from nhacungcap where MANCC like @MANCC --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_nhacungcap_update.sql
-- Nhà cung cấp update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- update date: 10-12-2023
-- =============================================
drop procedure if exists sp_nhacungcap_update
go
CREATE PROCEDURE sp_nhacungcap_update
	-- Add the parameters for the stored procedure here
	@MANCC CHAR(11),
	@TENNCC NVARCHAR(30) ,
	@DIACHINCC NVARCHAR(100),
	@SDTNCC INT   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update nhacungcap set TENNCC = @TENNCC, DIACHINCC = @DIACHINCC,SDTNCC = @SDTNCC where MANCC = @MANCC -- chuẩn sql
END
GO
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023>
drop procedure if exists sp_cbo_phongban
go
CREATE PROCEDURE sp_cbo_phongban
	-- Add the parameters for the stored procedure here
	 
AS
BEGIN 
    -- Delete statements for procedure here
	Select MAPB, TENPHG FROM PHONGBAN
END;
go
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>

drop procedure if exists sp_nhanvien_delete
go
CREATE PROCEDURE sp_nhanvien_delete
	-- Add the parameters for the stored procedure here
	@manv char(11) 
AS
BEGIN 
    -- Delete statements for procedure here
	DELETE FROM nhanvien WHERE manv = @manv
END;
go 
﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>
drop procedure if exists sp_nhanvien_insert
go
CREATE PROCEDURE sp_nhanvien_insert
	 
	-- Add the parameters for the stored procedure here
	@manv char(11),
	@hotennv nvarchar(30),
	@diachinv nvarchar(100),
	@luong float,
	@sdtnv int,
	@ngaysinh date,
	@mapb char(4),
	@gioitinh char(4)
AS
BEGIN 
    -- Insert statements for procedure here
	-- Đợi 50 milliseconds
	WAITFOR DELAY '00:00:00.050';
	INSERT INTO nhanvien(manv, hotennv, diachinv, luong, sdtnv, ngaysinh,mapb, gioitinh) 
	VALUES (@manv, @hotennv, @diachinv, @luong, @sdtnv, @ngaysinh,@mapb, @gioitinh);
END;
go
 

--exec sp_nhanvien_insert 'nv', 'hoang van dung', '222 dia chi ma', 3214232, 123123,'09-09-2000','pb01', 'nam'
--Select * from nhanvien order by created_date asc where gioitinh = 'nam';
 
﻿
-- Author:		Sok Kim Thanh
-- Create date: <10/12/2023 9:33 SA>

drop procedure if exists sp_nhanvien_search
go
CREATE PROCEDURE sp_nhanvien_search
	-- Add the parameters for the stored procedure here
	@keyword nvarchar(100)
	 
AS
BEGIN 
    -- Insert statements for procedure here
	SELECT * from nhanvien where HOTENNV like '%' + @keyword + '%'--like chính xác mã 100%
END;
go

--select * from nhanvien
--exec sp_nhanvien_search 'b' --test ok﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 10:57 CH>
drop procedure if exists sp_nhanvien_select_all_all
go
CREATE PROCEDURE sp_nhanvien_select_all_all
AS
BEGIN
    SELECT 
       
        NV.MANV AS NhanVienID,
        PB.MAPB AS PhongBanID,
        NV.HOTENNV AS 'Họ và tên',
        PB.TENPHG AS 'Tên phòng ban'
        
    FROM 
        NHANVIEN NV,
		PHONGBAN PB
    where NV.MAPB = PB.MAPB
	order by nv.created_date_nv desc;
END;
go

 
﻿
-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>

drop procedure if exists sp_nhanvien_select_one
go
CREATE PROCEDURE sp_nhanvien_select_one
	-- Add the parameters for the stored procedure here
	@manv char(11)
	 
AS
BEGIN 
    -- Insert statements for procedure here
	SELECT * from nhanvien where MANV like @manv --like chính xác mã 100%
END;
go

﻿-- Author:		Sok Kim Thanh
-- Create date: <06/12/2023 9:39 CH>

drop procedure if exists sp_nhanvien_update
go
CREATE PROCEDURE sp_nhanvien_update
	-- Add the parameters for the stored procedure here
	@manv char(11),
	@hotennv nvarchar(30),
	@diachinv nvarchar(100),
	@luong float,
	@sdtnv int,
	@ngaysinh date,
	@mapb char(4),
	@gioitinh nvarchar(10)
AS
BEGIN 
    -- Insert statements for procedure here
	update nhanvien set hotennv = @hotennv, diachinv = @diachinv,luong=@luong,sdtnv=@sdtnv ,ngaysinh=@ngaysinh, mapb = @mapb, gioitinh = @gioitinh where manv = @manv-- chuẩn sql
END;
go
﻿-- ================================================
-- Create Procedure sp_PhongBan_select_all.sql
-- Nhân viên phongban all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vo tu
-- Create date: <10/11/2023>
-- Description:	<vo tu select all>
-- =============================================
drop procedure if exists sp_cbb_chinhanh_select
go
CREATE PROCEDURE sp_cbb_chinhanh_select
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from CHINHANH
END
GO
exec sp_cbb_chinhanh_select
﻿-- ================================================
-- Create Procedure sp_phongban_delete.sql
-- Nhân viên delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vo tu
-- Create date: <10/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_phongban_delete
GO
CREATE PROCEDURE sp_phongban_delete
	-- Add the parameters for the stored procedure here
	@maPB char(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM PHONGBAN WHERE MAPB = @maPB
END
GO
﻿-- ================================================
-- Create Procedure sp_nhanvien_insert.sql
-- Nhân viên insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <10/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_phongban_insert
go
CREATE PROCEDURE sp_PhongBan_insert
	-- Add the parameters for the stored procedure here
	@maPB char(11),
	@tenPB nvarchar(30),
	@maCN nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO PHONGBAN VALUES (@maPB, @tenPB, @maCN)
END
GO
﻿-- ================================================
-- Create Procedure sp_PhongBan_select_all.sql
-- Nhân viên phongban all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		vo tu
-- Create date: <10/11/2023>
-- Description:	<vo tu select all>
-- =============================================
drop procedure if exists sp_phongban_select_all
go
CREATE PROCEDURE sp_phongban_select_all
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT pb.MAPB, pb.TENPHG, cn.TENCN from PHONGBAN pb, CHINHANH cn
END
GO
exec sp_phongban_select_all
﻿-- ================================================
-- Create Procedure sp_nhanvien_update.sql
-- Nhân viên update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <10/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_phongban_update
go
CREATE PROCEDURE sp_phongban_update
	-- Add the parameters for the stored procedure here
		@maPB char(11),
	@tenPB nvarchar(30),
	@maCN nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update PHONGBAN set TENPHG = @tenPB, MACN = @maCN where MACN = @maCN -- chuẩn sql
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_delete.sql
-- Sản phẩm delete
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
DROP PROCEDURE IF EXISTS sp_sanpham_delete
GO
CREATE PROCEDURE sp_sanpham_delete
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete statements for procedure here
	DELETE FROM sanpham WHERE MASP = @MASP
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_insert.sql
-- Sản phẩm insert
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_sanpham_insert
go
CREATE PROCEDURE sp_sanpham_insert
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11),
	@TENSP NVARCHAR(30) ,
	@DONVI NVARCHAR(30),
	@NSX DATE ,
	@HSD DATE ,
	@DONGIA INT ,
	@SLTONKHO INT, 
	@MALOAI CHAR(11), 
	@MANCC CHAR(11), 
	@MAKM char(11)
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO sanpham (MASP,TENSP,DONVI ,NSX  ,HSD  ,DONGIA  ,SLTONKHO , MALOAI , MANCC, MAKM ) 
	VALUES (@MASP,@TENSP,@DONVI ,@NSX  ,@HSD  ,@DONGIA  ,@SLTONKHO , @MALOAI , @MANCC, @MAKM )
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_select_all.SQL
-- Sản phẩm select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Sok Kim Thanh>
-- Create date: <07/11/2023>
-- Description:	<Sản phẩm select all>
-- =============================================
drop procedure if exists sp_sanpham_select_all
go
CREATE PROCEDURE sp_sanpham_select_all
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from sanpham
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_select_all.SQL
-- Sản phẩm select all
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Sok Kim Thanh>
-- Create date: <07/11/2023>
-- Description:	<Sản phẩm select all>
-- =============================================
drop procedure if exists sp_sanpham_select_all
go
CREATE PROCEDURE sp_sanpham_select_all
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from SanPham

	
	
END
GO
exec sp_sanpham_select_all
﻿-- ================================================
-- Create Procedure sp_sanpham_select_one.sql
-- Sản phẩm select one
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_sanpham_select_one
go
CREATE PROCEDURE sp_sanpham_select_one
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from sanpham where MASP like @MASP --like chính xác mã 100%
END
GO
﻿-- ================================================
-- Create Procedure sp_sanpham_update.sql
-- Sản phẩm update
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sok Kim Thanh
-- Create date: <07/11/2023>
-- Description:	<Mô tả>
-- =============================================
drop procedure if exists sp_sanpham_update
go
CREATE PROCEDURE sp_sanpham_update
	-- Add the parameters for the stored procedure here
	@MASP CHAR(11),
	@TENSP NVARCHAR(30) ,
	@DONVI NVARCHAR(30),
	@NSX DATE ,
	@HSD DATE ,
	@DONGIA INT ,
	@SLTONKHO INT, 
	@MALOAI CHAR(11), 
	@MANCC CHAR(11), 
	@MAKM char(11)
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update sanpham set TENSP = @TENSP, DONVI = @DONVI, NSX = @NSX,HSD = @HSD,DONGIA = @DONGIA,SLTONKHO = @SLTONKHO,MALOAI = @MALOAI,MANCC = @MANCC,MAKM = @MAKM where MASP = @MASP -- chuẩn sql
END
GO
