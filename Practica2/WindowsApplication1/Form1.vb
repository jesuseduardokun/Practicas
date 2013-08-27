Imports System
Imports System.IO
Imports System.Text

Public Class Form1

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim nombre As String
        nombre = TextBox1.Text + "." + TextBox2.Text
        Dim archivo As FileStream = File.Create(My.Application.Info.DirectoryPath + "\" + nombre)
    End Sub
End Class
