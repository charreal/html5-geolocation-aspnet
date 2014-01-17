// Created By: Brij Mohan
// For more information, visit http://techbrij.com



using System;
using System.Collections.Generic;
using System.Data.Spatial;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
/// <summary>
/// 
/// </summary>
public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

       // GenerateData();
    }
    /// <summary>
    /// To add random data in database for testing
    /// </summary>
    void GenerateData() { 
        Random random = new Random();
        double lat = 25.3294781, lng = 55.373236899999995;
        using (var context = new SampleDBEntities())
        {

            for (int i = 1; i < 100; i++)
            {
                context.PlaceInfoes.Add(new PlaceInfo()
                {
                    Name = "Sample" + i,
                    Address = "address" + i,
                    City = "test city",
                    State = "test state",
                    CountryId = Convert.ToInt32(ddlCountry.SelectedValue),
                    Geolocation = DbGeography.FromText("POINT( " + (lng + random.NextDouble() * 1.55).ToString() + " " + (lat + random.NextDouble()).ToString() + ")")
                });
            }
            context.SaveChanges();
        }
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //Validations code here
        //...............
        //To save in database
        using ( var context = new SampleDBEntities()){        
            context.PlaceInfoes.Add (new PlaceInfo() {
            Name = txtName.Text,
            Address = txtAddress.Text,
            City = txtCity.Text,
            State = txtState.Text,
            CountryId = Convert.ToInt32 (ddlCountry.SelectedValue),
            Geolocation = DbGeography.FromText("POINT( " + hdnLocation.Value + ")")
            });
            context.SaveChanges();
        }


    }
}