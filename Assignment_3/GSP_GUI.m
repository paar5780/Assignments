function varargout = GSP_GUI(varargin)
% GSP_GUI MATLAB code for GSP_GUI.fig
%      GSP_GUI, by itself, creates a new GSP_GUI or raises the existing
%      singleton*.
%
%      H = GSP_GUI returns the handle to a new GSP_GUI or the handle to
%      the existing singleton*.
%
%      GSP_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GSP_GUI.M with the given input arguments.
%
%      GSP_GUI('Property','Value',...) creates a new GSP_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GSP_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GSP_GUI_OpeningFcn via varargin.
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Last Modified by GUIDE v2.5 11-Feb-2016 17:50:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GSP_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GSP_GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GSP_GUI is made visible.
function GSP_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GSP_GUI (see VARARGIN)

% Choose default command line output for GSP_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = GSP_GUI_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;



% --- Executes on selection change in PRN.
function PRN_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function PRN_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function samp_f_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function samp_f_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function interf_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function interf_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function T_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function T_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in process.
function process_Callback(hObject, eventdata, handles)
fs = str2double(get(handles.samp_f,'String'))
msec_to_process = str2double(get(handles.T,'String'))
intfreq = str2double(get(handles.interf,'String'))
str = get(handles.PRN,'String'); val = get(handles.PRN,'Value'); 
num = str2double(str); 
prn = num(val)
findandtrack(prn,fs,intfreq,msec_to_process,handles);
set(handles.animate,'backgroundcolor','green')

function avg_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function avg_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in animate.
function animate_Callback(hObject, eventdata, handles)
avg = str2double(get(handles.avg,'String'))
corrplot(avg,handles)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over process.
function process_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to process (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)