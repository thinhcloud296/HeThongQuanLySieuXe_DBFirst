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
    
    public partial class BaoHanhXe
    {
        public string MaBaoHanh { get; set; }
        public string MaXe { get; set; }
        public string MaKhachHang { get; set; }
        public Nullable<System.DateTime> NgayBatDauBaoHanh { get; set; }
        public Nullable<System.DateTime> NgayKetThucBaoHanh { get; set; }
        public string DieuKhoanBaoHanh { get; set; }
        public string TrangThaiBaoHanh { get; set; }
    
        public virtual KhachHang KhachHang { get; set; }
        public virtual Xe Xe { get; set; }
    }
}
