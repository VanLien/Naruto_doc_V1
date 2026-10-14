<GameFile>
  <PropertyGroup Name="action_time_skin_summon_panel" Type="Layer" ID="pk-gsfw81mru9acdlzxe63q2vjtn5yhbo74i" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.000000">
      </Animation>
      <ObjectData Name="root_wnd" ctype="GameNodeObjectData">
        <Size X="720.000000" Y="848.000000" />
        <Children>
          <AbstractNodeData Name="main_container" ActionTag="-2111294981" Tag="229" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size Y="848" X="720" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360" Y="424" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="255" G="200" R="150" />
            <Children>
              <AbstractNodeData Name="bg" ActionTag="887972902" Tag="230" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" LeftEage="15" RightEage="15" TopEage="15" BottomEage="15" Scale9OriginX="15" Scale9OriginY="15" Scale9Width="16" Scale9Height="16" ctype="ImageViewObjectData">
                <Size Y="848" X="720" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="360" Y="424" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="Default" Path="Default/ImageFile.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="Text_1" ActionTag="2080145405" Tag="47" RotationSkewX="0" RotationSkewY="0" LeftMargin="261.501709" RightMargin="369.498291" TopMargin="807" BottomMargin="15" FontSize="20" LabelText="活动时间:" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="26" X="89" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="306.001709" Y="28" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="224" G="245" R="250" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="0" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="count_down" ActionTag="-1645986674" Tag="233" RotationSkewX="0" RotationSkewY="0" LeftMargin="354.007996" RightMargin="243.992004" TopMargin="807" BottomMargin="15" FontSize="20" LabelText="8月13~8月20" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="26" X="122" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="415.007996" Y="28" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="224" G="245" R="250" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="0" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="Text_29" ActionTag="1673903716" Tag="108" RotationSkewX="0" RotationSkewY="0" LeftMargin="534" RightMargin="94" TopMargin="807" BottomMargin="15" FontSize="20" LabelText="钻石次数：" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="26" X="92" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="580" Y="28" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="224" G="245" R="250" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="0" />
                <ShadowColor A="255" B="110" G="110" R="110" />
                <Children>
                  <AbstractNodeData Name="limit_count" ActionTag="1673373506" Tag="109" RotationSkewX="0" RotationSkewY="0" LeftMargin="93.001198" RightMargin="-47.001202" TopMargin="0" BottomMargin="0" FontSize="20" LabelText="0/20" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="26" X="46" />
                    <AnchorPoint ScaleX="0" ScaleY="0.5" />
                    <Position X="93.001198" Y="13" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="224" G="245" R="250" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="0" G="0" R="0" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="progress_panel" Visible="False" ActionTag="-1348727131" Tag="234" RotationSkewX="0" RotationSkewY="0" LeftMargin="480" RightMargin="79.757797" TopMargin="63.993599" BottomMargin="771.993591" BackColorAlpha="102" LeftEage="72" RightEage="72" TopEage="28" BottomEage="28" Scale9OriginX="72" Scale9OriginY="28" Scale9Width="76" Scale9Height="30" ctype="PanelObjectData">
                <Size Y="12.0128" X="160.242203" />
                <AnchorPoint ScaleX="0" ScaleY="0.5" />
                <Position X="480" Y="778" />
                <Scale ScaleX="1.1" ScaleY="1.1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="timesummon_1016.png" Plist="resource/timesummon/timesummon.plist" />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
                <Children>
                  <AbstractNodeData Name="progress_bg" ActionTag="448729031" Tag="236" RotationSkewX="0" RotationSkewY="0" LeftMargin="50" RightMargin="-19.757799" TopMargin="-3.4869" BottomMargin="0.4997" LeftEage="7" RightEage="7" TopEage="6" BottomEage="6" Scale9OriginX="7" Scale9OriginY="6" Scale9Width="9" Scale9Height="7" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="15" X="130" />
                    <AnchorPoint ScaleX="0" ScaleY="0.5" />
                    <Position X="50" Y="7.9997" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_90005.png" Plist="resource/common/common.plist" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="progress" ActionTag="452751830" Tag="237" RotationSkewX="0" RotationSkewY="0" LeftMargin="50.000099" RightMargin="-19.7579" TopMargin="-2.4868" BottomMargin="-0.5004" ProgressInfo="76" ctype="LoadingBarObjectData">
                    <Size Y="15" X="130" />
                    <AnchorPoint ScaleX="0" ScaleY="0.5" />
                    <Position X="50.000099" Y="6.9996" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <ImageFileData Type="PlistSubImage" Path="common_90006.png" Plist="resource/common/common.plist" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="Text_27" Visible="False" ActionTag="-1405606642" Tag="388" RotationSkewX="0" RotationSkewY="0" LeftMargin="527.5" RightMargin="103.5" TopMargin="30.0012" BottomMargin="765.998779" FontSize="20" LabelText="下一阶段:
" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="52" X="89" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="572" Y="791.998779" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="0" />
                <ShadowColor A="255" B="110" G="110" R="110" />
                <Children>
                  <AbstractNodeData Name="guarantee_count" ActionTag="1415899665" Tag="389" RotationSkewX="0" RotationSkewY="0" LeftMargin="90" RightMargin="-58" TopMargin="0" BottomMargin="26" FontSize="20" LabelText="12/12" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="26" X="57" />
                    <AnchorPoint ScaleX="0" ScaleY="0.5" />
                    <Position X="90" Y="39" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="0" G="0" R="0" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="show_battle_btn" ActionTag="1553363588" Tag="48" RotationSkewX="0" RotationSkewY="0" LeftMargin="18.5" RightMargin="626.5" TopMargin="277.5" BottomMargin="495.5" TouchEnable="True" LeftEage="24" RightEage="24" TopEage="24" BottomEage="24" Scale9OriginX="24" Scale9OriginY="24" Scale9Width="27" Scale9Height="27" ctype="ImageViewObjectData">
                <Size Y="75" X="75" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="56" Y="533" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="timesummon_1010.png" Plist="resource/timesummon/timesummon.plist" />
                <Children>
                  <AbstractNodeData Name="Text_2" ActionTag="1589659944" Tag="49" RotationSkewX="0" RotationSkewY="0" LeftMargin="-1" RightMargin="-1" TopMargin="63.5" BottomMargin="-11.5" FontSize="18" LabelText="战斗预览" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="23" X="77" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="37.5" Y="0" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="190" G="231" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="0" G="0" R="0" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="shop_btn" ActionTag="-1105981071" Tag="378" RotationSkewX="0" RotationSkewY="0" LeftMargin="18.500799" RightMargin="626.499207" TopMargin="177.5" BottomMargin="595.5" TouchEnable="True" LeftEage="24" RightEage="24" TopEage="24" BottomEage="24" Scale9OriginX="24" Scale9OriginY="24" Scale9Width="27" Scale9Height="27" ctype="ImageViewObjectData">
                <Size Y="75" X="75" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="56.000801" Y="633" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="timesummon_1011.png" Plist="resource/timesummon/timesummon.plist" />
                <Children>
                  <AbstractNodeData Name="Text_23" ActionTag="-950014710" Tag="379" RotationSkewX="0" RotationSkewY="0" LeftMargin="-1" RightMargin="-1" TopMargin="63.5" BottomMargin="-11.5" FontSize="18" LabelText="兑换商店" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="23" X="77" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="37.5" Y="0" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="190" G="231" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="0" G="0" R="0" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="show_reward" ActionTag="-12279552" Tag="382" RotationSkewX="0" RotationSkewY="0" LeftMargin="18.5" RightMargin="626.5" TopMargin="77.5" BottomMargin="695.5" TouchEnable="True" LeftEage="24" RightEage="24" TopEage="24" BottomEage="24" Scale9OriginX="24" Scale9OriginY="24" Scale9Width="27" Scale9Height="27" ctype="ImageViewObjectData">
                <Size Y="75" X="75" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="56" Y="733" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="timesummon_1009.png" Plist="resource/timesummon/timesummon.plist" />
                <Children>
                  <AbstractNodeData Name="Text_24" ActionTag="-1155342689" Tag="383" RotationSkewX="0" RotationSkewY="0" LeftMargin="-1" RightMargin="-1" TopMargin="63.5" BottomMargin="-11.5" FontSize="18" LabelText="奖励预览" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="23" X="77" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="37.5" Y="0" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="190" G="231" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="0" G="0" R="0" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="summon_once" ActionTag="-1042362051" Tag="380" RotationSkewX="0" RotationSkewY="0" LeftMargin="58.000198" RightMargin="381.999786" TopMargin="715.99939" BottomMargin="44.000599" TouchEnable="True" LeftEage="102" RightEage="102" TopEage="42" BottomEage="42" Scale9OriginX="102" Scale9OriginY="42" Scale9Width="4" Scale9Height="4" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="88" X="280" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="198.000198" Y="88.000603" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="timesummon_1012.png" Plist="resource/timesummon/timesummon.plist" />
                <Children>
                  <AbstractNodeData Name="Text_25" ActionTag="-1326461719" Tag="385" RotationSkewX="0" RotationSkewY="0" LeftMargin="84" RightMargin="84" TopMargin="6.9999" BottomMargin="45.000099" FontSize="30" LabelText="祈愿1次" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="36" X="112" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="140" Y="63.000099" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="5" G="55" R="130" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="Image_43" ActionTag="2026302066" Tag="390" RotationSkewX="0" RotationSkewY="0" LeftMargin="70" RightMargin="70" TopMargin="44.5" BottomMargin="14.5" LeftEage="5" RightEage="5" TopEage="9" BottomEage="9" Scale9OriginX="5" Scale9OriginY="9" Scale9Width="8" Scale9Height="11" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="29" X="140" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="140" Y="29" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="timesummon_1007.png" Plist="resource/timesummon/timesummon.plist" />
                    <Children>
                      <AbstractNodeData Name="ticket_img" ActionTag="-1363664125" Tag="123" RotationSkewX="0" RotationSkewY="0" LeftMargin="25.999701" RightMargin="68.000298" TopMargin="-9" BottomMargin="-8" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                        <Size Y="46" X="46" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="48.999699" Y="15" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="Default" Path="Default/Sprite.png" Plist="" />
                        <BlendFunc Dst="771" Src="1" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="free_summon" Visible="False" ActionTag="-173274257" Tag="131" RotationSkewX="0" RotationSkewY="0" LeftMargin="27.5" RightMargin="27.5" TopMargin="1.5" BottomMargin="1.5" FontSize="20" LabelText="免费祈愿" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="26" X="85" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="70" Y="14.5" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="0" G="0" R="0" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="ticket_num" ActionTag="-740013213" Tag="393" RotationSkewX="0" RotationSkewY="0" LeftMargin="72.999802" RightMargin="53.000198" TopMargin="3" BottomMargin="4" FontSize="20" LabelText="1" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="22" X="14" />
                        <AnchorPoint ScaleX="0" ScaleY="0.5" />
                        <Position X="72.999802" Y="15" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="0" G="0" R="255" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="summon_ten" ActionTag="-333959019" Tag="381" RotationSkewX="0" RotationSkewY="0" LeftMargin="394.000092" RightMargin="45.999901" TopMargin="716" BottomMargin="44" TouchEnable="True" LeftEage="102" RightEage="102" TopEage="42" BottomEage="42" Scale9OriginX="102" Scale9OriginY="42" Scale9Width="4" Scale9Height="4" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="88" X="280" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="534.000122" Y="88" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="timesummon_1013.png" Plist="resource/timesummon/timesummon.plist" />
                <Children>
                  <AbstractNodeData Name="Text_26" ActionTag="1661851849" Tag="386" RotationSkewX="0" RotationSkewY="0" LeftMargin="75.5" RightMargin="75.5" TopMargin="6.9999" BottomMargin="45.000099" FontSize="30" LabelText="祈愿10次" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="36" X="129" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="140" Y="63.000099" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="5" G="55" R="130" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="Image_43_0" ActionTag="-2128780821" Tag="391" RotationSkewX="0" RotationSkewY="0" LeftMargin="70" RightMargin="70" TopMargin="44.5" BottomMargin="14.5" LeftEage="5" RightEage="5" TopEage="9" BottomEage="9" Scale9OriginX="5" Scale9OriginY="9" Scale9Width="8" Scale9Height="11" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="29" X="140" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="140" Y="29" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="timesummon_1007.png" Plist="resource/timesummon/timesummon.plist" />
                    <Children>
                      <AbstractNodeData Name="ticket_img_0" ActionTag="-2090385657" Tag="124" RotationSkewX="0" RotationSkewY="0" LeftMargin="26.0012" RightMargin="67.998802" TopMargin="-9" BottomMargin="-8" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                        <Size Y="46" X="46" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="49.001202" Y="15" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="Default" Path="Default/Sprite.png" Plist="" />
                        <BlendFunc Dst="771" Src="1" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="ticket_num_0" ActionTag="440174556" Tag="396" RotationSkewX="0" RotationSkewY="0" LeftMargin="73.000603" RightMargin="41.999401" TopMargin="3" BottomMargin="4" FontSize="20" LabelText="10" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="22" X="25" />
                        <AnchorPoint ScaleX="0" ScaleY="0.5" />
                        <Position X="73.000603" Y="15" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="0" G="0" R="255" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="rewards_panel" ActionTag="-548875773" Tag="125" RotationSkewX="0" RotationSkewY="0" LeftMargin="25" RightMargin="25" TopMargin="541.256775" BottomMargin="148.077499" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="158.665695" X="670" />
                <AnchorPoint ScaleX="0.5" ScaleY="1" />
                <Position X="360" Y="306.743195" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
                <Children>
                  <AbstractNodeData Name="Image_1" ActionTag="1411735221" Tag="37" RotationSkewX="0" RotationSkewY="0" LeftMargin="66" RightMargin="514" TopMargin="73.665001" BottomMargin="-4.9993" LeftEage="36" RightEage="36" TopEage="36" BottomEage="36" Scale9OriginX="36" Scale9OriginY="36" Scale9Width="18" Scale9Height="18" ctype="ImageViewObjectData">
                    <Size Y="90" X="90" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="111" Y="40.000702" />
                    <Scale ScaleX="1.1" ScaleY="1.1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="timesummon_1015.png" Plist="resource/timesummon/timesummon.plist" />
                    <Children>
                      <AbstractNodeData Name="reward_1" ActionTag="1627295690" Tag="127" RotationSkewX="0" RotationSkewY="0" LeftMargin="22" RightMargin="22" TopMargin="22" BottomMargin="22" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                        <Size Y="46" X="46" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="45" Y="45" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="Default" Path="Default/Sprite.png" Plist="" />
                        <BlendFunc Dst="771" Src="1" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="touch_1" ActionTag="1302706803" Tag="50" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" TouchEnable="True" LeftEage="29" RightEage="29" TopEage="29" BottomEage="29" Scale9OriginX="29" Scale9OriginY="29" Scale9Width="32" Scale9Height="32" ctype="ImageViewObjectData">
                        <Size Y="90" X="90" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="45" Y="45" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="PlistSubImage" Path="timesummon_1017.png" Plist="resource/timesummon/timesummon.plist" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="Image_2" ActionTag="-107820089" Tag="38" RotationSkewX="0" RotationSkewY="0" LeftMargin="175.000107" RightMargin="404.999908" TopMargin="13.6657" BottomMargin="55" LeftEage="36" RightEage="36" TopEage="36" BottomEage="36" Scale9OriginX="36" Scale9OriginY="36" Scale9Width="18" Scale9Height="18" ctype="ImageViewObjectData">
                    <Size Y="90" X="90" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="220.000107" Y="100" />
                    <Scale ScaleX="1.1" ScaleY="1.1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="timesummon_1015.png" Plist="resource/timesummon/timesummon.plist" />
                    <Children>
                      <AbstractNodeData Name="reward_2" ActionTag="-422794555" Tag="128" RotationSkewX="0" RotationSkewY="0" LeftMargin="22" RightMargin="22" TopMargin="22" BottomMargin="22" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                        <Size Y="46" X="46" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="45" Y="45" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="Default" Path="Default/Sprite.png" Plist="" />
                        <BlendFunc Dst="771" Src="1" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="touch_2" ActionTag="1349296572" Tag="51" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" TouchEnable="True" LeftEage="29" RightEage="29" TopEage="29" BottomEage="29" Scale9OriginX="29" Scale9OriginY="29" Scale9Width="32" Scale9Height="32" ctype="ImageViewObjectData">
                        <Size Y="90" X="90" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="45" Y="45" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="PlistSubImage" Path="timesummon_1017.png" Plist="resource/timesummon/timesummon.plist" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="Image_3" ActionTag="-1074539529" Tag="39" RotationSkewX="0" RotationSkewY="0" LeftMargin="290" RightMargin="290" TopMargin="73.665703" BottomMargin="-5" LeftEage="36" RightEage="36" TopEage="36" BottomEage="36" Scale9OriginX="36" Scale9OriginY="36" Scale9Width="18" Scale9Height="18" ctype="ImageViewObjectData">
                    <Size Y="90" X="90" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="335" Y="40" />
                    <Scale ScaleX="1.1" ScaleY="1.1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="timesummon_1015.png" Plist="resource/timesummon/timesummon.plist" />
                    <Children>
                      <AbstractNodeData Name="reward_3" ActionTag="710508257" Tag="126" RotationSkewX="0" RotationSkewY="0" LeftMargin="22" RightMargin="22" TopMargin="22" BottomMargin="22" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                        <Size Y="46" X="46" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="45" Y="45" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="Default" Path="Default/Sprite.png" Plist="" />
                        <BlendFunc Dst="771" Src="1" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="touch_3" ActionTag="-998234125" Tag="52" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" TouchEnable="True" LeftEage="29" RightEage="29" TopEage="29" BottomEage="29" Scale9OriginX="29" Scale9OriginY="29" Scale9Width="32" Scale9Height="32" ctype="ImageViewObjectData">
                        <Size Y="90" X="90" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="45" Y="45" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="PlistSubImage" Path="timesummon_1017.png" Plist="resource/timesummon/timesummon.plist" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="Image_4" ActionTag="-1278107087" Tag="40" RotationSkewX="0" RotationSkewY="0" LeftMargin="399.999115" RightMargin="180.0009" TopMargin="13.6657" BottomMargin="55" LeftEage="36" RightEage="36" TopEage="36" BottomEage="36" Scale9OriginX="36" Scale9OriginY="36" Scale9Width="18" Scale9Height="18" ctype="ImageViewObjectData">
                    <Size Y="90" X="90" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="444.999115" Y="100" />
                    <Scale ScaleX="1.1" ScaleY="1.1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="timesummon_1015.png" Plist="resource/timesummon/timesummon.plist" />
                    <Children>
                      <AbstractNodeData Name="reward_4" ActionTag="-1845428665" Tag="129" RotationSkewX="0" RotationSkewY="0" LeftMargin="22" RightMargin="22" TopMargin="22" BottomMargin="22" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                        <Size Y="46" X="46" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="45" Y="45" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="Default" Path="Default/Sprite.png" Plist="" />
                        <BlendFunc Dst="771" Src="1" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="touch_4" ActionTag="-819631148" Tag="53" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" TouchEnable="True" LeftEage="29" RightEage="29" TopEage="29" BottomEage="29" Scale9OriginX="29" Scale9OriginY="29" Scale9Width="32" Scale9Height="32" ctype="ImageViewObjectData">
                        <Size Y="90" X="90" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="45" Y="45" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="PlistSubImage" Path="timesummon_1017.png" Plist="resource/timesummon/timesummon.plist" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="Image_5" ActionTag="1806582582" Tag="41" RotationSkewX="0" RotationSkewY="0" LeftMargin="508.997803" RightMargin="71.002197" TopMargin="73.665703" BottomMargin="-5" LeftEage="36" RightEage="36" TopEage="36" BottomEage="36" Scale9OriginX="36" Scale9OriginY="36" Scale9Width="18" Scale9Height="18" ctype="ImageViewObjectData">
                    <Size Y="90" X="90" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="553.997803" Y="40" />
                    <Scale ScaleX="1.1" ScaleY="1.1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="timesummon_1015.png" Plist="resource/timesummon/timesummon.plist" />
                    <Children>
                      <AbstractNodeData Name="reward_5" ActionTag="920979535" Tag="130" RotationSkewX="0" RotationSkewY="0" LeftMargin="22" RightMargin="22" TopMargin="22" BottomMargin="22" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                        <Size Y="46" X="46" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="45" Y="45" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="Default" Path="Default/Sprite.png" Plist="" />
                        <BlendFunc Dst="771" Src="1" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="touch_5" ActionTag="920698035" Tag="54" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" TouchEnable="True" LeftEage="29" RightEage="29" TopEage="29" BottomEage="29" Scale9OriginX="29" Scale9OriginY="29" Scale9Width="32" Scale9Height="32" ctype="ImageViewObjectData">
                        <Size Y="90" X="90" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="45" Y="45" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="PlistSubImage" Path="timesummon_1017.png" Plist="resource/timesummon/timesummon.plist" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="ticket_panel" ActionTag="267006952" Tag="303" RotationSkewX="0" RotationSkewY="0" LeftMargin="18" RightMargin="511.145905" TopMargin="22.2915" BottomMargin="775" TouchEnable="True" BackColorAlpha="102" Scale9Enable="True" LeftEage="14" RightEage="14" TopEage="14" BottomEage="14" Scale9OriginX="14" Scale9OriginY="14" Scale9Width="23" Scale9Height="26" ctype="PanelObjectData">
                <Size Y="50.7085" X="190.854095" />
                <AnchorPoint ScaleX="0" ScaleY="0" />
                <Position X="18" Y="775" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="timesummon_1014.png" Plist="resource/timesummon/timesummon.plist" />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
                <Children>
                  <AbstractNodeData Name="ticket_num" ActionTag="2133739768" Tag="305" RotationSkewX="0" RotationSkewY="0" LeftMargin="48.000599" RightMargin="54.8535" TopMargin="10.3543" BottomMargin="10.3542" FontSize="24" LabelText="999999" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="30" X="88" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="92.000603" Y="25.3542" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="0" G="0" R="0" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="ticket_image" ActionTag="1846646398" Tag="122" RotationSkewX="0" RotationSkewY="0" LeftMargin="13" RightMargin="131.854095" TopMargin="2.3543" BottomMargin="2.3542" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                    <Size Y="46" X="46" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="36" Y="25.3542" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="Default" Path="Default/Sprite.png" Plist="" />
                    <BlendFunc Dst="771" Src="1" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="add_btn" ActionTag="-1708417643" Tag="302" RotationSkewX="0" RotationSkewY="0" LeftMargin="139.999893" RightMargin="8.8542" TopMargin="4.3543" BottomMargin="4.3542" TouchEnable="True" LeftEage="13" RightEage="13" TopEage="13" BottomEage="13" Scale9OriginX="13" Scale9OriginY="13" Scale9Width="16" Scale9Height="16" ctype="ImageViewObjectData">
                    <Size Y="42" X="42" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="160.999893" Y="25.3542" />
                    <Scale ScaleX="0.8" ScaleY="0.8" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_1015.png" Plist="resource/common/common.plist" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="Image_14" ActionTag="1647453062" Tag="61" RotationSkewX="0" RotationSkewY="0" LeftMargin="108.630302" RightMargin="108.6306" TopMargin="731" BottomMargin="77" LeftEage="155" RightEage="155" TopEage="28" BottomEage="28" Scale9OriginX="155" Scale9OriginY="28" Scale9Width="5" Scale9Height="4" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="40" X="502.739105" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="359.999908" Y="97" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_90056.png" Plist="resource/common/common.plist" />
                <Children>
                  <AbstractNodeData Name="Text_4" ActionTag="1898225128" Tag="62" RotationSkewX="0" RotationSkewY="0" LeftMargin="119.869598" RightMargin="119.869598" TopMargin="9" BottomMargin="9" FontSize="20" LabelText="当前活动已结束，请前往兑换" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="22" X="263" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="251.369598" Y="20" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="0" G="0" R="255" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="Button_1" ActionTag="-2032143433" Tag="55" RotationSkewX="0" RotationSkewY="0" LeftMargin="286.731598" RightMargin="286.731598" TopMargin="766.5" BottomMargin="18.5" TouchEnable="True" Scale9Enable="True" LeftEage="30" RightEage="30" TopEage="29" BottomEage="29" Scale9OriginX="30" Scale9OriginY="29" Scale9Width="4" Scale9Height="5" ShadowOffsetX="2" ShadowOffsetY="-2" ButtonText="" FontSize="14" ctype="ButtonObjectData">
                <Size Y="63" X="146.536697" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="360" Y="50" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <NormalFileData Type="PlistSubImage" Path="common_1017.png" Plist="resource/common/common.plist" />
                <PressedFileData Type="PlistSubImage" Path="common_1017.png" Plist="resource/common/common.plist" />
                <DisabledFileData Type="Default" Path="Default/Button_Disable.png" Plist="" />
                <TextColor A="255" B="255" G="255" R="255" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <FontResource />
                <ShadowColor A="255" B="110" G="110" R="110" />
                <Children>
                  <AbstractNodeData Name="Text_3" ActionTag="-145588984" Tag="56" RotationSkewX="0" RotationSkewY="0" LeftMargin="22.7684" RightMargin="22.7684" TopMargin="16.5" BottomMargin="16.5" FontSize="24" LabelText="前往兑换" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="30" X="101" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="73.268402" Y="31.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="25" G="69" R="118" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
            </Children>
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>
