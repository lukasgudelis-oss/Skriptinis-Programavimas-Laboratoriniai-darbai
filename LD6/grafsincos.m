function varargout = grafsincos(varargin)
if nargin ~= 1
    error('Reikia vieno argumento - vektoriaus-eilutes.')
end
if nargout > 2
    error('Per daug israiskos kintamuju.')
end
v = varargin{1};
s = sin(v);
c = cos(v);
if nargout == 0
    plot(v, s, v, c)
    legend('sin', 'cos')
    grid on
else
    varargout{1} = s;
    if nargout == 2
        varargout{2} = c;
    end
end
end
