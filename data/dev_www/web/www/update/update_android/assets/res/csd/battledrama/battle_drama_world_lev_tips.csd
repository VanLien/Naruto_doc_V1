<GameFile>
  <PropertyGroup Name="battle_drama_world_lev_tips" Type="Layer" ID="pd2clafn7-5i3xu6vyqemsg4joht0k8b9w1r" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.000000">
      </Animation>
      <ObjectData Name="root_wnd" ctype="GameNodeObjectData">
        <Size X="720.000000" Y="1280.000000" />
        <Children>
          <AbstractNodeData Name="background" ActionTag="-1065927765" Tag="289" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size Y="1280" X="720" />
            <AnchorPoint ScaleX="0" ScaleY="0" />
            <Position X="0" Y="0" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="255" G="200" R="150" />
          </AbstractNodeData>
          <AbstractNodeData Name="main_panel" ActionTag="1652955746" Tag="49" RotationSkewX="0" RotationSkewY="0" LeftMargin="158" RightMargin="138" TopMargin="239" BottomMargin="703" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size Y="338" X="424" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="370" Y="872" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="255" G="200" R="150" />
            <Children>
              <AbstractNodeData Name="bg" ActionTag="1559203089" Tag="50" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" LeftEage="96" RightEage="96" TopEage="72" BottomEage="72" Scale9OriginX="96" Scale9OriginY="72" Scale9Width="4" Scale9Height="13" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="338" X="424" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="212" Y="169" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_90035.png" Plist="resource/common/common.plist" />
              </AbstractNodeData>
              <AbstractNodeData Name="close_btn" ActionTag="281447094" Tag="51" RotationSkewX="0" RotationSkewY="0" LeftMargin="384.150604" RightMargin="-19.1506" TopMargin="-17.1574" BottomMargin="284.15741" TouchEnable="True" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="29" Scale9Height="49" ShadowOffsetX="2" ShadowOffsetY="-2" ButtonText="" FontSize="14" ctype="ButtonObjectData">
                <Size Y="62" X="70" />
                <AnchorPoint ScaleX="0.5398" ScaleY="0.4344" />
                <Position X="415.99881" Y="314.999786" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <NormalFileData Type="PlistSubImage" Path="common_1028.png" Plist="resource/common/common.plist" />
                <PressedFileData Type="Default" Path="Default/Button_Press.png" Plist="" />
                <DisabledFileData Type="Default" Path="Default/Button_Disable.png" Plist="" />
                <TextColor A="255" B="70" G="65" R="65" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <FontResource />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="Sprite_1" ActionTag="1261278800" Tag="78" RotationSkewX="0" RotationSkewY="0" LeftMargin="59.498199" RightMargin="319.501801" TopMargin="37.502201" BottomMargin="259.497803" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="41" X="45" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="81.998199" Y="279.997803" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="txt_cn_world_lev.png" Plist="resource/common/common.plist" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="lev_label" ActionTag="-1019793856" Tag="77" RotationSkewX="0" RotationSkewY="0" LeftMargin="192.998199" RightMargin="180.001801" TopMargin="157" BottomMargin="157" FontSize="22" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="24" X="51" />
                <AnchorPoint ScaleX="0" ScaleY="0.5" />
                <Position X="192.998199" Y="169" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="3" G="144" R="36" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="cur_label" ActionTag="1931616229" Tag="82" RotationSkewX="0" RotationSkewY="0" LeftMargin="48" RightMargin="233" TopMargin="157" BottomMargin="157" FontSize="22" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="24" X="143" />
                <AnchorPoint ScaleX="0" ScaleY="0.5" />
                <Position X="48" Y="169" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="42" G="69" R="104" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="Sprite_11" ActionTag="165454844" Tag="285" RotationSkewX="0" RotationSkewY="0" LeftMargin="188.5" RightMargin="182.5" TopMargin="87" BottomMargin="249" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="2" X="53" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="215" Y="250" />
                <Scale ScaleX="6.5974" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1016.png" Plist="resource/common/common.plist" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="title_label" ActionTag="-1665521280" Tag="286" RotationSkewX="0" RotationSkewY="0" LeftMargin="115" RightMargin="203" TopMargin="42" BottomMargin="268" FontSize="26" LabelText="---" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="28" X="106" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="168" Y="282" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="3" G="144" R="36" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="255" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
            </Children>
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>
