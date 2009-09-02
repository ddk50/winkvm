VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "Comdlg32.ocx"
Begin VB.Form Form1 
   Caption         =   "FMod VB Example - Simplest"
   ClientHeight    =   5355
   ClientLeft      =   60
   ClientTop       =   375
   ClientWidth     =   8550
   LinkTopic       =   "Form1"
   ScaleHeight     =   5355
   ScaleWidth      =   8550
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   1320
      Top             =   2640
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Frame Frame5 
      Caption         =   "2c. Samples (wav, mp3, ogg, wma)"
      Height          =   1455
      Left            =   2280
      TabIndex        =   12
      Top             =   3600
      Width           =   3855
      Begin VB.CommandButton cmdCloseSample 
         Caption         =   "4 - Close Sample"
         Enabled         =   0   'False
         Height          =   375
         Left            =   240
         TabIndex        =   18
         Top             =   840
         Width           =   1455
      End
      Begin VB.CommandButton cmdstopSample 
         Caption         =   "3 - Stop Sample"
         Enabled         =   0   'False
         Height          =   375
         Left            =   2040
         TabIndex        =   15
         Top             =   840
         Width           =   1455
      End
      Begin VB.CommandButton cmdPlaySample 
         Caption         =   "2 - Play Sample"
         Enabled         =   0   'False
         Height          =   375
         Left            =   2040
         TabIndex        =   14
         Top             =   360
         Width           =   1455
      End
      Begin VB.CommandButton cmdOpenSample 
         Caption         =   "1 - Open Sample"
         Enabled         =   0   'False
         Height          =   375
         Left            =   240
         TabIndex        =   13
         Top             =   360
         Width           =   1455
      End
   End
   Begin VB.Frame Frame4 
      Caption         =   "3. Close FMod"
      Height          =   975
      Left            =   6360
      TabIndex        =   10
      Top             =   240
      Width           =   1935
      Begin VB.CommandButton cmdClose 
         Caption         =   "FSOUND_Close"
         Enabled         =   0   'False
         Height          =   375
         Left            =   240
         TabIndex        =   11
         Top             =   360
         Width           =   1455
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "2b. Streams (wav, mp3, ogg, wma)"
      Height          =   1455
      Left            =   2280
      TabIndex        =   6
      Top             =   1920
      Width           =   3855
      Begin VB.CommandButton cmdCloseStream 
         Caption         =   "4 - Close Stream"
         Enabled         =   0   'False
         Height          =   375
         Left            =   240
         TabIndex        =   17
         Top             =   840
         Width           =   1455
      End
      Begin VB.CommandButton cmdOpenStream 
         Caption         =   "1 - Open Stream"
         Enabled         =   0   'False
         Height          =   375
         Left            =   240
         TabIndex        =   9
         Top             =   360
         Width           =   1455
      End
      Begin VB.CommandButton cmdPlayStream 
         Caption         =   "2 - Play Stream"
         Enabled         =   0   'False
         Height          =   375
         Left            =   2040
         TabIndex        =   8
         Top             =   360
         Width           =   1455
      End
      Begin VB.CommandButton cmdStopStream 
         Caption         =   "3 - Stop Stream"
         Enabled         =   0   'False
         Height          =   375
         Left            =   2040
         TabIndex        =   7
         Top             =   840
         Width           =   1455
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "2a. Songs (s3m, it, xm, mod)"
      Height          =   1455
      Left            =   2280
      TabIndex        =   2
      Top             =   240
      Width           =   3855
      Begin VB.CommandButton cmdCloseSong 
         Caption         =   "4 - Close Song"
         Enabled         =   0   'False
         Height          =   375
         Left            =   240
         TabIndex        =   16
         Top             =   840
         Width           =   1455
      End
      Begin VB.CommandButton cmdStopSong 
         Caption         =   "3 - Stop Song"
         Enabled         =   0   'False
         Height          =   375
         Left            =   2040
         TabIndex        =   5
         Top             =   840
         Width           =   1455
      End
      Begin VB.CommandButton cmdPlaySong 
         Caption         =   "2 - Play Song"
         Enabled         =   0   'False
         Height          =   375
         Left            =   2040
         TabIndex        =   4
         Top             =   360
         Width           =   1455
      End
      Begin VB.CommandButton cmdOpenSong 
         Caption         =   "1 - Open Song"
         Enabled         =   0   'False
         Height          =   375
         Left            =   240
         TabIndex        =   3
         Top             =   360
         Width           =   1455
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "1. Initialize FMod"
      Height          =   975
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   1935
      Begin VB.CommandButton cmdInit 
         Caption         =   "FSOUND_Init"
         Height          =   375
         Left            =   240
         TabIndex        =   1
         Top             =   360
         Width           =   1455
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'Public declarations of variables holding songs, samples and streams
Dim songHandle As Long
Dim sampleHandle As Long
Dim sampleChannel As Long
Dim streamHandle As Long
Dim streamChannel As Long

