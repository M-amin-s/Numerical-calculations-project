function varargout = second(varargin)
% SECOND MATLAB code for second.fig
%      SECOND, by itself, creates a new SECOND or raises the existing
%      singleton*.
%
%      H = SECOND returns the handle to a new SECOND or the handle to
%      the existing singleton*.
%
%      SECOND('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SECOND.M with the given input arguments.
%
%      SECOND('Property','Value',...) creates a new SECOND or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before second_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to second_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help second

% Last Modified by GUIDE v2.5 11-May-2018 20:24:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @second_OpeningFcn, ...
                   'gui_OutputFcn',  @second_OutputFcn, ...
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


% --- Executes just before second is made visible.
function second_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to second (see VARARGIN)

% Choose default command line output for second
    
result_error = varargin{1};
result_parametrical = varargin{2};
set(handles.text64, 'String', result_error(1,1));
set(handles.text65, 'String', result_error(1,7));
set(handles.text66, 'String', result_error(1,5));
set(handles.text67, 'String', result_error(1,3));
set(handles.text68, 'String', result_error(1,9));
set(handles.text69, 'String', result_error(1,11));
set(handles.text70, 'String', result_error(1,2));
set(handles.text71, 'String', result_error(1,4));
set(handles.text72, 'String', result_error(1,6));
set(handles.text73, 'String', result_error(1,8));
set(handles.text74, 'String', result_error(1,10));
set(handles.text75, 'String', result_error(1,12));
set(handles.text61, 'String', result_error(1,14));
set(handles.text62, 'String', result_error(1,15));
set(handles.text63, 'String', result_error(1,13));
set(handles.text77, 'String', result_parametrical);

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes second wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = second_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
