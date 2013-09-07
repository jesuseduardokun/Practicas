Imports System
Imports System.IO
Imports System.Text

Public Class Form1

    Private Sub SalirToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SalirToolStripMenuItem.Click
        Close()
    End Sub

    Private Sub RegistrarToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RegistrarToolStripMenuItem.Click
        GroupBox1.Visible = True
        TextBox1.Enabled = True
        TextBox2.Enabled = True
        TextBox3.Enabled = True
        Button1.Enabled = True
        Button2.Enabled = True
        Button3.Enabled = True
        If GroupBox2.Visible = True Then
            GroupBox2.Visible = False
        End If
    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        If My.Computer.FileSystem.DirectoryExists(My.Application.Info.DirectoryPath + "\arvo\") = False Then
            My.Computer.FileSystem.CreateDirectory(My.Application.Info.DirectoryPath + "\" + "arvo")
        End If
        If My.Computer.FileSystem.FileExists(My.Application.Info.DirectoryPath + "\arvo\Registro.txt") = False Then
            Dim archivo As FileStream = File.Create(My.Application.Info.DirectoryPath + "\arvo\Registro.txt")
            archivo.Close()
        End If
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        GroupBox1.Visible = False
        TextBox1.Enabled = False
        TextBox2.Enabled = False
        TextBox3.Enabled = False
        Button1.Enabled = False
        Button2.Enabled = False
        Button3.Enabled = False
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        TextBox1.Clear()
        TextBox2.Clear()
        TextBox3.Clear()
        TextBox1.Focus()
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        My.Computer.FileSystem.WriteAllText(My.Application.Info.DirectoryPath + "\arvo\Registro.txt", Trim(TextBox1.Text) + " " + Trim(TextBox2.Text) + " " + Trim(TextBox3.Text) + vbNewLine, True)
    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        Dim linea As String
        Dim nombre As String = TextBox4.Text
        Dim apellido_p As String
        Dim apellido_m As String
        Dim fileReader = My.Computer.FileSystem.OpenTextFileReader(My.Application.Info.DirectoryPath + "\arvo\Registro.txt")

        Dim contador As Integer
        Dim contador2 As Integer
        Dim indice As Integer
        Dim indice2 As Integer
        Dim Arreglo() As Char
        Dim Resta1 As Integer
        Dim Resta2 As Integer

        Do
            linea = fileReader.ReadLine()
            Arreglo = linea.ToCharArray
            For contador2 = linea.Length() - 1 To contador = 1 Step -1
                If Arreglo(contador2) = " "c Then
                    indice = contador2
                End If
            Next
            contador2 = linea.Length()
            For contador = 0 To contador2 - 1 Step +1
                If Arreglo(contador) = " "c Then
                    indice2 = contador
                End If
            Next

        Loop Until linea.Substring(0, indice) = nombre Or fileReader.Peek() = -1

        Resta1 = indice2 - indice
        Resta2 = (linea.Length - 1) - indice2
        If linea.Substring(0, indice) = nombre Then
            MessageBox.Show(linea)
            apellido_p = linea.Substring(indice, Resta1)
            apellido_m = linea.Substring(indice2 + 1, Resta2)
            Label7.Text = apellido_p
            Label8.Text = apellido_m
        Else
            MessageBox.Show("No se encontraron coincidencias.")
        End If
    End Sub

    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button5.Click
        GroupBox2.Visible = False
        TextBox4.Enabled = False
        Button4.Enabled = False
        Button5.Enabled = False
    End Sub

    Private Sub BuscarToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BuscarToolStripMenuItem.Click
        GroupBox2.Visible = True
        TextBox4.Enabled = True
        Button4.Enabled = True
        Button5.Enabled = True
        If GroupBox1.Visible = True Then
            GroupBox1.Visible = False
        End If
    End Sub
End Class