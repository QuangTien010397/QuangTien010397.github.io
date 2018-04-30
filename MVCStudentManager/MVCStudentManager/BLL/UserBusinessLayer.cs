using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MVCStudentManager.Models;

namespace MVCStudentManager.BLL
{
    public class UserBusinessLayer
    {
        public UserStatus GetUserValidity(UserDetails user)
        {
            if (user.UserName == "Admin" && user.Password == "123")
            {
                return UserStatus.AuthenticatedAdmin;
            }
            else if (user.UserName == "SV" && user.Password == "SV")
            {
                return UserStatus.AuthenticatedUser;
            }
            else
            {
                return UserStatus.NonAuthenticatedUser;
            }
        }
    }
}