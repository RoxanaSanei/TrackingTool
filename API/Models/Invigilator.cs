namespace API.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Invigilator")]
    public partial class Invigilator
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Invigilator()
        {
            InvigilatorAvailableDates = new HashSet<InvigilatorAvailableDate>();
        }

        public int InvigilatorID { get; set; }

        [Required]
        [StringLength(50)]
        public string FirstName { get; set; }

        [Required]
        [StringLength(50)]
        public string LastName { get; set; }

        public int AddressID { get; set; }

        [StringLength(20)]
        public string Phone { get; set; }

        [StringLength(20)]
        public string Mobile { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        public bool? WillingToTravel { get; set; }

        public int? KilometersWillingToTravel { get; set; }

        public bool Active { get; set; }

        [StringLength(20)]
        public string WWCC { get; set; }

        [StringLength(3)]
        public string WWCCState { get; set; }

        [StringLength(150)]
        public string Notes { get; set; }

        [StringLength(20)]
        public string TeacherRegNumber { get; set; }

        public bool InvigilatorDetailsConfirmed { get; set; }

        public bool InvigilatorAvailableDatesConfirmed { get; set; }

        public bool TravelInterState { get; set; }

        public bool StayOverNight { get; set; }

        public virtual Address Address { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<InvigilatorAvailableDate> InvigilatorAvailableDates { get; set; }
    }
}
