//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HeThongQuanLySieuXe.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class DichVu
    {
        public string MaDichVu { get; set; }
        public string TenDichVu { get; set; }
        public string MoTaDichVu { get; set; }
        public Nullable<decimal> ChiPhiDichVu { get; set; }
        public string ThoiGianThucHien { get; set; }
        public string MaKhachHang { get; set; }
        public Nullable<System.DateTime> NgaySuDungDichVu { get; set; }
    
        public virtual KhachHang KhachHang { get; set; }
    }
}
