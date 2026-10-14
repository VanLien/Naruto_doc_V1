<GameFile>
  <PropertyGroup Name="role_honor_unlock_panel" Type="Layer" ID="4m7-0h1p2v3glyfq8ckuitx5za9jb6swerod" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="13" Speed="1.000000">
        <Timeline ActionTag="-516190194" Property="Position">
          <PointFrame FrameIndex="0" X="360.000000" Y="540.000000">
            <EasingData Type="0" />
          </PointFrame>
          <PointFrame FrameIndex="7" X="360.000000" Y="650.000000">
            <EasingData Type="0" />
          </PointFrame>
          <PointFrame FrameIndex="13" X="360.000000" Y="640.000000">
            <EasingData Type="0" />
          </PointFrame>
        </Timeline>
        <Timeline ActionTag="-516190194" Property="Scale">
          <ScaleFrame FrameIndex="0" X="1.000000" Y="1.000000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="7" X="1.000000" Y="1.000000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="13" X="1.000000" Y="1.000000">
            <EasingData Type="0" />
          </ScaleFrame>
        </Timeline>
        <Timeline ActionTag="-516190194" Property="RotationSkew">
          <ScaleFrame FrameIndex="0" X="0.000000" Y="0.000000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="7" X="0.000000" Y="0.000000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="13" X="0.000000" Y="0.000000">
            <EasingData Type="0" />
          </ScaleFrame>
        </Timeline>
        <Timeline ActionTag="-516190194" Property="Alpha">
          <IntFrame FrameIndex="0" Value="0">
            <EasingData Type="0" />
          </IntFrame>
          <IntFrame FrameIndex="7" Value="200">
            <EasingData Type="0" />
          </IntFrame>
          <IntFrame FrameIndex="13" Value="255">
            <EasingData Type="0" />
          </IntFrame>
        </Timeline>
      </Animation>
      <ObjectData Name="root_wnd" ctype="GameNodeObjectData">
        <Size X="720.000000" Y="1280.000000" />
        <Children>
          <AbstractNodeData Name="background" ActionTag="396430204" Tag="30" RotationSkewX="0" RotationSkewY="0" LeftMargin="-2" RightMargin="-2" TopMargin="-2" BottomMargin="-2" TouchEnable="True" FrameEvent="end_frame" ComboBoxIndex="1" BackColorAlpha="197" LeftEage="-237" RightEage="-237" TopEage="-422" BottomEage="-422" Scale9OriginX="-237" Scale9OriginY="-422" Scale9Width="474" Scale9Height="844" ctype="PanelObjectData">
            <Size Y="1284" X="724" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360" Y="640" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="0" G="0" R="0" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="0" G="0" R="0" />
          </AbstractNodeData>
          <AbstractNodeData Name="main_container" ActionTag="-516190194" Tag="18" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="432.5" BottomMargin="232.5" TouchEnable="True" Alpha="0" BackColorAlpha="153" Scale9Enable="True" LeftEage="-44" RightEage="-44" TopEage="-2" BottomEage="-2" Scale9OriginX="-44" Scale9OriginY="-2" Scale9Width="88" Scale9Height="4" ctype="PanelObjectData">
            <Size Y="615" X="720" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360" Y="540" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="0" G="255" R="255" />
            <Children>
              <AbstractNodeData Name="title_sprite" ActionTag="1535313730" Tag="11" RotationSkewX="0" RotationSkewY="0" LeftMargin="337" RightMargin="337" TopMargin="84" BottomMargin="485" CallBackType="None" CallBackName="None" ctype="SpriteObjectData">
                <Size Y="46" X="46" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="360" Y="508" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="Default" Path="Default/Sprite.png" Plist="" />
                <BlendFunc Dst="771" Src="1" />
              </AbstractNodeData>
              <AbstractNodeData Name="title_icon_effect" ActionTag="1409252360" Tag="12" RotationSkewX="0" RotationSkewY="0" LeftMargin="310" RightMargin="310" TopMargin="208" BottomMargin="307" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size Y="100" X="100" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="360" Y="357" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
              </AbstractNodeData>
              <AbstractNodeData Name="item_node" ActionTag="-1737469711" Tag="63" RotationSkewX="0" RotationSkewY="0" LeftMargin="360" RightMargin="360" TopMargin="254" BottomMargin="361" CallBackType="None" CallBackName="None" ctype="SingleNodeObjectData">
                <Size Y="0" X="0" />
                <AnchorPoint ScaleX="0" ScaleY="0" />
                <Position X="360" Y="361" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
              </AbstractNodeData>
              <AbstractNodeData Name="name" ActionTag="324637031" Tag="64" RotationSkewX="0" RotationSkewY="0" LeftMargin="334.5" RightMargin="334.5" TopMargin="396" BottomMargin="189" FontSize="24" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                <Size Y="30" X="51" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="360" Y="204" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                <OutlineColor A="255" B="0" G="0" R="0" />
                <ShadowColor A="255" B="110" G="110" R="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="close_btn" ActionTag="65654257" Tag="61" RotationSkewX="0" RotationSkewY="0" LeftMargin="121.599998" RightMargin="438.399994" TopMargin="506.579987" BottomMargin="44.419998" TouchEnable="True" LeftEage="17" RightEage="17" TopEage="17" BottomEage="17" Scale9OriginX="17" Scale9OriginY="17" Scale9Width="30" Scale9Height="29" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="64" X="160" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="201.600006" Y="76.419998" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1017.png" Plist="resource/common/common.plist" />
                <Children>
                  <AbstractNodeData Name="label" ActionTag="1962664240" Tag="62" RotationSkewX="0" RotationSkewY="0" LeftMargin="49.5" RightMargin="49.5" TopMargin="16" BottomMargin="16" FontSize="26" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="32" X="61" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="80" Y="32" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="25" G="69" R="118" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
              <AbstractNodeData Name="share_btn" ActionTag="-1354775691" Tag="99" RotationSkewX="0" RotationSkewY="0" LeftMargin="460" RightMargin="100" TopMargin="508.5" BottomMargin="45.5" TouchEnable="True" LeftEage="17" RightEage="17" TopEage="17" BottomEage="17" Scale9OriginX="17" Scale9OriginY="17" Scale9Width="30" Scale9Height="29" Scale9Enable="True" ctype="ImageViewObjectData">
                <Size Y="61" X="160" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="540" Y="76" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1018.png" Plist="resource/common/common.plist" />
                <Children>
                  <AbstractNodeData Name="label" ActionTag="-404206035" Tag="100" RotationSkewX="0" RotationSkewY="0" LeftMargin="49" RightMargin="49" TopMargin="14.5" BottomMargin="14.5" FontSize="26" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="32" X="62" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="80" Y="30.5" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="21" G="74" R="41" />
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
