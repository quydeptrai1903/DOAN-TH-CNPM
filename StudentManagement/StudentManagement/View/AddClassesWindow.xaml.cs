﻿using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace StudentManagement
{
    /// <summary>
    /// Interaction logic for AddClassesWindow.xaml
    /// </summary>
    public partial class AddClassesWindow : Window
    {
        public bool isCorrected = false;

        public AddClassesWindow()
        {
            InitializeComponent();
        }

        private async void Button_Click(object sender, RoutedEventArgs e)
        {
            if (classNameTb.Text != "" &&
               gradeTb.Text != "" &&
               teacherNameTb.Text != "" &&
               countTb.Text != "" &&
               yearTb.Text != "")
            {
                if(!InputTester.IsAClassName(classNameTb.Text))
                {
                    MessageBox.Show("Tên lớp không hợp lệ");
                    return;
                }

                if (!InputTester.IsAName(teacherNameTb.Text))
                {
                    MessageBox.Show("Tên giáo viên không hợp lệ");
                    return;
                }

                if (!InputTester.IsANumber(countTb.Text, 2))
                {
                    MessageBox.Show("Sĩ số không hợp lệ");
                    return;
                }

                if (!InputTester.IsANumber(yearTb.Text, 4))
                {
                    MessageBox.Show("Năm không hợp lệ");
                    return;
                }

                ClassInfo classInfo = new ClassInfo()
                {
                    //tenLop = className,
                    //khoi = grade.ToString(),
                    //tenGVCN = teacherName,
                    //siSo = count,
                    //nienKhoa = year.ToString()

                };

                ResultYN resultYN = await Controllers.Controller.Instance.InsertNewClass(classInfo);
                if (resultYN.Result)
                {
                    this.Hide();
                    isCorrected = true;
                }
            }
            else
            {
                MessageBox.Show("Please fill out the form");
            }

        }

        private void CloseButton_Click(object sender, RoutedEventArgs e)
        {
            this.Hide();
        }
    }
}
