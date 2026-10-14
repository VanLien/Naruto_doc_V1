<GameFile>
  <PropertyGroup Name="new_daily_gift_window" Type="Layer" ID="r3zghd-95jyu1wlbvacx8p26e4s7ionktmq0" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.000000">
        <Timeline ActionTag="35617124" Property="Position">
          <PointFrame FrameIndex="0" X="360.000000" Y="640.000000">
            <EasingData Type="0" />
          </PointFrame>
        </Timeline>
        <Timeline ActionTag="35617124" Property="Scale">
          <ScaleFrame FrameIndex="0" X="1.000000" Y="1.000000">
            <EasingData Type="0" />
          </ScaleFrame>
        </Timeline>
        <Timeline ActionTag="35617124" Property="RotationSkew">
          <ScaleFrame FrameIndex="0" X="0.000000" Y="0.000000">
            <EasingData Type="0" />
          </ScaleFrame>
        </Timeline>
        <Timeline ActionTag="35617124" Property="Alpha">
          <IntFrame FrameIndex="0" Value="255">
            <EasingData Type="0" />
          </IntFrame>
        </Timeline>
      </Animation>
      <ObjectData Name="root_wnd" ctype="GameNodeObjectData">
        <Size X="720.000000" Y="1280.000000" />
        <Children>
          <AbstractNodeData Name="background" ActionTag="-447703528" Tag="53" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" TouchEnable="True" ComboBoxIndex="1" BackColorAlpha="178" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size Y="1280" X="720" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360" Y="640" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="0" G="0" R="0" />
          </AbstractNodeData>
          <AbstractNodeData Name="main_container" ActionTag="35617124" Tag="54" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" BackColorAlpha="75" Scale9Enable="True" LeftEage="-14" RightEage="-14" TopEage="-39" BottomEage="-39" Scale9OriginX="-14" Scale9OriginY="-39" Scale9Width="28" Scale9Height="78" ctype="PanelObjectData">
            <Size Y="1280" X="720" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360" Y="640" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="0" G="0" R="0" />
            <Children>
              <AbstractNodeData Name="container" ActionTag="-1401090933" Tag="55" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="246" BottomMargin="240" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="794" X="720" />
                <AnchorPoint ScaleX="0.5" ScaleY="0" />
                <Position X="360" Y="240" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
                <Children>
                  <AbstractNodeData Name="bgImg" ActionTag="1780077217" Tag="58" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="-216.410004" BottomMargin="-269.589996" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                    <Size Y="1280" X="720" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="360" Y="370.410004" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="dailypack_3.png" Plist="resource/dailypack/dailypack.plist" />
                    <BlendFunc Dst="771" Src="1" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="title_img" ActionTag="793464596" Tag="74" RotationSkewX="0" RotationSkewY="0" LeftMargin="209.5" RightMargin="209.5" TopMargin="-101.999001" BottomMargin="831.999023" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                    <Size Y="64" X="301" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0" />
                    <Position X="360" Y="831.999023" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="txt_cn_dailypack_1.png" Plist="resource/dailypack/dailypack.plist" />
                    <BlendFunc Dst="771" Src="1" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="Panel_8" ActionTag="1426199086" Tag="136" RotationSkewX="0" RotationSkewY="0" LeftMargin="214.310394" RightMargin="305.689606" TopMargin="-33.048199" BottomMargin="800.75" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size Y="26.298201" X="200" />
                    <AnchorPoint ScaleX="0" ScaleY="0" />
                    <Position X="214.310394" Y="800.75" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData />
                    <FirstColor A="255" B="255" G="200" R="150" />
                    <EndColor A="255" B="255" G="255" R="255" />
                    <ColorVector ScaleX="0" ScaleY="1" />
                    <SingleColor A="255" B="255" G="200" R="150" />
                    <Children>
                      <AbstractNodeData Name="time_txt" ActionTag="1957897559" Tag="179" RotationSkewX="0" RotationSkewY="0" LeftMargin="40.82" RightMargin="133.179993" TopMargin="-7.2018" BottomMargin="0.5" FontSize="24" LabelText="---" OutlineEnabled="True" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="33" X="26" />
                        <AnchorPoint ScaleX="0" ScaleY="0.5" />
                        <Position X="40.82" Y="17" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="0" G="255" R="0" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="0" G="0" R="0" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="time_tips" ActionTag="-351852292" Tag="42" RotationSkewX="0" RotationSkewY="0" LeftMargin="3.54" RightMargin="170.460007" TopMargin="-7.2018" BottomMargin="0.5" FontSize="24" LabelText="---" OutlineEnabled="True" OutlineSize="1" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                        <Size Y="33" X="26" />
                        <AnchorPoint ScaleX="0" ScaleY="0.5" />
                        <Position X="3.54" Y="17" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <OutlineColor A="255" B="0" G="0" R="0" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="close_btn" ActionTag="1211968311" Tag="57" RotationSkewX="0" RotationSkewY="0" LeftMargin="655.210815" RightMargin="0.7892" TopMargin="-80.195999" BottomMargin="809.195984" TouchEnable="True" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="16" Scale9Height="24" ShadowOffsetX="2" ShadowOffsetY="-2" ButtonText="" FontSize="14" ctype="ButtonObjectData">
                    <Size Y="65" X="64" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="687.210815" Y="841.695984" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <NormalFileData Type="PlistSubImage" Path="newfirstcharge1_1.png" Plist="resource/newfirstcharge1/newfirstcharge1.plist" />
                    <PressedFileData Type="Default" Path="Default/Button_Press.png" Plist="" />
                    <DisabledFileData Type="Default" Path="Default/Button_Disable.png" Plist="" />
                    <TextColor A="255" B="70" G="65" R="65" />
                    <OutlineColor A="255" B="0" G="0" R="255" />
                    <FontResource />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="scroller" ActionTag="1563343053" Tag="138" RotationSkewX="0" RotationSkewY="0" LeftMargin="52.007999" RightMargin="49.992001" TopMargin="19.639299" BottomMargin="-127.000099" TouchEnable="True" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size Y="901.360779" X="618" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0" />
                    <Position X="361.007996" Y="-127.000099" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData />
                    <FirstColor A="255" B="255" G="200" R="150" />
                    <EndColor A="255" B="255" G="255" R="255" />
                    <ColorVector ScaleX="0" ScaleY="1" />
                    <SingleColor A="255" B="255" G="200" R="150" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="shop_btn" ActionTag="1940913078" Tag="266" RotationSkewX="0" RotationSkewY="0" LeftMargin="498.30899" RightMargin="52.691002" TopMargin="-155.514893" BottomMargin="792.514893" TouchEnable="True" LeftEage="55" RightEage="55" TopEage="51" BottomEage="51" Scale9OriginX="55" Scale9OriginY="51" Scale9Width="59" Scale9Height="55" ctype="ImageViewObjectData">
                    <Size Y="157" X="169" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="582.809021" Y="871.014893" />
                    <Scale ScaleX="0.85" ScaleY="0.85" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="welfare_42.png" Plist="resource/welfare/welfare.plist" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="Sprite_1" ActionTag="-457053586" Tag="32" RotationSkewX="0" RotationSkewY="0" LeftMargin="555.991089" RightMargin="8.0089" TopMargin="770.977478" BottomMargin="-182.977493" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                    <Size Y="206" X="156" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="633.991089" Y="-79.977501" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="dailypack_2.png" Plist="resource/dailypack/dailypack.plist" />
                    <BlendFunc Dst="771" Src="1" />
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