Private Sub cmdClose_Click()
'You always have to close fmod before exiting your program
FSOUND_Close

'Switch which buttons are enabled
cmdInit.Enabled = True
cmdClose.Enabled = False
cmdOpenSong.Enabled = False
cmdPlaySong.Enabled = False
cmdStopSong.Enabled = False
cmdCloseSong.Enabled = False
cmdOpenStream.Enabled = False
cmdPlayStream.Enabled = False
cmdStopStream.Enabled = False
cmdCloseStream.Enabled = False
cmdOpenSample.Enabled = False
cmdPlaySample.Enabled = False
cmdstopSample.Enabled = False
cmdCloseSample.Enabled = False
End Sub

Private Sub cmdCloseSample_Click()
FSOUND_Sample_Free sampleHandle
'You should manually set the handle to 0 after closing the song
'This way, you can see if the song is loaded or not
sampleHandle = 0

cmdCloseSample.Enabled = False
cmdOpenSample.Enabled = True
cmdPlaySample.Enabled = False
cmdstopSample.Enabled = False
End Sub

Private Sub cmdCloseSong_Click()
FMUSIC_FreeSong songHandle
'You should manually set the handle to 0 after closing the song
'This way, you can see if the song is loaded or not
songHandle = 0

cmdCloseSong.Enabled = False
cmdOpenSong.Enabled = True
cmdPlaySong.Enabled = False
cmdStopSong.Enabled = False
End Sub

Private Sub cmdCloseStream_Click()
FSOUND_Stream_Close streamHandle
'You should manually set the handle to 0 after closing the song
'This way, you can see if the song is loaded or not
streamHandle = 0

cmdCloseStream.Enabled = False
cmdOpenStream.Enabled = True
cmdPlayStream.Enabled = False
cmdStopStream.Enabled = False
End Sub

Private Sub cmdInit_Click()
'This is the first thing you have to do before you can start working with fmod
Dim result As Boolean
result = FSOUND_Init(44100, 32, 0)
If result Then
    'Successfully initialized
    'Update buttons
    cmdInit.Enabled = False
    cmdClose.Enabled = True
    cmdOpenSong.Enabled = True
    cmdOpenStream.Enabled = True
    cmdOpenSample.Enabled = True
Else
    'An error occured
    MsgBox "An error occured initializing fmod!" & vbCrLf & _
        FSOUND_GetErrorString(FSOUND_GetError), vbOKOnly
End If

End Sub

Private Sub cmdOpenSample_Click()
'Samples should be used for things such as sound effects
'Samples are completely loaded into memory when loading
'When you load a compressed file such as an mp3 as a sample
'it will be decompressed first, and then stored to memory

CommonDialog1.Filter = "All Supported Samples (*.wav, *.mp3, *.ogg, *.wma)|*.wav;*.ogg;*.mp3;*.wma"
CommonDialog1.ShowOpen

If Not FileExist(CommonDialog1.filename) Then
    MsgBox "File doesn't exist or no file selected"
    Exit Sub
End If

sampleHandle = FSOUND_Sample_Load(fsound_free, CommonDialog1.filename, FSOUND_NORMAL, 0, 0)

If sampleHandle <> 0 Then
    'Loading was successful
    cmdCloseSample.Enabled = True
    cmdOpenSample.Enabled = False
    cmdPlaySample.Enabled = True
Else
    'Something went wrong
    MsgBox "An error occured opening the sample!" & vbCrLf & _
        FSOUND_GetErrorString(FSOUND_GetError), vbOKOnly
End If

End Sub

Private Sub cmdOpenSong_Click()
'The FMUSIC_* part of fmod handles modules or music files
CommonDialog1.Filter = "All Supported Modules (*.s3m, *.it, *.xm, *.mod)|*.s3m;*.it;*.xm;*.mod"
CommonDialog1.ShowOpen

