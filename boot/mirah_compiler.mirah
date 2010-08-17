# generated by mmeta on Tue Aug 17 14:24:47 PDT 2010
# do not modify, instead edit original .mmeta file
import java.util.ArrayList
import java.util.Date
import java.util.List
import jmeta.*;


import java.util.*;


class MMetaCompiler < BaseParser
  def self.main(args:String[]);
      returns void
      if args.length < 1
          puts "JMetaParser <input> [output]"
          System.exit(2)
      end
      # if args.length > 1 && args[1].equals("--embed")
      #     embed = true
      # end
      if args.length > 1
        output_file = args[1]
      else
        output_file = args[0] + ".mirah"
      end
      input = Utils.readFile(args[0])
      compiler = MMetaCompiler.new
      # compiler.embedded = embed
      parser = JMetaParser.new
      BaseParser.tracing = false
      ast = parser.parse(input)
      BaseParser.tracing = false
      # puts BaseParser.print_r(ast)

      output = String(compiler.parse(ast))
      Utils.writeFile(output_file, output)
      System.exit(0)
    ;end
  def initialize();
      @jpackage = String(nil)
      @embedded = false
      @locals = ArrayList.new
      @methods = ArrayList.new
      @rules = ArrayList.new
      @sname = "ERROR-sname-ERROR"
      @name = "ERROR-name-ERROR"
      @_ = "  "
      @__genc = -1
    ;end
  def reset();
        @locals = ArrayList.new
        @methods = ArrayList.new
        @rules = ArrayList.new
    ;end
  def addLocal(n:Object);
        s = String(n).intern
        @locals.add(s) unless @locals.contains(s)
    ;end
  def localsAsArgs();
      localsAsCall
    ;end
  def localsAsCall();
        join(@locals, ",")
    ;end
  def localsAsInit();
      return '' if @locals.size == 0
      res = join(@locals, " = ") + " = Object(nil)\n"
      @locals.clear
      res
    ;end
  def embedded_set(embedded:boolean);@embeded = embedded;end
  def indent(); @_ = @_ + "  " ;end
  def outdent(); @_ = @_.substring(2) ;end
  def genvar(); "" + (@__genc = @__genc + 1); ;end

  def destruct
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.destruct"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    t = r = Object(nil)
    begin
    begin; _p0=_pos; _t=nil; begin  # and
    _t=self._any();
    t=_t;
    raise SyntaxError.new("", _pos, _string, _list) if _t == BaseParser.__ERROR__
    _push(t); _t=self.apply();
    r=_t;
    raise SyntaxError.new("", _pos, _string, _list) if _t == BaseParser.__ERROR__
    _t=self.__end__();
    raise SyntaxError.new("", _pos, _string, _list) if _t == BaseParser.__ERROR__
    _t=r;
    raise SyntaxError.new("", _pos, _string, _list) if _t == BaseParser.__ERROR__
  end while false; self._pos=_p0 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.destruct", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="destruct" if (_t==BaseParser.__ERROR__); return _t;
  end

  def trans
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.trans"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    r = Object(nil)
    begin
    begin; _p1=_pos; _t=nil; begin  # and
    _t=_listBegin(); if (_t!=BaseParser.__ERROR__)
      _t=self.destruct();
      r=_t;
    _listEnd(); end;
    break if _t == BaseParser.__ERROR__
    _t=r;
    break if _t == BaseParser.__ERROR__
  end while false; self._pos=_p1 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.trans", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="trans" if (_t==BaseParser.__ERROR__); return _t;
  end

  def HList
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.HList"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    ls = Object(nil)
    begin
    begin; _p3=_pos; _t=nil; begin  # and
    as2 = ArrayList.new
    while true  # many
    _t=self.trans();
    if (_t==BaseParser.__ERROR__); break; else as2.add(_t);nil;end
    end; _t=as2

    ls=_t;
    break if _t == BaseParser.__ERROR__
    _t=(
      if List(ls).size == 0
        "ArrayList.new"
      else
        "[#{join(ls, ", ")}]"
      end
    );
    break if _t == BaseParser.__ERROR__
  end while false; self._pos=_p3 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.HList", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="HList" if (_t==BaseParser.__ERROR__); return _t;
  end

  def HConcat
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.HConcat"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    l = r = Object(nil)
    begin
    begin; _p4=_pos; _t=nil; begin  # and
    _t=self.trans();
    l=_t;
    break if _t == BaseParser.__ERROR__
    _t=self.trans();
    r=_t;
    break if _t == BaseParser.__ERROR__
    _t="concat(#{l}, #{r})";
    break if _t == BaseParser.__ERROR__
  end while false; self._pos=_p4 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.HConcat", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="HConcat" if (_t==BaseParser.__ERROR__); return _t;
  end

  def HStr
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.HStr"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    c = Object(nil)
    begin
    begin; _p5=_pos; _t=nil; begin  # and
    _t=self._any();
    c=_t;
    break if _t == BaseParser.__ERROR__
    _t="\"#{c}\"";
    break if _t == BaseParser.__ERROR__
  end while false; self._pos=_p5 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.HStr", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="HStr" if (_t==BaseParser.__ERROR__); return _t;
  end

  def HLit
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.HLit"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    c = Object(nil)
    begin
    begin; _p6=_pos; _t=nil; begin  # and
    _t=self._any();
    c=_t;
    break if _t == BaseParser.__ERROR__
    _t=c;
    break if _t == BaseParser.__ERROR__
  end while false; self._pos=_p6 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.HLit", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="HLit" if (_t==BaseParser.__ERROR__); return _t;
  end

  def Node
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.Node"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    n = c = Object(nil)
    begin
    begin; _p7=_pos; _t=nil; begin  # and
    _t=self._any();
    n=_t;
    break if _t == BaseParser.__ERROR__
    _t=self.trans();
    c=_t;
    break if _t == BaseParser.__ERROR__
    _t="build_node('#{n}', #{c}, _real_start > 1 ? _real_start : _start, _pos)";
    break if _t == BaseParser.__ERROR__
  end while false; self._pos=_p7 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.Node", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="Node" if (_t==BaseParser.__ERROR__); return _t;
  end

  def Error
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.Error"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    msg = Object(nil)
    begin
    begin; _p8=_pos; _t=nil; begin  # and
    _t=self._any();
    msg=_t;
    break if _t == BaseParser.__ERROR__
    _t=(
        DoError.new(msg);
    );
    break if _t == BaseParser.__ERROR__
  end while false; self._pos=_p8 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.Error", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="Error" if (_t==BaseParser.__ERROR__); return _t;
  end

  def Set
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.Set"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    n = x = Object(nil)
    begin
    begin; _p9=_pos; _t=nil; begin  # and
    _t=self._any();
    n=_t;
    break if _t == BaseParser.__ERROR__
    _t=self.trans();
    x=_t;
    break if _t == BaseParser.__ERROR__
    _t=(
        addLocal(n);
        "#{x}\n#{@_}#{n}=_t;"
    );
    break if _t == BaseParser.__ERROR__
  end while false; self._pos=_p9 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.Set", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="Set" if (_t==BaseParser.__ERROR__); return _t;
  end

  def Str
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.Str"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    s = Object(nil)
    begin
    begin; _p10=_pos; _t=nil; begin  # and
    _t=self._any();
    s=_t;
    break if _t == BaseParser.__ERROR__
    _t="_t=_str(\"#{s}\");";
    break if _t == BaseParser.__ERROR__
  end while false; self._pos=_p10 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.Str", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="Str" if (_t==BaseParser.__ERROR__); return _t;
  end

  def Sym
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.Sym"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    s = Object(nil)
    begin
    begin; _p11=_pos; _t=nil; begin  # and
    _t=self._any();
    s=_t;
    break if _t == BaseParser.__ERROR__
    _t="_t=_sym(\"#{s}\");";
    break if _t == BaseParser.__ERROR__
  end while false; self._pos=_p11 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.Sym", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="Sym" if (_t==BaseParser.__ERROR__); return _t;
  end

  def App
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.App"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    rule = args = Object(nil)
    begin
    _t=BaseParser.__ERROR__; begin  # or
    begin; _p13=_pos; _t=nil; begin  # and
      _t=_sym("super");
      break if _t == BaseParser.__ERROR__
      _t=self._any();
      rule=_t;
      break if _t == BaseParser.__ERROR__
      as12 = ArrayList.new
      _t=self.trans();
      if (_t!=BaseParser.__ERROR__)
        as12.add(_t)
        while true  # many
        _t=self.trans();
        if (_t==BaseParser.__ERROR__); break; else as12.add(_t);nil;end
        end; _t=as12

      end

      args=_t;
      break if _t == BaseParser.__ERROR__
      _t=(
        arg_str = if List(args).size == 1
          join(args, ", ")
        else
          "ArrayList.new([#{join(args, ", ")}]).toArray"
        end
        "_push(#{arg_str}); _t=super();"
    );
      break if _t == BaseParser.__ERROR__
    end while false; self._pos=_p13 if (_t==BaseParser.__ERROR__); end

    break unless _t == BaseParser.__ERROR__

    begin; _p14=_pos; _t=nil; begin  # and
      _t=_sym("super");
      break if _t == BaseParser.__ERROR__
      _t=self._any();
      rule=_t;
      break if _t == BaseParser.__ERROR__
      _t="_t=super();";
      break if _t == BaseParser.__ERROR__
    end while false; self._pos=_p14 if (_t==BaseParser.__ERROR__); end

    break unless _t == BaseParser.__ERROR__

    begin; _p16=_pos; _t=nil; begin  # and
      _t=self._any();
      rule=_t;
      break if _t == BaseParser.__ERROR__
      as15 = ArrayList.new
      _t=self.trans();
      if (_t!=BaseParser.__ERROR__)
        as15.add(_t)
        while true  # many
        _t=self.trans();
        if (_t==BaseParser.__ERROR__); break; else as15.add(_t);nil;end
        end; _t=as15

      end

      args=_t;
      break if _t == BaseParser.__ERROR__
      _t=(
        arg_str = if List(args).size == 1
          join(args, ", ")
        else
          "ArrayList.new([#{join(args, ", ")}]).toArray"
        end
        "_push(#{arg_str}); _t=self.#{rule}();"
    );
      break if _t == BaseParser.__ERROR__
    end while false; self._pos=_p16 if (_t==BaseParser.__ERROR__); end

    break unless _t == BaseParser.__ERROR__

    begin; _p17=_pos; _t=nil; begin  # and
      _t=self._any();
      rule=_t;
      break if _t == BaseParser.__ERROR__
      _t="_t=self.#{rule}();";
      break if _t == BaseParser.__ERROR__
    end while false; self._pos=_p17 if (_t==BaseParser.__ERROR__); end

    break unless _t == BaseParser.__ERROR__
  end while false

    _t=_memoize("MMetaCompiler.App", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="App" if (_t==BaseParser.__ERROR__); return _t;
  end

  def Dot
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.Dot"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
        begin
    _t="if _start == _pos;_t=ws();_real_start=_pos;nil;else;_t=ws();end;";
    _t=_memoize("MMetaCompiler.Dot", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="Dot" if (_t==BaseParser.__ERROR__); return _t;
  end

  def SAct
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.SAct"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    expr = Object(nil)
    begin
    begin; _p18=_pos; _t=nil; begin  # and
    _t=self.trans();
    expr=_t;
    break if _t == BaseParser.__ERROR__
    _t="_t=#{expr};";
    break if _t == BaseParser.__ERROR__
  end while false; self._pos=_p18 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.SAct", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="SAct" if (_t==BaseParser.__ERROR__); return _t;
  end

  def Act
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.Act"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    expr = Object(nil)
    begin
    begin; _p19=_pos; _t=nil; begin  # and
    _t=self._any();
    expr=_t;
    break if _t == BaseParser.__ERROR__
    _t="_t=(#{expr});";
    break if _t == BaseParser.__ERROR__
  end while false; self._pos=_p19 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.Act", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="Act" if (_t==BaseParser.__ERROR__); return _t;
  end

  def Pred
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.Pred"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    expr = Object(nil)
    begin
    begin; _p20=_pos; _t=nil; begin  # and
    _t=self._any();
    expr=_t;
    break if _t == BaseParser.__ERROR__
    _t="_t = (#{expr}) ? nil : BaseParser.__ERROR__;";
    break if _t == BaseParser.__ERROR__
  end while false; self._pos=_p20 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.Pred", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="Pred" if (_t==BaseParser.__ERROR__); return _t;
  end

  def Or
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.Or"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    x = xs = Object(nil)
    begin
    begin; _p23=_pos; _t=nil; begin  # and
    _t=self.indent();
    break if _t == BaseParser.__ERROR__
    as22 = ArrayList.new
    while true  # many
    begin; _p21=_pos; _t=nil; begin  # and
        _t=self.trans();
        x=_t;
        break if _t == BaseParser.__ERROR__
        _t="#{@_}#{x}\n#{@_}break unless _t == BaseParser.__ERROR__\n";
        break if _t == BaseParser.__ERROR__
      end while false; self._pos=_p21 if (_t==BaseParser.__ERROR__); end

    if (_t==BaseParser.__ERROR__); break; else as22.add(_t);nil;end
    end; _t=as22

    xs=_t;
    break if _t == BaseParser.__ERROR__
    _t=( "_t=BaseParser.__ERROR__; begin  # or\n#{join(xs, "\n")}#{outdent}end while false\n" );
    break if _t == BaseParser.__ERROR__
  end while false; self._pos=_p23 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.Or", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="Or" if (_t==BaseParser.__ERROR__); return _t;
  end

  def And
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.And"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    ts = Object(nil)
    begin
    _t=BaseParser.__ERROR__; begin  # or
    begin; _p25=_pos; _t=nil; begin  # and
      _t=self.indent();
      break if _t == BaseParser.__ERROR__
      as24 = ArrayList.new
      _t=self.trans();
      if (_t!=BaseParser.__ERROR__)
        as24.add(_t)
        while true  # many
        _t=self.trans();
        if (_t==BaseParser.__ERROR__); break; else as24.add(_t);nil;end
        end; _t=as24

      end

      ts=_t;
      break if _t == BaseParser.__ERROR__
      _t=(
        var = genvar
        err = null
        xs = List(ts)
        b = "begin; _p#{var}=_pos; _t=nil; begin  # and\n"
        xs.each do |x|
          if x.kind_of?(DoError)
            err = DoError(x).message
            next
          end
          b = if err.nil?
            "#{b}#{@_}#{x}\n#{@_}break if _t == BaseParser.__ERROR__\n"
          else
            "#{b}#{@_}#{x}\n#{@_}raise SyntaxError.new(\"#{err}\", _pos, _string, _list) if _t == BaseParser.__ERROR__\n"
          end
        end
        outdent();
        "#{b}#{@_}end while false; self._pos=_p#{var} if (_t==BaseParser.__ERROR__); end\n"
    );
      break if _t == BaseParser.__ERROR__
    end while false; self._pos=_p25 if (_t==BaseParser.__ERROR__); end

    break unless _t == BaseParser.__ERROR__

    _t="";
    break unless _t == BaseParser.__ERROR__
  end while false

    _t=_memoize("MMetaCompiler.And", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="And" if (_t==BaseParser.__ERROR__); return _t;
  end
  def makeMany(x:Object, many1:boolean);
        var = genvar
        b = "as#{var} = ArrayList.new\n"
        if (many1)
          b = "#{b}#{@_}#{x}\n#{@_}if (_t!=BaseParser.__ERROR__)\n#{indent}as#{var}.add(_t)\n"
        end

        b = "#{b}#{@_}while true  # many\n" +
            "#{@_}#{x}\n" +
            "#{@_}if (_t==BaseParser.__ERROR__); break; else as#{var}.add(_t);nil;end\n" +
            "#{@_}end; _t=as#{var}\n"

        if (many1)
          b= "#{b}\n#{outdent}end\n"
        end
        b;
    ;end

  def Many
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.Many"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    x = Object(nil)
    begin
    begin; _p26=_pos; _t=nil; begin  # and
    _t=self.indent();
    break if _t == BaseParser.__ERROR__
    _t=self.trans();
    x=_t;
    break if _t == BaseParser.__ERROR__
    _t=self.outdent();
    break if _t == BaseParser.__ERROR__
    _t=( makeMany(x, false) );
    break if _t == BaseParser.__ERROR__
  end while false; self._pos=_p26 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.Many", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="Many" if (_t==BaseParser.__ERROR__); return _t;
  end

  def Many1
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.Many1"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    x = Object(nil)
    begin
    begin; _p27=_pos; _t=nil; begin  # and
    _t=self.indent();
    break if _t == BaseParser.__ERROR__
    _t=self.trans();
    x=_t;
    break if _t == BaseParser.__ERROR__
    _t=self.outdent();
    break if _t == BaseParser.__ERROR__
    _t=( makeMany(x, true)  );
    break if _t == BaseParser.__ERROR__
  end while false; self._pos=_p27 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.Many1", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="Many1" if (_t==BaseParser.__ERROR__); return _t;
  end

  def Opt
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.Opt"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    x = Object(nil)
    begin
    begin; _p28=_pos; _t=nil; begin  # and
    _t=self.indent();
    break if _t == BaseParser.__ERROR__
    _t=self.trans();
    x=_t;
    break if _t == BaseParser.__ERROR__
    _t=self.outdent();
    break if _t == BaseParser.__ERROR__
    _t="#{x}\n#{@_}_t=(_string.nil? ? \"\" : nil) if _t == BaseParser.__ERROR__;";
    break if _t == BaseParser.__ERROR__
  end while false; self._pos=_p28 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.Opt", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="Opt" if (_t==BaseParser.__ERROR__); return _t;
  end

  def Not
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.Not"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    x = Object(nil)
    begin
    begin; _p29=_pos; _t=nil; begin  # and
    _t=self.trans();
    x=_t;
    break if _t == BaseParser.__ERROR__
    _t="#{@_}#{x}\n_t = (_t == BaseParser.__ERROR__ ? Object(Boolean.valueOf(true)) : BaseParser.__ERROR__);";
    break if _t == BaseParser.__ERROR__
  end while false; self._pos=_p29 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.Not", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="Not" if (_t==BaseParser.__ERROR__); return _t;
  end

  def Peek
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.Peek"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    x = Object(nil)
    begin
    begin; _p30=_pos; _t=nil; begin  # and
    _t=self.trans();
    x=_t;
    break if _t == BaseParser.__ERROR__
    _t=(
      var = genvar
      
      "begin\n#{indent}_l#{var}=_pos\n#{@_}#{x}\n#{@_}self._pos=_l#{var} if (_t!=BaseParser.__ERROR__)\n#{outdent}end\n"
    );
    break if _t == BaseParser.__ERROR__
  end while false; self._pos=_p30 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.Peek", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="Peek" if (_t==BaseParser.__ERROR__); return _t;
  end

  def List
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.List"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    x = Object(nil)
    begin
    begin; _p31=_pos; _t=nil; begin  # and
    _t=self.indent();
    break if _t == BaseParser.__ERROR__
    _t=self.trans();
    x=_t;
    break if _t == BaseParser.__ERROR__
    _t=self.outdent();
    break if _t == BaseParser.__ERROR__
    _t="_t=_listBegin(); if (_t!=BaseParser.__ERROR__)\n#{@_}  #{x}\n#{@_}_listEnd(); end;";
    break if _t == BaseParser.__ERROR__
  end while false; self._pos=_p31 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.List", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="List" if (_t==BaseParser.__ERROR__); return _t;
  end

  def Rule
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.Rule"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    n = b = Object(nil)
    begin
    begin; _p32=_pos; _t=nil; begin  # and
    _t=self._any();
    n=_t;
    break if _t == BaseParser.__ERROR__
    _t=self.trans();
    b=_t;
    break if _t == BaseParser.__ERROR__
    _t=(
      @rules.add(n)
      "
  def #{n}
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve(\"#{@name}.#{n}\"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    #{localsAsInit}    begin
    #{b}
    _t=_memoize(\"#{@name}.#{n}\", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last=\"#{n}\" if (_t==BaseParser.__ERROR__); return _t;
  end
"
    );
    break if _t == BaseParser.__ERROR__
  end while false; self._pos=_p32 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.Rule", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="Rule" if (_t==BaseParser.__ERROR__); return _t;
  end

  def Scope
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.Scope"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    names = body = Object(nil)
    begin
    begin; _p33=_pos; _t=nil; begin  # and
    _t=self._any();
    names=_t;
    break if _t == BaseParser.__ERROR__
    _t=self.indent();
    break if _t == BaseParser.__ERROR__
    _t=self.trans();
    body=_t;
    break if _t == BaseParser.__ERROR__
    _t=self.outdent();
    break if _t == BaseParser.__ERROR__
    _t=(
      pre = StringBuilder.new
      post = StringBuilder.new
      l = Object[].cast(names)
      l.each do |_name|
        name = String(_name)
        saved = "__saved_#{name.replace('@', '')}"
        pre.append("#@_#{saved} = #{name}\n")
        post.append("#@_  #{name} = #{saved}\n")
      end
      "#{pre}#{@_}begin\n#{@_}#{body}\n#{@_}ensure\n#{post}#{@_}end\n"
    );
    break if _t == BaseParser.__ERROR__
  end while false; self._pos=_p33 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.Scope", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="Scope" if (_t==BaseParser.__ERROR__); return _t;
  end

  def Parser
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.Parser"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    p = n = s = xs = Object(nil)
    begin
    begin; _p35=_pos; _t=nil; begin  # and
    _t=self._any();
    p=_t;
    break if _t == BaseParser.__ERROR__
    _t=self._any();
    n=_t;
    break if _t == BaseParser.__ERROR__
    _t=self._any();
    s=_t;
    break if _t == BaseParser.__ERROR__
    _t=( @name = String(n); @sname = String(s); nil );
    break if _t == BaseParser.__ERROR__
    as34 = ArrayList.new
    while true  # many
    _t=self.trans();
    if (_t==BaseParser.__ERROR__); break; else as34.add(_t);nil;end
    end; _t=as34

    xs=_t;
    break if _t == BaseParser.__ERROR__
    _t=(
        b = "\nclass #{@name} < #{@sname}\n" +
            join(xs) + "\n" + join(@methods) + "\n" +
            "  def _jump(r:string)\n"

        @rules.each do |r|
          b = "#{b}    return #{r}() if (r==\"#{r}\")\n"
        end
        b = b +
            "    super(r)\n" +
            "  end\n" +
            "  def _has(r:string)\n"

        @rules.each do |r|
          b = b + "    return true if r==\"#{r}\"\n"
        end

        b = b +
            "    super(r)\n" +
            "  end\n" +
            "end\n"
        reset
        b
    );
    break if _t == BaseParser.__ERROR__
  end while false; self._pos=_p35 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.Parser", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="Parser" if (_t==BaseParser.__ERROR__); return _t;
  end

  def Method
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.Method"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    c = Object(nil)
    begin
    begin; _p36=_pos; _t=nil; begin  # and
    _t=self._any();
    c=_t;
    break if _t == BaseParser.__ERROR__
    _t="  #{c}\n";
    break if _t == BaseParser.__ERROR__
  end while false; self._pos=_p36 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.Method", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="Method" if (_t==BaseParser.__ERROR__); return _t;
  end

  def Field
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.Field"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    c = Object(nil)
    begin
    begin; _p37=_pos; _t=nil; begin  # and
    _t=self._any();
    c=_t;
    break if _t == BaseParser.__ERROR__
    _t="  #{c}\n";
    break if _t == BaseParser.__ERROR__
  end while false; self._pos=_p37 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.Field", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="Field" if (_t==BaseParser.__ERROR__); return _t;
  end

  def Package
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.Package"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    c = Object(nil)
    begin
    begin; _p38=_pos; _t=nil; begin  # and
    _t=self._any();
    c=_t;
    break if _t == BaseParser.__ERROR__
    _t=( @jpackage = String(c); ""; );
    break if _t == BaseParser.__ERROR__
  end while false; self._pos=_p38 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.Package", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="Package" if (_t==BaseParser.__ERROR__); return _t;
  end

  def Import
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.Import"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    c = Object(nil)
    begin
    begin; _p39=_pos; _t=nil; begin  # and
    _t=self._any();
    c=_t;
    break if _t == BaseParser.__ERROR__
    _t=c;
    break if _t == BaseParser.__ERROR__
  end while false; self._pos=_p39 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.Import", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="Import" if (_t==BaseParser.__ERROR__); return _t;
  end

  def Class
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.Class"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    q = d = c = Object(nil)
    begin
    begin; _p40=_pos; _t=nil; begin  # and
    _t=self._any();
    q=_t;
    break if _t == BaseParser.__ERROR__
    _t=self._any();
    d=_t;
    break if _t == BaseParser.__ERROR__
    _t=self._any();
    c=_t;
    break if _t == BaseParser.__ERROR__
    _t="#{d}\n#{c}\nend";
    break if _t == BaseParser.__ERROR__
  end while false; self._pos=_p40 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.Class", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="Class" if (_t==BaseParser.__ERROR__); return _t;
  end

  def Line
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.Line"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    ws = x = Object(nil)
    begin
    begin; _p41=_pos; _t=nil; begin  # and
    _t=self._any();
    ws=_t;
    break if _t == BaseParser.__ERROR__
    _t=self.trans();
    x=_t;
    break if _t == BaseParser.__ERROR__
    _t=( ws.toString + x.toString );
    break if _t == BaseParser.__ERROR__
  end while false; self._pos=_p41 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.Line", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="Line" if (_t==BaseParser.__ERROR__); return _t;
  end

  def File
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.File"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    xs = Object(nil)
    begin
    begin; _p43=_pos; _t=nil; begin  # and
    as42 = ArrayList.new
    while true  # many
    _t=self.trans();
    if (_t==BaseParser.__ERROR__); break; else as42.add(_t);nil;end
    end; _t=as42

    xs=_t;
    break if _t == BaseParser.__ERROR__
    _t=(
        "# generated by mmeta on #{Date.new}\n" +
        "# do not modify, instead edit original .mmeta file\n" +
        "import java.util.ArrayList\n" +
        "import java.util.Date\n" +
        "import java.util.List\n" +
        (@embedded ? "" : "import jmeta.*;\n") + join(xs)
    );
    break if _t == BaseParser.__ERROR__
  end while false; self._pos=_p43 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.File", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="File" if (_t==BaseParser.__ERROR__); return _t;
  end

  def start
    _t=Object(nil); _start=_pos; _real_start=-1;
    _t=_retrieve("MMetaCompiler.start"); return _t if (_t!=BaseParser.__NOT_MEMOIZED__)
    r = Object(nil)
    begin
    begin; _p44=_pos; _t=nil; begin  # and
    _t=self.destruct();
    r=_t;
    raise SyntaxError.new("", _pos, _string, _list) if _t == BaseParser.__ERROR__
    _t=self.__end__();
    raise SyntaxError.new("", _pos, _string, _list) if _t == BaseParser.__ERROR__
    _t=r;
    raise SyntaxError.new("", _pos, _string, _list) if _t == BaseParser.__ERROR__
  end while false; self._pos=_p44 if (_t==BaseParser.__ERROR__); end

    _t=_memoize("MMetaCompiler.start", _start, _t);
    end while (_t==BaseParser.__GROW__); BaseParser.__ERROR__.last="start" if (_t==BaseParser.__ERROR__); return _t;
  end


  def _jump(r:string)
    return destruct() if (r=="destruct")
    return trans() if (r=="trans")
    return HList() if (r=="HList")
    return HConcat() if (r=="HConcat")
    return HStr() if (r=="HStr")
    return HLit() if (r=="HLit")
    return Node() if (r=="Node")
    return Error() if (r=="Error")
    return Set() if (r=="Set")
    return Str() if (r=="Str")
    return Sym() if (r=="Sym")
    return App() if (r=="App")
    return Dot() if (r=="Dot")
    return SAct() if (r=="SAct")
    return Act() if (r=="Act")
    return Pred() if (r=="Pred")
    return Or() if (r=="Or")
    return And() if (r=="And")
    return Many() if (r=="Many")
    return Many1() if (r=="Many1")
    return Opt() if (r=="Opt")
    return Not() if (r=="Not")
    return Peek() if (r=="Peek")
    return List() if (r=="List")
    return Rule() if (r=="Rule")
    return Scope() if (r=="Scope")
    return Parser() if (r=="Parser")
    return Method() if (r=="Method")
    return Field() if (r=="Field")
    return Package() if (r=="Package")
    return Import() if (r=="Import")
    return Class() if (r=="Class")
    return Line() if (r=="Line")
    return File() if (r=="File")
    return start() if (r=="start")
    super(r)
  end
  def _has(r:string)
    return true if r=="destruct"
    return true if r=="trans"
    return true if r=="HList"
    return true if r=="HConcat"
    return true if r=="HStr"
    return true if r=="HLit"
    return true if r=="Node"
    return true if r=="Error"
    return true if r=="Set"
    return true if r=="Str"
    return true if r=="Sym"
    return true if r=="App"
    return true if r=="Dot"
    return true if r=="SAct"
    return true if r=="Act"
    return true if r=="Pred"
    return true if r=="Or"
    return true if r=="And"
    return true if r=="Many"
    return true if r=="Many1"
    return true if r=="Opt"
    return true if r=="Not"
    return true if r=="Peek"
    return true if r=="List"
    return true if r=="Rule"
    return true if r=="Scope"
    return true if r=="Parser"
    return true if r=="Method"
    return true if r=="Field"
    return true if r=="Package"
    return true if r=="Import"
    return true if r=="Class"
    return true if r=="Line"
    return true if r=="File"
    return true if r=="start"
    super(r)
  end
end
