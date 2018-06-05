namespace API.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ClassTestDateModel
    {
        public int ClassTestDateID { get; set; }

        public int ClassID { get; set; }

        public DateTimeOffset TestDate { get; set; }

        [StringLength(150)]
        public string RoomName { get; set; }

        public int? InvigilatorAvailableDateId { get; set; }

        public virtual ClassModel Class { get; set; }

        public virtual InvigilatorAvailableDate InvigilatorAvailableDate { get; set; }
    }
}