If Not FileExist(CommonDialog1.filename) Then
    MsgBox "File doesn't exist or no file selected"
    Exit Sub
End If

songHandle = FMUSIC_LoadSong(CommonDialog1.filename)
If songHandle <> 0 Then
    'Loading was successful
    cmdCloseSong.Enabled = True
    cmdOpenSong.Enabled = False
    cmdPlaySong.Enabled = True
Else
    'Something went wrong
    MsgBox "An error occured opening the song!" & vbCrLf & _
        FSOUND_GetErrorString(FSOUND_GetError), vbOKOnly
End If

End Sub

Private Sub cmdOpenStream_Click()
'Streams are not loaded completely into memory
'When playing a stream, fmod loads only the part that is currently playing into memory
'It should be used if you want to play music with fmod

CommonDialog1.Filter = "All Supported Streams (*.wav, *.mp3, *.ogg, *.wma)|*.wav;*.ogg;*.mp3;*.wma"
CommonDialog1.ShowOpen

If Not FileExist(CommonDialog1.filename) Then
    MsgBox "File doesn't exist or no file selected"
    Exit Sub
End If

streamHandle = FSOUND_Stream_Open(CommonDialog1.filename, FSOUND_NORMAL, 0, 0)

If streamHandle <> 0 Then
    'Loading was successful
    cmdCloseStream.Enabled = True
    cmdOpenStream.Enabled = False
    cmdPlayStream.Enabled = True
Else
    'Something went wrong
    MsgBox "An error occured opening the stream!" & vbCrLf & _
        FSOUND_GetErrorString(FSOUND_GetError), vbOKOnly
End If

End Sub

Private Sub cmdPlaySample_Click()
'You should always use FSOUND_FREE as the first paramter
'This lets fmod choose a free channel and play the sample in it
'Each sample can be played more than once if necessary
'If you need to keep track of each sample that is playing,
'You will need as much variables as times you want to play the sample
'to store the sample channels in
sampleChannel = FSOUND_PlaySound(fsound_free, sampleHandle)

If sampleChannel <> 0 Then
    'Playing
    cmdPlaySample.Enabled = False
    cmdstopSample.Enabled = True
Else
    'Something went wrong
    MsgBox "An error occured playing the sample!" & vbCrLf & _
        FSOUND_GetErrorString(FSOUND_GetError), vbOKOnly
End If
End Sub

Private Sub cmdPlaySong_Click()
Dim result As Boolean
result = FMUSIC_PlaySong(songHandle)
If result Then
    'Playing
    cmdPlaySong.Enabled = False
    cmdStopSong.Enabled = True
Else
    'Something went wrong
    MsgBox "An error occured playing the song!" & vbCrLf & _
        FSOUND_GetErrorString(FSOUND_GetError), vbOKOnly
End If
End Sub

Private Sub cmdPlayStream_Click()
'You should always use FSOUND_FREE as the first paramter
'This lets fmod choose a free channel and play the stream in it
'Each stream can be played only once
streamChannel = FSOUND_Stream_Play(fsound_free, streamHandle)

If streamChannel <> 0 Then
    'Playing
    cmdPlayStream.Enabled = False
    cmdStopStream.Enabled = True
Else
    'Something went wrong
    MsgBox "An error occured playing the stream!" & vbCrLf & _
        FSOUND_GetErrorString(FSOUND_GetError), vbOKOnly
End If
End Sub

Private Sub cmdstopSample_Click()
FSOUND_StopSound sampleChannel
'After a sample has been stopped, the channel is not active anymore
sampleChannel = 0

cmdPlaySample.Enabled = True
cmdstopSample.Enabled = False
End Sub

Private Sub cmdStopSong_Click()
FMUSIC_StopSong songHandle
cmdPlaySong.Enabled = True
cmdStopSong.Enabled = False
End Sub

Private Function FileExist(ByVal FileN As String) As Boolean
'This function checks if the given file exists
On Error GoTo errorhandler
If Dir$(FileN) = vbNullString Then FileExist = False Else FileExist = True
If FileN = "" Then FileExist = False
Exit Function
errorhandler:
FileExist = False
End Function

Private Sub cmdStopStream_Click()
FSOUND_Stream_Stop streamHandle
'After a stream has been stopped, the channel is not active anymore
streamChannel = 0

cmdPlayStream.Enabled = True
cmdStopStream.Enabled = False
End Sub
