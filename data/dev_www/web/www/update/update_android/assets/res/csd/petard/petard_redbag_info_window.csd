<GameFile>
  <PropertyGroup Name="petard_redbag_info_window" Type="Layer" ID="vyh2z09wtcgnbr7u8f6mldjkop541aiexs3-" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.000000">
      </Animation>
      <ObjectData Name="root_wnd" ctype="GameNodeObjectData">
        <Size X="720.000000" Y="1280.000000" />
        <Children>
          <AbstractNodeData Name="background" ActionTag="1796359172" Tag="167" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="1.92" BottomMargin="-1.92" TouchEnable="True" ComboBoxIndex="1" BackColorAlpha="182" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size Y="1280" X="720" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360" Y="638.080017" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="0" G="0" R="0" />
          </AbstractNodeData>
          <AbstractNodeData Name="main_container" ActionTag="-1706025819" Tag="168" RotationSkewX="0" RotationSkewY="0" LeftMargin="117.5" RightMargin="117.5" TopMargin="260.5" BottomMargin="260.5" TouchEnable="True" FrameEvent="end_frame" BackColorAlpha="102" Scale9Enable="True" LeftEage="-106" RightEage="-106" TopEage="-40" BottomEage="-40" Scale9OriginX="-106" Scale9OriginY="-40" Scale9Width="204" Scale9Height="103" ctype="PanelObjectData">
            <Size Y="759" X="485" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360" Y="640" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="255" G="200" R="150" />
            <Children>
              <AbstractNodeData Name="image_bg" ActionTag="653714304" Tag="169" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" LeftEage="30" RightEage="30" TopEage="30" BottomEage="30" Scale9OriginX="30" Scale9OriginY="30" Scale9Width="425" Scale9Height="699" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="759" X="485" />
                <AnchorPoint ScaleX="0.5" ScaleY="0" />
                <Position X="242.5" Y="0" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="Normal" Path="resource/bigbg/action/action_petard_redbag.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="close_btn" ActionTag="1910443071" Tag="178" RotationSkewX="0" RotationSkewY="0" LeftMargin="433.499512" RightMargin="-5.4995" TopMargin="40.500099" BottomMargin="665.499878" TouchEnable="True" LeftEage="18" RightEage="18" TopEage="20" BottomEage="20" Scale9OriginX="18" Scale9OriginY="20" Scale9Width="21" Scale9Height="13" ctype="ImageViewObjectData">
                <Size Y="53" X="57" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="461.999512" Y="691.999878" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="Default" Path="Default/ImageFile.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="list_panel" ActionTag="-22632888" Tag="175" RotationSkewX="0" RotationSkewY="0" LeftMargin="15.5" RightMargin="16.5" TopMargin="256" BottomMargin="45" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="458" X="453" />
                <AnchorPoint ScaleX="0.5" ScaleY="0" />
                <Position X="242" Y="45" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
              </AbstractNodeData>
              <AbstractNodeData Name="num_txt" ActionTag="392191449" Tag="176" RotationSkewX="0" RotationSkewY="0" LeftMargin="176.5" RightMargin="176.5" TopMargin="725" BottomMargin="8" FontSize="20" LabelText="剩余个数:0/10" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="26" X="132" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="242.5" Y="21" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="35" G="50" R="100" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
            </Children>
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>
