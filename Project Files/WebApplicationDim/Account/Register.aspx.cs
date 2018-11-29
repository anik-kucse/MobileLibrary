using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using WebApplicationDim.Models;
using System.Configuration;
using MySql.Data.MySqlClient;
using AspNet.Identity.MySQL;
using System.Collections.Generic;

namespace WebApplicationDim.Account
{
    public partial class Register : Page
    {
        public object MySqlConnection { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();

            var user = new ApplicationUser()
            {
                UserName = username.Text,
                Email = Email.Text,
                FatherName = FatherName.Text,
                MotherName = MotherName.Text,
                CurrentAddress = CurrentAddress.Text,
                ParmanetAddress =ParmanetAddress.Text,
                BirthDate = DateTime.Parse(BirthDay.Text),
                Education = Education.Text,
                BloodGroup =BloodGroup.Text,
                PhoneNumber = PhoneNumber.Text,
                FirstName = Firstname.Text,
                LastName = Lastname.Text,
                Sex = Sex.SelectedValue
            };
            IdentityResult result = manager.Create(user, Password.Text);
            if (result.Succeeded)
            {
                // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                //string code = manager.GenerateEmailConfirmationToken(user.Id);
                //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");
                
                var res = manager.AddToRole(user.Id, "Member");
                if (res.Succeeded)
                {
                    new MySQLDatabase().Execute("AddNewMember",
                        new Dictionary<string, object>
                        {
                            {"@uid", user.Id },
                            {"@mNo", 0 },
                            {"@occ", Occupation.Text },
                            {"@isApp", 0 },
                            {"@date", DateTime.Now },
                            {"@type", MemberType.SelectedValue }
                        }, true);
                }

                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }

        
    }
}