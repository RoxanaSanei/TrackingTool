namespace API.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ClassDeviceType
    {
        [Key]
        [Column(Order = 0)]
        public int ClassDeviceTypesID { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ClassID { get; set; }

        [Key]
        [Column(Order = 2)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int DeviceTypeID { get; set; }

        public virtual ClassModel Class { get; set; }

        public virtual DeviceTypeModel DeviceType { get; set; }
    }
}
