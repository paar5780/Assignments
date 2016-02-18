function varargout = AwesomePossum(varargin)
% AWESOMEPOSSUM MATLAB code for AwesomePossum.fig
%      AWESOMEPOSSUM, by itself, creates a new AWESOMEPOSSUM or raises the existing
%      singleton*.
%
%      H = AWESOMEPOSSUM returns the handle to a new AWESOMEPOSSUM or the handle to
%      the existing singleton*.
%
%      AWESOMEPOSSUM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AWESOMEPOSSUM.M with the given input arguments.
%
%      AWESOMEPOSSUM('Property','Value',...) creates a new AWESOMEPOSSUM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AwesomePossum_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AwesomePossum_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AwesomePossum

% Last Modified by GUIDE v2.5 03-Feb-2016 10:38:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AwesomePossum_OpeningFcn, ...
                   'gui_OutputFcn',  @AwesomePossum_OutputFcn, ...
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


% --- Executes just before AwesomePossum is made visible.
function AwesomePossum_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AwesomePossum (see VARARGIN)

% Create data to plot
handles.peaks = peaks(35);
handles.membrane = membrane;
[x,y] = meshgrid(-8:.5:8);
r = sqrt(x.^2+y.^2) + eps;
sinc = sin(r)./r;
handles.sinc = sinc;

% Set the current data
handles.current_data = handles.peaks;

% Plot the current data
surf(handles.Plotter,handles.current_data);

% Choose default command line output for AwesomePossum
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AwesomePossum wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AwesomePossum_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushSurf.
function pushSurf_Callback(hObject, eventdata, handles)
% hObject    handle to pushSurf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
surf(handles.Plotter,handles.current_data);

% --- Executes on button press in pushMesh.
function pushMesh_Callback(hObject, eventdata, handles)
% hObject    handle to pushMesh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mesh(handles.Plotter,handles.current_data);

% --- Executes on button press in pushContour.
function pushContour_Callback(hObject, eventdata, handles)
% hObject    handle to pushContour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contour(handles.Plotter,handles.current_data);

% --- Executes on selection change in Popup.
function Popup_Callback(hObject, eventdata, handles)
% hObject    handle to Popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Determine the selected data set
str = get(hObject,'String');
val = get(hObject,'Value');

% Set current data to the selected data set
switch str{val}
    case 'peaks'
        handles.current_data = handles.peaks;
    case 'membrane'
        handles.current_data = handles.membrane;
    case 'sinc'
        handles.current_data = handles.sinc;
end

% Save
guidata(hObject,handles);

% Hints: contents = cellstr(get(hObject,'String')) returns Popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Popup


% --- Executes during object creation, after setting all properties.
function Popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
